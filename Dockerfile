# Etapa de build com Java 24 e Maven
FROM eclipse-temurin:24-jdk AS build

RUN apt-get update && apt-get install -y maven

COPY todolist /app
WORKDIR /app

RUN ls -l /app   # Verifica se o pom.xml está mesmo aqui

RUN mvn clean install

# Etapa de execução com Java 24
FROM eclipse-temurin:24-jdk
EXPOSE 8080

COPY --from=build /app/target/todolist-1.0.0.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
