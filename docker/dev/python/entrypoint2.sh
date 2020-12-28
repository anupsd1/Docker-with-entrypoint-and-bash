#!/bin/bash
echo "Running command '$*'"
# exec su -p - ${PYTHON_RUN_USER} -s /bin/bash -c "$*"
exec $*
# exec python manage.py runserver
