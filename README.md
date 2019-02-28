<p align="center">
  <img src="https://github.com/devinjeon/vin.sh/blob/master/logo.png" alt="vin.sh logo" width="589px">
</p>


It is my development environment on Ubuntu 16.04+.

The goal is just one command installation with idempotent.

## Dependency

* Installing `vin.sh` requires `Ansible`.
* Both `run` and` test` scripts run the `install-ansible` script to install `Ansible` if it does not exists.

## How to install `vin.sh`

```
$ ./run
```

## Test

Before applying `vin.sh` to your host, you can test installation and access to test docker container.

`test` script installs `sshpass` if it does not exists.

```
$ ./test
```

You can connect to the docker container with the command below.

```
$ sshpass -p 'vin.sh-test' ssh -p 2222 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@localhost
```
