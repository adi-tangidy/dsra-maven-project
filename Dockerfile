FROM openjdk:8-alpine

# get maven dependencies
RUN apk update
RUN apk add maven
RUN apk add git

WORKDIR /app
RUN git clone https://github.com/adi-tangidy/dsra-maven-project.git dsra-maven-project


RUN cd dsra-maven-project && \
    mvn clean package && \
    mv target/*-jar-with-dependencies.jar ../app.jar

# clean up for minimum image size
RUN apk del maven
RUN apk del git

EXPOSE 4567

ENTRYPOINT ["java", "-jar", "app.jar"]