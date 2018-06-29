FROM openjdk:8-jre-alpine

RUN apk add --no-cache \
    bash \
    su-exec

ENV APP_USER=eureka \
    APP_DIR=/opt/apl/service-discovery-server \
    APP_CONF_DIR=/opt/apl/service-discovery-server/conf \
    APP_LOG_DIR=/opt/apl/service-discovery-server/log

RUN set -ex; \
    adduser -D "$APP_USER"; \
    mkdir -p "$APP_LOG_DIR" "$APP_CONF_DIR" "$APP_DIR"; \
    chown -R "$APP_USER:$APP_USER" "$APP_DIR";

COPY application.properties /opt/apl/service-discovery-server/conf/application.properties
COPY service-discovery-server-0.0.1-SNAPSHOT.jar /opt/apl/service-discovery-server/service-discovery-server-0.0.1-SNAPSHOT.jar

CMD java -Dspring.config.location=/opt/apl/service-discovery-server/conf/application.properties -jar /opt/apl/service-discovery-server/service-discovery-server-0.0.1-SNAPSHOT.jar
