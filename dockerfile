# Basis-Image verwenden
FROM nginx:latest

# Arbeitsverzeichnis erstellen
WORKDIR /usr/share/nginx/html

# Webseite-Dateien kopieren
COPY site-content/ /usr/share/nginx/html

# NGINX Konfiguration anpassen, damit Logs extern gespeichert werden
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# Port 8080 freigeben
EXPOSE 8080

# NGINX starten
CMD ["nginx", "-g", "daemon off;"]
