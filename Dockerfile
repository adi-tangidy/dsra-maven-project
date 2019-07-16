FROM openjdk:8

# get maven dependencies
RUN apt-get update
RUN apt-get install maven -y

WORKDIR /app

COPY src src
COPY pom.xml pom.xml

RUN mvn clean package
RUN mv target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]