FROM python:3
ENV PYTHONUNBUFFERED 1

COPY ./app /app

WORKDIR /app

RUN pip install -r requirements/dev.txt

COPY ./docker/dev/python/entrypoint.sh /entrypoint.sh

# To give permission for entrypoint.sh in the docker container
# Initially mentioned by tutorial:
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]




