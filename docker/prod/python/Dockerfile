# FROM python:3
# ENV PYTHONUNBUFFERED 1

# COPY ./app /app

# WORKDIR /app

# RUN pip install -r requirements/prod.txt

# COPY ./docker/prod/python/entrypoint2.sh /entrypoint.sh

# # To give permission for entrypoint.sh in the docker container
# # Initially mentioned by tutorial:
# RUN chmod +x /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]

FROM python:3.6.10-slim-stretch
ENV PYTHONUNBUFFERED 1

COPY ./docker/prod/python/entrypoint2.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /app

COPY ./app/requirements /app/requirements

RUN pip install --no-cache-dir -r requirements/prod.txt

COPY ./app /app

ENTRYPOINT ["/entrypoint.sh"]




