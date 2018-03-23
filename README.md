# capybara-cucumber-docker-boilerplate
Run integration tests using Docker and headless Chrome.

This also doubles as load testing.
You will need to run the following command:

`docker-compose up --build --scale web=n`

_where **n** is the number of containers you want to run_

When the containers are spawned, they will run through all the features.
