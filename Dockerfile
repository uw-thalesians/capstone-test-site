FROM nginx
ADD default.conf /etc/nginx/conf.d/default.conf
COPY team/team/build /usr/share/nginx/html