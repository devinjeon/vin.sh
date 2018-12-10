<p align="center">
  <img src="https://github.com/devinjeon/vin.sh/blob/master/logo.png" alt="vin.sh logo" width="589px">
</p>

It is my development environment on linux(ubuntu).

The goal is just one command installation with idempotent.

## Setup

* Set up dependencies before installing `vin.sh`.
* The installation of `vin.sh` needs few packages including `Ansible`.
* This command may be removed later for intergration into one command.

```
$ ./setup
```

## How to install `vin.sh` on current host.

* If you want to install on another host, modify `host.yml`

```
$ ./run
```

## Test

Before applying `vin.sh` to your host,

you can test installation and access to test docker container.

```
# Steps
# 1. Run docker container for test
# 2. Install `vin.sh` on the container
$ ./test
# 3. You can access to docker container
$ sshpass -p 'vin.sh-test' ssh -p 2222 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@localhost
```
