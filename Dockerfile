FROM tomcat:latest



ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

EXPOSE 3000

CMD ["catalina.sh", "run"]