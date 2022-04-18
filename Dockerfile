#FROM tomcat:latest

#ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

FROM tomcat:latest
COPY target/*.war /usr/local/tomcat/webapps/LoginWebApp/


CMD ["catalina.sh", "run"]