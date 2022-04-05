FROM openjdk:8-alpine

ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]
