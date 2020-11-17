FROM ubuntu

# port à exposer pour accéder à l'application
EXPOSE 80

# on installe les outils nécessaire à la construction et à l'exécution
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx &&\
    apt-get install -y nodejs && \
    apt-get install -y npm

# on se place dans un dossier de travail et on y copie tout le code de l'application
WORKDIR /app
COPY . ./

# On construit l'application et on la déplace dans le bon dossier pour nginx
RUN npm install
RUN npm run build
RUN cp -r dist/* /var/www/html
#RUN ls /var/www/html/dist/
#RUN cp -r dist/ /usr/share/nginx/html/

# Commande lancée lors du run de l'image docker
CMD ["nginx", "-g", "daemon off;"]
