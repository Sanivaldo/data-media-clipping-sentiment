Engenharia de Dados: Azure com Dados Públicos

Este repositório apresenta uma arquitetura moderna de dados construída com serviços da Microsoft Azure, voltada para ingestão, processamento e análise de dados públicos com relevância social. A solução foi projetada com foco em escalabilidade, modularidade e boas práticas de governança.

Objetivo
Desenvolver uma pipeline completa e automatizada para ingestão e transformação de dados públicos brasileiros, com exposição de resultados analíticos por meio de dashboards interativos no Power BI.

-------------------------------------------------------------------------------------------------------------------

Arquitetura:

Ingestão: arquivos CSV, XLSX e JSON armazenados no Azure Data Lake Storage (camada raw).

Orquestração: pipelines no Azure Data Factory com parametrização e triggers.

Transformação: notebooks PySpark no Azure Databricks, com dados organizados nas camadas bronze, silver e gold.

Armazenamento relacional: carga dos dados tratados no Azure SQL Database.

Visualização: painéis analíticos criados no Power BI.

Provisionamento: templates de infraestrutura como código utilizando Bicep ou ARM.

-------------------------------------------------------------------------------------------------------------------

Tecnologias usadas:

Azure Data Factory

Azure Databricks

Azure Data Lake Gen2

Azure SQL Database

Power BI

GitHub e GitHub Actions

Infraestrutura como Código (Bicep, ARM)

-------------------------------------------------------------------------------------------------------------------

Estrutura do Repositório

bash

Copy

Edit

/data

  /raw           - Dados brutos
  
  /bronze        - Dados com ingestão inicial
  
  /silver        - Dados limpos e estruturados
  
  /gold          - Dados prontos para análise
  

/docs            - Documentação e diagramas

/infrastructure  - Templates de IaC para provisionamento

/notebooks       - Notebooks PySpark utilizados no Databricks

/pipelines       - Artefatos JSON exportados do Azure Data Factory

/scripts         - Scripts auxiliares para ingestão e processamento

README.md        - Visão geral do projeto

-------------------------------------------------------------------------------------------------------------------

Segurança:

Por motivos de segurança, todas as chaves e credenciais nos notebooks e scripts foram substituídas ou omitidas. Em ambientes de produção, recomenda-se o uso de Azure Key Vault, variáveis de ambiente ou secrets seguros para gerenciamento de credenciais.
