# django-docker-postgres-template

Say goodbye to setting up django, postgres, and more. You only need to run `docker-compose up` to start coding.

## Requirements

1. Docker (20.10.3 and up)
2. docker-compose (1.27.4 and up)

## Getting started

1. In the Terminal, run `docker-compose up`
2. To exit, Ctrl+C then run `docker-compose down`

## Adding packages with pip

```
docker-compose run web /bin/bash
* in the shell container *
$ pip install some_package
$ pip freeze > requirements.txt
$ exit
```

## Deployment on Heroku

1. Before deployment, go over this [deployment checklist](https://docs.djangoproject.com/en/3.1/howto/deployment/checklist/)
2. Create a Heroku project
3. On the Resources tab, create a Postgres add-on on Heroku and take note of its credentials
4. Add your env vars in Settings > Config vars, use `.env.development` as reference
5. Follow the "Deploy using Heroku Git" [guide](https://dashboard.heroku.com/apps/david-foobarbaz/deploy/heroku-git) but use `git push heroku main`
6. For migrations, you can go to Heroku > More > Run console and do `python manage.py migrate`
