
# --- PROVEDORES ---
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.101.0"
    }
  }
  required_version = ">= 1.0"
}

provider "azurerm" {
  features {}
  # Defina sua assinatura aqui se tiver múltiplas e não definiu via `az login`
    
}

# --- VARIÁVEIS COMUNS ---
variable "resource_group_name" {
  description = "Nome do Grupo de Recursos"
  type        = string
  default     = "rg-censo-analysis-project" # Use o nome que você já criou no Azure Portal
}

variable "location" {
  description = "Região do Azure"
  type        = string
  default     = "brazilsouth" # Use a região que você já está usando (Brazil South)
}

variable "adls_storage_account_name" {
  description = "Nome da conta ADLS Gen2"
  type        = string
  default     = "stcensodados" # <--- SUBSTITUA AQUI PELO NOME DA SUA CONTA ADLS GEN2
}

variable "synapse_workspace_name" {
  description = "Nome do workspace Synapse"
  type        = string
  default     = "syn-censo-analise-2025" # Use o nome que você já criou no Azure Portal
}

variable "adf_name" {
  description = "Nome do Data Factory"
  type        = string
  default     = "adf-censo-data-pipelines-2025" # Use o nome que você já criou no Azure Portal
}

# --- RECURSOS AZURE ---

# 1. Resource Group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# 2. Azure Data Lake Storage Gen2 (Storage Account)
resource "azurerm_storage_account" "adlsgen2" {
  name                     = var.adls_storage_account_name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS" # Mais barato
  is_hns_enabled           = true # Habilita o Data Lake Storage Gen2

  # Camadas de acesso (hot/cool) - Pode ser configurado aqui, mas vamos deixar default por enquanto
  # access_tier = "Hot" # Descomente se quiser definir a camada padrão (Hot, Cool)

  blob_properties {
    default_service_version = "2023-01-03" # Ou uma versão mais recente
  }
}

# Contêineres (File Systems) dentro do ADLS Gen2
resource "azurerm_storage_container" "raw" {
  name                  = "raw"
  storage_account_name  = azurerm_storage_account.adlsgen2.name
  container_access_type = "private" # Geralmente 'private' para dados brutos
}

resource "azurerm_storage_container" "processed" {
  name                  = "processed"
  storage_account_name  = azurerm_storage_account.adlsgen2.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "analytics" {
  name                  = "analytics"
  storage_account_name  = azurerm_storage_account.adlsgen2.name
  container_access_type = "private"
}

# 3. Azure Synapse Analytics Workspace
resource "azurerm_synapse_workspace" "main" {
  name                                = var.synapse_workspace_name
  resource_group_name                 = azurerm_resource_group.main.name
  location                            = azurerm_resource_group.main.location
  storage_data_lake_gen2_filesystem_id = "https://${azurerm_storage_account.adlsgen2.name}.dfs.core.windows.net/${azurerm_storage_container.raw.name}" # Aponta para o contêiner 'raw' como padrão

  # Configurações de rede
  public_network_access_enabled = true # Permitir acesso de IPs públicos
  # managed_virtual_network_enabled = false # Desabilitado, como configuramos

  identity {
    type = "SystemAssigned" # Habilita a Managed Identity (Identidade Gerenciada pelo Sistema)
  }

  # Não é necessário atribuir a função Blob Data Contributor aqui para a Managed Identity
  # O Synapse geralmente lida com isso automaticamente após a criação do workspace.
  # Se houver problemas de permissão mais tarde, podemos adicionar um azurerm_role_assignment.
}


# 5. Azure Data Factory
resource "azurerm_data_factory" "main" {
  name                = var.adf_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  # Configuração do Git. Isso define onde o ADF deve olhar no GitHub.
  # A *conexão real* (autorização OAuth) ainda precisa ser feita manualmente no ADF Studio a primeira vez.

}