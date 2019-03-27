FROM python:3.7-slim

WORKDIR /app

COPY . /app

RUN set -xe \
    && apt update \
    && apt install gcc -y \
    && apt install python3-dev -y \
    && pip3 install -r requirements.txt

EXPOSE 8000
EXPOSE 8001

#ADD docker-entrypoint.sh /docker-entrypoint.sh
#RUN chmod a+x /docker-entrypoint.sh
#ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["python3", "manage.py", "migrate"]
