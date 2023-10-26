FROM openjdk:17-jdk-slim-bullseye

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src

RUN apt-get update && apt-get install dos2unix
RUN dos2unix mvnw

RUN chmod +x mvnw && ./mvnw dependency:resolve

CMD ["./mvnw", "spring-boot:run"]
