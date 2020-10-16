MANAGE_PY := docker exec --interactive --tty swapi_runserver python manage.py

install:
	docker build --tag swapi .
	docker run --interactive \
		--mount type=bind,src=$$(pwd),dst=/usr/src/app \
		--name swapi_runserver \
		--publish 127.0.0.1:8080:8000 \
		--rm \
		--tty \
		swapi

load_data:
	$(MANAGE_PY) loaddata planets.json
	$(MANAGE_PY) loaddata people.json
	$(MANAGE_PY) loaddata species.json
	$(MANAGE_PY) loaddata transport.json
	$(MANAGE_PY) loaddata starships.json
	$(MANAGE_PY) loaddata vehicles.json
	$(MANAGE_PY) loaddata films.json

dump_data:
	$(MANAGE_PY) dumpdata resources.planet > resources/fixtures/planets.json --indent 4
	$(MANAGE_PY) dumpdata resources.people > resources/fixtures/people.json --indent 4
	$(MANAGE_PY) dumpdata resources.species > resources/fixtures/species.json --indent 4
	$(MANAGE_PY) dumpdata resources.starship > resources/fixtures/starships.json --indent 4
	$(MANAGE_PY) dumpdata resources.vehicle > resources/fixtures/vehicles.json --indent 4
	$(MANAGE_PY) dumpdata resources.transport > resources/fixtures/transport.json --indent 4
	$(MANAGE_PY) dumpdata resources.film > resources/fixtures/films.json --indent 4

drop_db:
	$(MANAGE_PY) flush

test:
	$(MANAGE_PY) test

clear_cache:
	$(MANAGE_PY) clear_cache
