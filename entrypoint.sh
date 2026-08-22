#!/bin/sh

python manage.py collectstatic --noinput

python manage.py makemigrations
python manage.py migrate

python manage.py createsuperuser --noinput || true

python manage.py seed_db

# APP_PORT variable must be present in env
python manage.py runserver 0.0.0.0:${APP_PORT}
