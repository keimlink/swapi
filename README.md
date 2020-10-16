# SWAPI
## The Star Wars API

This SWAPI fork has been equipped with a `Dockerfile` in order to use it for local development.

### Usage

Build the Docker image and start the development web server:

```console
make
```

Load the data for the SWAPI:

```console
make load_data
```

SWAPI is now available at `http://127.0.0.1:8080/` and `http://127.0.0.1:8080/api/`.
