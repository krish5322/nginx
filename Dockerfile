FROM alpine:3.16

WORKDIR /var/www/html

RUN apk add --no-cache \
  curl \
  nginx \
  php81 \
  php81-fpm \
  supervisor \
  python3 \
  py3-pip


COPY INGC_CRM /var/www/html

RUN pip install -r requirements.txt

RUN python3 manage.py runserver 8000 &

RUN python3 loginbackend/bruno-backend.py &

EXPOSE 8080

CMD []
