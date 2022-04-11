#FROM tomcat:latest

#ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

FROM tomcat:8.0.20-jre8
COPY target/LoginWebApp-1*.war /usr/local/tomcat/webapps/LoginWebApp-1.war

CMD ["catalina.sh", "run"]