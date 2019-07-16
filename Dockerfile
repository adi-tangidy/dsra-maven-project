FROM openjdk:8

# get maven dependencies
RUN apt-get update
RUN apt-get install maven -y

WORKDIR /app
RUN git clone https://github.com/adi-tangidy/dsra-maven-project.git dsra-maven-rpoject


RUN cd dsra-maven-project && \
    mvn clean package && \
    mv target/*-jar-with-dependencies.jar ../app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]