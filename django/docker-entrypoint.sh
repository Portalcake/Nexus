#!/bin/bash
python manage.py collectstatic --noinput

if [ "$DEBUG" = true ] || [ "$DEBUG" = 'True' ] || [ "$DEBUG" = 1 ]; then
    echo 'Launching in debug mode'
    python manage.py runserver 0.0.0.0:8000
else
    echo 'Launching in production mode'
    gunicorn core.wsgi -b 0.0.0.0:8000
fi
