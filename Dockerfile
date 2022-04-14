#FROM tomcat:latest

#ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

FROM tomcat:latest
COPY target/*.war /usr/local/tomcat/webapps/WebApp.war/
EXPOSE 3000

CMD ["catalina.sh", "run"]