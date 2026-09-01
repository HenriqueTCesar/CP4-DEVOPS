# Estágio 1: O Docker baixa o Maven e o Java para compilar o código
FROM maven:3.9.4-eclipse-temurin-17 AS builder
WORKDIR /app
# Copia os arquivos do seu computador para dentro do Docker
COPY pom.xml .
COPY src ./src
# O próprio Docker gera o arquivo .jar
RUN mvn clean package -DskipTests

# Estágio 2: O Docker cria a imagem final leve e segura (Regra do CP4)
FROM eclipse-temurin:17-jre-alpine
RUN addgroup -S dimdimgroup && adduser -S dimdimuser -G dimdimgroup
USER dimdimuser:dimdimgroup

WORKDIR /app
# O Docker pega o .jar gerado no Estágio 1 e coloca na imagem final
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]