# Docker-Webserver-Projekt

## Projektstruktur
```
/Projektordner
│
├── Dockerfile
├── site-content/
│   ├── index.html
│   └── styles.css
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


## Beispielseite (`index.html`)
Speichere diese Datei unter `site-content/index.html`.
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Meine Webseite</title>
</head>
<body>
    <h1>Willkommen auf meiner Webseite!</h1>
    <p>Diese Webseite läuft in einem Docker-Container mit NGINX.</p>
    <p>JoSi 2025.</p>
</body>
</html>
```


## Beispiel CSS-Datei (`styles.css`)
Speichere diese Datei unter `site-content/styles.css`.
```css
body {
    font-family: Arial, sans-serif;
    text-align: center;
    background-color: #f0f0f0;
}

h1 {
    color: #333;
}
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
docker run -d -p 8080:80 \
  -v $(pwd)/site-content:/usr/share/nginx/html \
  -v $(pwd)/logs:/var/log/nginx \
  --name jositest-nginx jositest-nginx
  ```

## Aufruf der Webseite
Im Browser eingeben:
```
http://localhost:8080
```
