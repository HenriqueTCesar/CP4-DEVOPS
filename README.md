# Checkpoint 4 - DevOps & Cloud Computing (Projeto DimDim)

## 👥 Integrantes e RM
- **RM:** RM563088
- **Nome:** Henrique Teixeira Cesar

---

## 📌 Sobre o Projeto
Este repositório contém a solução desenvolvida para o Checkpoint 4, utilizando containers Docker (`Banco de Dados PostgreSQL` e `Aplicação Java`) implantados e orquestrados na nuvem da Microsoft Azure através do Azure Container Instances (ACI), atendendo a todas as regras de segurança sem privilégios de root e persistência em nuvem.

---

## 🚀 How-To / Tutorial de Execução (Azure CLI)

Todos os recursos de nuvem foram criados e gerenciados via linha de comando utilizando a Azure CLI. Siga os passos abaixo para reproduzir o ambiente:

### 1. Criar o Resource Group
```bash
az group create --name rm563088-rg --location eastus
```

### 2. Criar a Storage Account
```bash
az storage account create --name rm563088storage --resource-group rm563088-rg --location eastus --sku Standard_LRS
```

### 3. Subir o Container do Banco de Dados PostgreSQL
```bash
az container create --resource-group rm563088-rg --name rm563088-db --image postgres:15-alpine --os-type Linux --ip-address Public --ports 5432 --cpu 1 --memory 1.5 --environment-variables POSTGRES_DB=dimdim_db POSTGRES_USER=dimdim_user POSTGRES_PASSWORD='SenhaSegura123!'
```
### 4. Subir o Container da Aplicação Java
```bash
az container create --resource-group rm563088-rg --name rm563088-app --image <sua-imagem-no-acr> --os-type Linux --ip-address Public --ports 8080 --cpu 1 --memory 1.5 --environment-variables SPRING_DATASOURCE_URL=jdbc:postgresql://<IP_DO_BANCO>:5432/dimdim_db SPRING_DATASOURCE_USERNAME=dimdim_user SPRING_DATASOURCE_PASSWORD='SenhaSegura123!' SPRING_JPA_HIBERNATE_DDL_AUTO=update
```
### 5. Comandos de Build e Push Docker
```bash
docker build -t rm563088-app:latest -f ProjetoJava/Dockerfile .
az acr login --name <seu-acr>
docker tag rm563088-app:latest <seu-acr>.azurecr.io/rm563088-app:latest
docker push <seu-acr>.azurecr.io/rm563088-app:latest
```
### Estrutura do Repositório

- **script.sql:** Script DDL para criação da tabela.

- **payloads/:** Arquivos JSON de teste (GET, POST, PUT, DELETE).

- **ProjetoJava/:** Código-fonte da aplicação.

