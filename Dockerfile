FROM tomcat

USER root

COPY ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]
