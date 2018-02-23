FROM openjdk:8
ADD target/system12test.jar /opt/system12test/
WORKDIR "/opt/system12test/"
CMD ["java","-jar","system12test.jar"]
EXPOSE 8080
