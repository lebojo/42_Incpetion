#ATTENTION: L'ordre d'exec des commandes est super importante!

#On importe alpine
FROM alpine:3.18

#On install nginx
RUN apk update && apk upgrade \
	&& apk add --no-cache nginx

#On copy du serveur(local) vers le Docker (local -> docker)
#COPY ./site/index.html /var/www/html/
COPY nginx.conf /etc/nginx/nginx.conf

#Ca c'est juste pour te dire (ou a un autre dev) quelle port tu vas écouter
EXPOSE 80 443

# Ca lance nginx en mode pas daemon:
CMD ["nginx", "-g", "daemon off;"]