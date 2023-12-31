# Product Migrations
The Product Migrations service is a short-lived utility service responsible for managing schema migrations for the [Products](https://github.com/DistributedPlayground/products) service's Postgres database. It uses [Goose](https://pressly.github.io/goose/) to manage the migration versioning and is containerized with [Docker](https://www.docker.com/).
It is a fundamental part of our E-commerce platform within the [DistributedPlayground](https://github.com/DistributedPlayground) project. See the [project description](https://github.com/DistributedPlayground/project-description) for more details.


## Running the Migrations
Follow the instructions in the [DistributedPlayground project description](https://github.com/DistributedPlayground/project-description).