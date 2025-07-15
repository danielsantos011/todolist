FROM ubuntu:latest AS build

RUN apt-get update 
RUN apt-get install openjdk-17-jdk -y

# Adiciona diretório de trabalho antes de copiar os arquivos
WORKDIR /app

COPY . .

RUN apt-get install maven -y
RUN mvn clean install

FROM openjdk:17-jdk-slim
EXPOSE 8080

# Corrige o caminho do .jar gerado pelo Maven
COPY --from=build /app/target/todolist-1.0.0.jar app.jar

ENTRYPOINT [ "java", "-jar", "app.jar" ]
