[![main](https://github.com/reireias/switcher/actions/workflows/main.yml/badge.svg)](https://github.com/reireias/switcher/actions/workflows/main.yml)
# Switcher

AWS switch-role page URL generator.

![switcher](https://user-images.githubusercontent.com/24800246/65244109-c01de100-db24-11e9-97e2-ffc202dad623.gif)

- Write your switch-role config in `~/.switcherrc.json`

- `switcher` shows switch-role settings with incremental search

- Selected switch-role config will be opend in browser

## Install

```sh
go install github.com/reireias/switcher/cmd/switcher@latest
```

## install from relase

1. download from [release page](https://github.com/reireias/switcher/releases)

2. unarchive

3. `sudo mv ./switcher /usr/local/bin`

## install from source

1. clone this repository

2. `make && make install`

## .switcherrc.json example

```json
[
  {
    "name": "roleA",
    "roleName": "roleA",
    "account": "99999999",
    "color": "red"
  },
  {
    "name": "roleB",
    "roleName": "roleB",
    "account": "88888888",
    "color": "blue"
  }
]
```

## color
valid colors are follows

- red
- prange
- yellow
- green
- blue
