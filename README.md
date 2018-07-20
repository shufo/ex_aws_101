# ExAws101

Getting Started Elixir and AWS with TDD.

## Usage

- Clone this repository

```bash
$ git clone https://github.com/shufo/ex_aws_101
```

- Get dependencies

```bash
$ mix deps.get
```

- Run [localstack](https://github.com/localstack/localstack) (using docker)

```bash
$ docker run -itd -p 4567-4582:4567-4582 -p 8080:8080 localstack/localstack
```

- Write the modules to pass the tests

```
$ mix test
```

- Pull Request the your code

- Test results is shown in here

https://circleci.com/gh/shufo/ex_aws_101

## Contribution

- Run formatter before commit to Git

```
$ mix format
```
