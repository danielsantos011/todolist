FROM ubuntu:latest AS build

RUN apt-get update && apt-get install -y openjdk-17-jdk maven

WORKDIR /app
COPY . .

RUN ls -l /app   # Aqui vai mostrar os arquivos para confirmar se pom.xml está

RUN mvn clean install

FROM openjdk:17-jdk-slim
EXPOSE 8080

COPY --from=build /app/target/todolist-1.0.0.jar app.jar

ENTRYPOINT [ "java", "-jar", "app.jar" ]
