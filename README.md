# Data Engineer: Azure com Dados Públicos

Este projeto apresenta uma arquitetura de dados desenvolvida sobre a plataforma Microsoft Azure, com o objetivo de processar e analisar dados públicos com relevância social. A solução segue boas práticas de engenharia de dados e foi desenhada com foco em escalabilidade, modularidade e governança.

## Objetivo

Implementar uma arquitetura moderna de ingestão e processamento de dados públicos brasileiros, com tratamento automatizado e visualização interativa via Power BI, utilizando serviços nativos da Azure e padrões arquiteturais robustos.

## Arquitetura Técnica

- **Ingestão**: dados públicos estruturados (CSV, JSON) armazenados no Azure Blob Storage.
- **Orquestração**: pipelines ELT implementados no Azure Data Factory, com triggers parametrizadas.
- **Transformação**: execução de notebooks PySpark no Azure Databricks, organizados em camadas (bronze, silver, gold).
- **Armazenamento Relacional**: dados tratados persistidos no Azure SQL Database.
- **Visualização**: exposição de KPIs e painéis analíticos no Power BI.
- **Provisionamento (opcional)**: templates ARM/Bicep para automação da infraestrutura.

## Tecnologias Utilizadas

- Azure Data Factory
- Azure Blob Storage
- Azure Databricks (PySpark)
- Azure SQL Database
- Power BI
- GitHub e GitHub Actions (CI/CD)
- Infraestrutura como Código (Bicep/ARM)

## Estrutura do Repositório

/data → Dados organizados por camadas:  
  /data/raw  
  /data/bronze  
  /data/silver  
  /data/gold  

/docs → Diagramas, prints do dashboard e documentação complementar  

/infrastructure → Templates de provisionamento de recursos na Azure (ex: Bicep, ARM, Terraform)  

/notebooks → Notebooks Databricks com transformações e modelagens em PySpark  

/pipelines → Artefatos do Azure Data Factory (pipelines, datasets, linked services)  

/scripts → Scripts auxiliares para cargas em lote (batch) ou fluxo contínuo (streaming)  

/README.md → Documento principal com visão geral e instruções do projeto
