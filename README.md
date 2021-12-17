
# Rails Tic Tac Toe

A Rails API that uses my tic tac toe logic gem


## API Reference

#### Get all games

```http
  GET /games
```

#### Get single game

```http
  GET /games/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to fetch |

#### Create new game

```http
  POST /games
```

#### Play a move to a game

```http
  POST /submit_move/${id}/${move}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to fetch |
| `move`    | `string` | **Required**. position on board to play move in |


#### Delete single game

```http
  DELETE /games/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to delete |

## Tests

To run tests, run the following command

```bash
  bundle exec rspec
```
