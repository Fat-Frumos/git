FROM maven:3.8.2-jdk-11 AS build
COPY . .
RUN mvn clean package -DskipTests -Dmaven

FROM openjdk:11-jdk-slim
COPY --from=build ./web-app/target/web-app-1.0.0.jar demo.jar
EXPOSE 8080 443
ENTRYPOINT ["java","-jar","demo.jar"]