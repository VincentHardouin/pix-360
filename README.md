# PIX 360

# Requirement

- App Google :
You need to create a google ID client OAuth 2.0 for the connection with the SSO.
To have them, follow the steps on this link : 
https://developers.google.com/identity/protocols/oauth2

# One-Click Deployment

With Scalingo

[![Deploy on Scalingo](https://cdn.scalingo.com/deploy/button.svg)](https://my.scalingo.com/deploy?source=https://github.com/VincentHardouin/pix-360#main) 

With Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.dev/VincentHardouin/pix-360/tree/feat-add-new-deployment-method)

# Installation

1. Copy sample.env

```shell
cp sample.env .env
```

2. Run docker-compose :
```shell
docker-compose up -d
```

3. Run pix 360 app :
```shell
docker compose run --rm --service-ports --name pix360 app
```

Inside Pix 360 container: 
4. Install gems and packages :
````shell
bundle install && yarn install
````

5. Prepare database :
````shell
rails db:reset && rails db:migrate
````

6. Run server : 
````shell
rails server -p $PORT -b 0.0.0.0
````

# Docker usage : 

- To run one container :

```shell
docker compose run --rm --service-ports --name pix360 app
```

- To run in multiple terminal windows:
```shell
docker exec -it pix360 /bin/bash
```

# Development 

- Run lint :

```shell
bundle exec rubocop -a
```
