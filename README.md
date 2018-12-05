# vin.sh

It it my development environment on linux(ubuntu)

The goal is to install my environment with just one command.

## Setup

The script to install `vin.sh` is based on `Ansible`.

Including `Ansible`, it requires some package to execute script for installing `vin.sh`

```
$ ./setup
```

## Usage

* Install `vin.sh` on current host.
* If you want to install on another host, modify `host.yml`

```
$ ./run
```

## Test

Before you actually install `vin.sh` on your host,

you can access to test docker container for checking installation.

```
# Step
# 1. Run docker container for test
# 2. Install `vin.sh` on the container
$ ./test
# 3. You can check result of installation by accessing docker container
$ sshpass -p 'vin.sh-test' ssh -p 22222 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null localhost
```
