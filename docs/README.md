[![Build Status][travis-shield]][travis-url]

[travis-shield]: https://travis-ci.org/caian-org/coin.svg?branch=master
[travis-url]: https://travis-ci.org/caian-org/coin

# COIN: CLI to currency conversion

`coin` is a command-line application that performs currency conversion via the
[Fixer API](https://fixer.io). It is currently able to convert monetary values
up to 168 different currencies.

<p align="center"

![example](docs/coin.png)
></p>

<p align="center"

[![pd](https://forthebadge.com/images/badges/cc-0.svg)][ccz] [![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)][ftb] [![didnt-ask](https://forthebadge.com/images/badges/you-didnt-ask-for-this.svg)][ftb]
></p>

[ccz]: http://creativecommons.org/publicdomain/zero/1.0
[ftb]: https://forthebadge.com

---

## Table of Contents

- [Usage](#usage)
    - [Fixer API token](#fixer-api-token)
- [Installation](#installation)
    - [Pre-built](#pre-built)
    - [From source](#from-source)
    - [Running in Docker](#running-in-docker)
- [Contributing](#contributing)
- [License](#license)


## Usage

```
user@host:~$ coin -h

Usage: coin [-h] [-v] amount origin <target, ...>

Positional arguments:
    amount             The amount of money to be converted
    origin             The origin currency used as base for conversion
    target             Each of the target currencies for conversion

Optional arguments:
    -h, --help         Show this help message and exit
    -v, --version      Show the program version and exit

Examples:
    $ coin 1 usd brl
    # => converts 1 us dollar to brazilian real

    $ coin 2.5 eur rub jpy
    # => converts 2.5 euro to russian rouble and japanese yen

This project is dedicated to the Public Domain (CC0).

Project page: <github.com/caian-org/coin>
```

For a comprehensive list of all available currencies, see
[`docs/currencies.rst`](docs/currencies.rst).

### Fixer API token

Coin highly depends on Fixer, a _"foreign exchange rates and currency conversion
JSON API"_. Fixer gives a free tier that allows up to a 1000 requests per month.
In order to get an API key and use the service, an account is required. You can
sign up for a free account [here](https://fixer.io/signup/free).

The API key is a 32-length characters wide alphanumeric string. Coin must read
this API key in order to make the request and parse it. It will, by default,
try to read the key from the `FIXER_API_TOKEN`.

- __Export the API key:__

```sh
$ export FIXER_API_TOKEN="ys1r39m5zc71xpvdjpqsnrhwqtxe98cj"
```


## Installation

### Pre-built

The pre-built binary is available at the [release page](https://github.com/caian-org/coin/releases).
Download the most recent version, give the binary execution permissions and
move to a directory on the `$PATH`.

```sh
$ wget https://github.com/caian-org/coin/releases/download/v0.1.0/coin
$ chmod +x coin
$ mv coin /usr/bin
```

### From source

Coin is implemented in [Crystal](https://crystal-lang.org). In order to build
from source you must have the [Crystal compiler](https://crystal-lang.org/reference/installation).

- __Clone the repository:__

```sh
$ clone https://github.com/caian-org/coin
```

- __Make and install:__

```sh
$ make
$ (sudo) make install
```

### Running in Docker

- __Pull from DockerHub:__

```sh
$ docker pull caian/coin
```

- __Run the container:__

```sh
$ docker run -e FIXER_API_TOKEN="my_token" caian/coin 1 usd jpy
```

Alternatively, you can build the Docker image yourself:

```sh
docker build -t coin .
```


## Contributing

Contributions are welcomed. You can contribute with bugfixes and minor
features. For bigger, more complex features or architectural changes, please
contact me beforehand.

If you wish to contribute:

- Fork it (https://github.com/caian-org/coin/fork)
- Create your feature branch (`git checkout -b my-new-feature`)
- Commit your changes (`git commit -am 'Add some feature'`)
- Push to the branch (`git push origin my-new-feature`)
- Create a new Pull Request

Large contributions must contain a notice stating that the owner (i.e., the
contributor) waive it's copyrights to the Public Domain.


## License

To the extent possible under law, [Caian Rais Ertl](https://github.com/caiertl)
has waived all copyright and related or neighboring rights to this work.

Coin depends on [`optarg`](https://github.com/mosop/optarg). `optarg` is
licensed under the MIT license.
