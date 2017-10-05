FROM maven:latest as toto
WORKDIR /usr/src/app
COPY . .
RUN mvn package

FROM openjdk:jre-alpine
WORKDIR /app
COPY --from=toto /usr/src/app/target/demo-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
