# Switcher

AWS switch-role page URL generator.

- Write your switch-role config in `~/.switcherrc.json`

- `switcher` shows switch-role settings with incremental search

- Selected switch-role config will be opend in browser

## Install

```sh
go get -u github.com/reireias/switcher
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
