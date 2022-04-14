#FROM tomcat:latest

#ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

FROM tomcat:latest
COPY target/*.war /usr/local/tomcat/webapps/WebApp-0.0.1-SNAPSHOT.war/

CMD ["catalina.sh", "run"]