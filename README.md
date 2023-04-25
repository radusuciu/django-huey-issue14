This repository is meant for reproducing this issue: https://github.com/gaiacoop/django-huey/issues/14.

It is meant to be run with `docker compose` like so: `docker compose up -d`. Then, to issue tasks you can get to a shell like so: `docker compose exec app python issue14/manage.py shell`.
