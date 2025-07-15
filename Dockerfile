FROM ubuntu:latest

# Atualiza e instala dependências necessárias
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk maven

# Define diretório de trabalho
WORKDIR /app

# Copia os arquivos do projeto para o container
COPY . .

# Compila o projeto com Maven
RUN mvn clean install

# Define o comando padrão (ajuste o nome do .jar gerado abaixo)
CMD ["java", "-jar", "/target/todolist-1.0.0.jar"]
