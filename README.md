# Climb Trainer

### Local Development

To get started, run the following commands:

1. Copy the `.env.example` file and update the attributes where applicable.
```
  cp .env.example .env
```
2. Build the docker container
```
  docker-compose build
```
3. Log in to the VM
```
  docker-compose run web bash
```
4. Create and Migrate the DB
```
  mix do ecto.create, ecto.migrate && exit
```
5. Run the web app
```
  docker-compose up
```

### Testing

In order to run your tests, you will have to run them from within the docker VM.

Unit/Integration tests:
```
  docker-compose run web mix test
```

### Deployment

Deployment is done through Heroku right now due to ease of use. Useful debugging commands:

Console:
```
  heroku run "POOL_SIZE=2 iex -S mix"
```

Migrations:
```
  heroku run "POOL_SIZE=2 mix ecto.migrate"
```
