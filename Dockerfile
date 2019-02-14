FROM python:3.6-alpine

RUN adduser -D farm

COPY server /home/farm/server
WORKDIR /home/farm/server

RUN pip3 install -r requirements.txt
RUN chmod +x start_server.sh

RUN chown -R farm:farm ./
USER farm

EXPOSE 5000
ENTRYPOINT ["sh", "./start_server.sh"]
