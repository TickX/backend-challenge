# TickX Backend Technical Challenge

Please read this document carefully before beginning.

You are required to use PHP to complete the following task, and are encouraged to use any libraries that you
feel may need. You may also alter this template however you see fit to complete the task.

Rather than just a complete solution, we're more interested in:
- Good quality code (readable, maintainable, and structured)
- Code that runs, and outputs something useful
- Clean and informative Git history

We realise that the allocated time is short, and do not necessarily expect you to fulfill all of the requirements, so
keep the above points in mind and have fun!

# Task

Create a console command that will send `Character` information to a remote service.

A `Character` has the following shape:
```json
{
  "name": "Tyrion Lannister",
  "image_url": "https://static.wikia.nocookie.net/gameofthrones/images/9/95/HandoftheKingTyrionLannister.PNG",
  "quotes": [
    "A Lannister always pays his debts.",
    "He was no dragon. Fire cannot kill a dragon."
  ]
}
```

## Fetch the data

This contact list will be made up of Game of Thrones characters, in order to get the image and name for a character, use the [Game of thrones API](https://thronesapi.com/), in order to get the quotes use the [Game of thrones Quotes API](https://gameofthronesquotes.xyz/).

Fetch all characters and quotes available and persist them using the example curl commands below as a guide:

Gather this data together and post it to this service via graphql, here is an example curl command which will create a character with their name and returning the ID:

## Create a Character:

```bash
curl --request POST \
  --url https://backend-challenge.hasura.app/v1/graphql \
  --header 'content-type: application/json' \
  --header 'x-hasura-admin-secret: uALQXDLUu4D9BC8jAfXgDBWm1PMpbp0pl5SQs4chhz2GG14gAVx5bfMs4I553keV' \
  --data '{"query":"mutation CreateCharacter {\n  insert_Character(objects: {name: \"Some Lannister\"}) {\n    returning {\n      id\n    }\n  }\n}","operationName":"CreateCharacter"}'
```

## Add a Quote

This request will create a quote for a character with supplied character id and quote text:
```bash
curl --request POST \
  --url https://backend-challenge.hasura.app/v1/graphql \
  --header 'content-type: application/json' \
  --header 'x-hasura-admin-secret: uALQXDLUu4D9BC8jAfXgDBWm1PMpbp0pl5SQs4chhz2GG14gAVx5bfMs4I553keV' \
  --data '{"query":"mutation CreateQuote {\n  insert_Quote(objects: {text: \"Your Quote \", character_id: 7}) {\n    returning {\n      id\n      text\n    }\n  }\n}\n","operationName":"CreateQuote"}'
```

## Retrieve Characters and Quotes


To check your work, this curl command will retrieve all characters and quotes:
```bash
curl --request POST \
  --url https://backend-challenge.hasura.app/v1/graphql \
  --header 'content-type: application/json' \
  --header 'x-hasura-admin-secret: uALQXDLUu4D9BC8jAfXgDBWm1PMpbp0pl5SQs4chhz2GG14gAVx5bfMs4I553keV' \
  --data '{"query":"{\n  Character {\n    Quotes {\n      text\n      id\n    }\n    id\n    image_url\n    name\n  }\n}\n"}'
```

## Delete all

Finally to delete everything, try this command:
```bash
curl --request POST \
  --url https://backend-challenge.hasura.app/v1/graphql \
  --header 'content-type: application/json' \
  --header 'x-hasura-admin-secret: uALQXDLUu4D9BC8jAfXgDBWm1PMpbp0pl5SQs4chhz2GG14gAVx5bfMs4I553keV' \
  --data '{"query":"mutation DeleteAll {\n  delete_Character(where: {id: {_gt: 0}}) {\n    affected_rows\n  }\n}\n","operationName":"DeleteAll"}'
```

# Setting up

Click the `Use this template` button to create your own project based on this template, then clone your repo
to your local machine to start developing.

This template comes preconfigured with [`symfony-console`](https://github.com/symfony/console). A basic command,
`/TickX/Challenge/Command/RunCommand`, has been created for you to start writing your code.

To run your command, run the console executable followed by the command's name:
```shell script
$ php bin/console run
Hello TickX!
```

## Docker

**Note:** This section is optional; If you're not familiar with Docker, are finding difficulties using it, or just
don't think you need it, you may skip this and instead just run/test your work directly on your machine.

This template comes preconfigured with a `docker-compose` file that spins up a PHP development instance.
You can use these to run, test, and reset your application.

For example, if you don't have PHP installed locally, you can run your command inside the docker container.

## Tips

Here are the download links for [Docker](https://docs.docker.com/install/)

Here are some basic, useful Docker commands to get you started:
```shell script
$ docker compose up # Starts containers (use with `-d` flag to run in background)
$ docker compose down # Stops containers
$ docker ps # Displays running containers
$ docker exec -it {container_id} bash # Starts an interactive shell inside the specified container
$ docker exec {container_id} {shell_command} # Runs a shell command inside the specified container
$ docker cp /path/to/file {container_id}:desired/path/filename # Copies files between your local machine and docker container
```

[]: https://thronesapi.com/
