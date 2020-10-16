FROM python:2.7.8@sha256:6e862dd28448f372f05bf8da683ce3ba2156630da51257324b7ef480d9be0036

WORKDIR /usr/src/app

ENV PYTHONUNBUFFERED 1
ENV PIP_NO_CACHE_DIR off

COPY requirements.txt ./

RUN python -m pip install --requirement requirements.txt

ENV PORT 8000

EXPOSE $PORT

VOLUME /usr/src/app

ENTRYPOINT ["/usr/src/app/docker-entrypoint.sh"]
