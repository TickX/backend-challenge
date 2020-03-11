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

## Task

Write a command that extracts the following information from the TickX API:
- Title
- Date
- Time
- Picture (if available)
- Description
- Array of ticket prices available (bonus points for getting ticket seller and buy link as well)
- Venue Name

### Instructions

Use the TickX API to fetch data for Manchester events and their corresponding tickets. The endpoints you'll need to
use are:
- http://api-1.tickx.co.uk/v4/cities/manchester
- http://api-1.tickx.co.uk/v4/event/:eventId/tickets

Your command _should_:
1. Fetch the first 20 results which appear on the page
3. Persist the events to a SQL database
4. Be safe to run multiple times
5. Be able to update existing events, add new ones, and/or delete removed events

We will be testing the output of your command by running it and observing the resulting DB entries.

## Template

### Installation

Click the `Use this template` button to create your own project based on this template, then clone your repo
to your local machine to start developing.

### Usage

This template comes preconfigured with [`symfony-console`](https://github.com/symfony/console). A basic command,
`/TickX/Challenge/Command/RunCommand`, has been created for you to start writing your code.

To run your command, run the console executable followed by the command's name:
```shell script
$ php bin/console run
Hello TickX!
```

#### Docker

**Note:** This section is optional; If you're not familiar with Docker, are finding difficulties using it, or just
don't think you need it, you may skip this and instead just run/test your work directly on your machine.

This template comes preconfigured with a `docker-compose` file that spins up a PHP development instance and MySQL DB.
You can use these to run, test, and reset your application with ease.

For example, if you don't have PHP installed locally, you can run your command inside the docker container.
Or if you would like to restart with a fresh DB, you can just `down` then `up` your containers again.

##### Tips

Here are the download links for [Docker](https://docs.docker.com/install/) and
[Docker Compose](https://docs.docker.com/compose/install/).

Here are some basic, useful Docker commands to get you started:
```shell script
$ docker-compose up # Starts containers (use with `-d` flag to run in background)
$ docker-compose down # Stops containers
$ docker ps # Displays running containers
$ docker exec -it {container_id} bash # Starts an interactive shell inside the specified container
$ docker exec {container_id} {shell_command} # Runs a shell command inside the specified container
$ docker cp /path/to/file {container_id}:desired/path/filename # Copies files between your local machine and docker container
```
