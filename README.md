# Docker-Webserver-Projekt

## Projektstruktur
```
/Projektordner
│
├── Dockerfile
├── site-content/
│   ├── index.html
│   ├── styles.css
│   └── profile.png
├── logs/
└── README.md
```


## Dockerfile (NGINX)
```dockerfile
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
```

## Container bauen und starten
1. Erstelle die benötigten Ordner:

```
git clone https://github.com/JoSi-git/m169.git
```

3. Wechsle in den Projektordner und baue das Docker-Image:
```bash
docker build -t jositest-nginx .
```

4. Starte den Container:
```bash
docker run -d -p 9443:80 \
  -v $(pwd)/site-content:/usr/share/nginx/html \
  -v $(pwd)/logs:/var/log/nginx \
  --name jositest-nginx jositest-nginx
  ```

## Aufruf der Webseite
Im Browser eingeben:
```
http://localhost:8080
```
