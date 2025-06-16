Data Engineer: Azure com Dados Públicos
Este projeto demonstra uma arquitetura moderna de dados implementada na Microsoft Azure para ingestão, processamento e análise de dados públicos brasileiros, com ênfase em relevância social, escalabilidade e boas práticas de engenharia de dados.

🎯 Objetivo
Desenvolver uma solução ponta a ponta capaz de ingerir, transformar e disponibilizar dados públicos de forma automatizada e segura, com visualização interativa via Power BI.

🔧 Arquitetura Técnica
Ingestão: arquivos públicos em formatos como CSV, XLSX e JSON armazenados no Azure Data Lake Storage (camada raw).

Orquestração: pipelines parametrizados no Azure Data Factory.

Transformação: notebooks em PySpark no Azure Databricks organizados em camadas (Bronze → Silver → Gold).

Armazenamento Analítico: dados tratados persistidos no Azure SQL Database.

Visualização: dashboards dinâmicos e KPIs construídos no Power BI.

Provisionamento: templates de infraestrutura como código (Bicep/ARM/Terraform).

🧰 Tecnologias Utilizadas
Azure Data Factory

Azure Databricks

Azure Data Lake Gen2

Azure SQL Database

Power BI

GitHub + GitHub Actions (CI/CD)

Infraestrutura como Código (IaC)

📁 Estrutura do Repositório
bash
Copy
Edit
/data
  /raw           → Dados brutos
  /bronze        → Dados com ingestão inicial
  /silver        → Dados limpos e estruturados
  /gold          → Dados prontos para análise

/docs            → Documentação e diagramas
/infrastructure  → Templates de IaC para deploy na Azure
/notebooks       → Notebooks PySpark (Databricks)
/pipelines       → Artefatos do ADF (JSON)
/scripts         → Scripts auxiliares
README.md        → Visão geral do projeto
🔒 Segurança
Este repositório não contém nenhuma credencial sensível em texto plano. Todas as chaves, IDs e segredos apresentados nos exemplos foram alterados ou mascarados por motivos de segurança. Em projetos reais, recomenda-se o uso de Azure Key Vault, secrets do GitHub ou variáveis de ambiente.
