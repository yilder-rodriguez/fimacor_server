# ---- Etapa 1: Build con Maven ----
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
COPY web ./web
RUN mvn -B -q clean package

# ---- Etapa 2: Runtime con Tomcat ----
FROM tomcat:10.1-jdk17-temurin
# Limpia las apps de ejemplo de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*
# Despliega nuestro WAR como aplicacion raiz (ROOT)
COPY --from=build /app/target/FIMACOR.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

# Railway asigna el puerto dinamico en la variable PORT.
# Ajustamos el connector de Tomcat a ese puerto y arrancamos el servidor,
# todo dentro del propio Dockerfile (sin script externo).
CMD ["sh", "-c", "sed -i \"s/port=\\\"8080\\\"/port=\\\"${PORT:-8080}\\\"/\" /usr/local/tomcat/conf/server.xml && catalina.sh run"]
