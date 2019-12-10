[![Build Status](https://travis-ci.com/maugravena/beer-api.svg?branch=master)](https://travis-ci.com/maugravena/beer-api)

# Beer API

Para rodar a aplicação localmente é necessário ter instalado na sua máquina, docker(https://docs.docker.com/install/) e docker compose(https://docs.docker.com/compose/install/)

## Comandos para levantar a aplicação

* sudo docker-compose run --rm api bin/setup
* sudo docker-compose up
* rodando em localhost:3000

OBS: Optar preferencialmente por sistemas Unix(Linux)

## Testes

* Rspec: sudo docker-compose run --rm api rspec 
* Rubocop: sudo docker-compose run --rm api rubocop

## Deploy no Heroku

### Endpoints

URL base: https://stormy-cove-14668.herokuapp.com/

* GET /api/v1/beers

```json
[
  {
    "id": 1,
    "style": "Weissbier",
    "min_temperature": -1,
    "max_temperature": 3,
    "created_at": "2019-12-08T23:10:24.340Z",
    "updated_at": "2019-12-08T23:10:24.340Z",
    "average_temperature": 1
  },
  {
    "id": 2,
    "style": "Pilsens",
    "min_temperature": -2,
    "max_temperature": 4,
    "created_at": "2019-12-08T23:10:24.346Z",
    "updated_at": "2019-12-08T23:10:24.346Z",
    "average_temperature": 1
  },
  {
    "id": 3,
    "style": "Weizenbier",
    "min_temperature": -4,
    "max_temperature": 6,
    "created_at": "2019-12-08T23:10:24.352Z",
    "updated_at": "2019-12-08T23:10:24.352Z",
    "average_temperature": 1
  }
]
```

* POST /api/v1/beers/api/v1/beers/?style=Red ale&min_temperature=-5&max_temperature=5

```json
{
  "id": 4,
  "style": "Red ale",
  "min_temperature": -5,
  "max_temperature": 5,
  "created_at": "2019-12-08T23:10:24.357Z",
  "updated_at": "2019-12-08T23:10:24.357Z",
  "average_temperature": 0
}
```

* PUT api/v1/beers/:id?max_temperature=-1

```
Status: 204
```

* DELETE /beers/:id

```
Status: 204
```

* GET /api/v1/beer-suggestion?temperature=-2

```json
{
  "style": "Dunkel"
}
```

## Front-end Vue App

O front-end se encontra em:

* Código: https://github.com/maugravena/beer-machine 
* GitHub Pages: https://maugravena.github.io/beer-machine/
