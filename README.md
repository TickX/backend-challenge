# TickX Backend Technical Challenge

Please read this document carefully before beginning.

Complete the following task, you are encouraged to use any libraries and tools you
feel might improve the efficiency, legibility and simplicity of the solution.

We're most interested in:
- How you structure your code from project layout to naming of variables
- Your choice of tools and how they improve the solution
- Elegant handling of errors
- Extensibility - we might iterate on this solution in a pairing session later on

# Task

Create a command line script that will send `Character` information fetched from two api's to a remote service.

Please make sure to add a note explaining how to run the script and anything else you want to document.

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

This character list will be made up of Game of Thrones characters, in order to get the image and name for a character, use the [Game of thrones API](https://thronesapi.com/), in order to get the quotes use the [Game of thrones Quotes API](https://gameofthronesquotes.xyz/).

Fetch all characters and quotes available.

Gather this data together and post it to the service at https://backend-challenge.hasura.app/v1/graphql  via graphql, use the below curl commands as a guide or inspect the graphql schema itself (insomnia is our favourite rest client which has support for graphql schema introspection, if you are into that kind of thing):

### Create a Character:

```bash
curl --request POST \
  --url https://backend-challenge.hasura.app/v1/graphql \
  --header 'content-type: application/json' \
  --header 'x-hasura-admin-secret: uALQXDLUu4D9BC8jAfXgDBWm1PMpbp0pl5SQs4chhz2GG14gAVx5bfMs4I553keV' \
  --data '{"query":"mutation CreateCharacter {\n  insert_Character(objects: {name: \"Some Lannister\"}) {\n    returning {\n      id\n    }\n  }\n}","operationName":"CreateCharacter"}'
```

### Add a Quote

This request will create a quote for a character with supplied character id and quote text:
```bash
curl --request POST \
  --url https://backend-challenge.hasura.app/v1/graphql \
  --header 'content-type: application/json' \
  --header 'x-hasura-admin-secret: uALQXDLUu4D9BC8jAfXgDBWm1PMpbp0pl5SQs4chhz2GG14gAVx5bfMs4I553keV' \
  --data '{"query":"mutation CreateQuote {\n  insert_Quote(objects: {text: \"Your Quote \", character_id: 7}) {\n    returning {\n      id\n      text\n    }\n  }\n}\n","operationName":"CreateQuote"}'
```

### Retrieve Characters and Quotes

To check your work, this curl command will retrieve all characters and quotes:
```bash
curl --request POST \
  --url https://backend-challenge.hasura.app/v1/graphql \
  --header 'content-type: application/json' \
  --header 'x-hasura-admin-secret: uALQXDLUu4D9BC8jAfXgDBWm1PMpbp0pl5SQs4chhz2GG14gAVx5bfMs4I553keV' \
  --data '{"query":"{\n  Character {\n    Quotes {\n      text\n      id\n    }\n    id\n    image_url\n    name\n  }\n}\n"}'
```

### Delete all

Finally to delete everything, try this command:
```bash
curl --request POST \
  --url https://backend-challenge.hasura.app/v1/graphql \
  --header 'content-type: application/json' \
  --header 'x-hasura-admin-secret: uALQXDLUu4D9BC8jAfXgDBWm1PMpbp0pl5SQs4chhz2GG14gAVx5bfMs4I553keV' \
  --data '{"query":"mutation DeleteAll {\n  delete_Character(where: {id: {_gt: 0}}) {\n    affected_rows\n  }\n}\n","operationName":"DeleteAll"}'
```
