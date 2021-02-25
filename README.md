# packaging-freebsd

[Crowdsecurity](https://github.com/crowdsecurity/crowdsec) packaging effort for
[FreeBSD](https://www.freebsd.org).

# Installation from Source

Via port tree catalog

## Build

```
$ make -C /usr/ports/security/crowdsec build
```

## Create package

```
$ sudo make -C /usr/ports/security/crowdsec install
```

# Installation from Package

Via binary package

```
# pkg update
# pkg install -y crowdsec
```
