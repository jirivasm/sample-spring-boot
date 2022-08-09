FROM openjdk:8u212-alpine

LABEL name "Springboot base image" 
LABEL maintainer "Cognizant"
LABEL version=1.0

USER root
RUN "./gradlew build && java -jar build/libs/gs-spring-boot-docker-0.1.0.jar"

COPY build/libs/spring-boot-0.0.1-SNAPSHOT.jar $APP_LOC/app.jar

ENTRYPOINT ["java","-jar","app.jar"]