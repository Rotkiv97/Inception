FROM alpine:3.18

#apk == atp solo apk per apine
RUN apk update && apk upgrade && apk add --no-cache nginx
RUN mkdir -p /var/log/nginx/
RUN chown -R nginx:nginx /var/log/nginx/

EXPOSE 443

#cmd serve per installare le configurazioni della cartella
CMD [ "nginx", "-g", "daemon off;" ]
