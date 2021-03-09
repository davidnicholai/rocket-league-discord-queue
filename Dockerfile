FROM python:3.8.5

# Installs the latest postgres because the postgres docker image needs pg_dump
# For future work, we awant to remove ths RUN block postgres dependency.
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && apt-get update -qq && apt-get install -y lsb-release \
  && sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list' \
  && apt-get update -qq \
  && apt-get install -y libpq-dev postgresql-client

COPY . /app

WORKDIR /app

RUN pip install -r requirements.txt

EXPOSE 8000
