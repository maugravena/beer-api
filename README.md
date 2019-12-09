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
* POST /api/v1/beers
* PUT /api/v1/beers:id
* DELETE /beers/:id

* GET /api/v1/beer-suggestion?temperature=2

## Front-end Vue App

O front-end se encontra em:

* Código: https://github.com/maugravena/beer-machine 
* GitHub Pages: https://maugravena.github.io/beer-machine/
