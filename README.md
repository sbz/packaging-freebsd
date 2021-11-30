# packaging-freebsd

[Crowdsecurity](https://github.com/crowdsecurity/crowdsec) packaging effort for
[FreeBSD](https://www.freebsd.org).

There are the 2 following ports
- `security/crowdsec`: for the crowdsec agent
- `security/crowdsec-bouncer-firewall`: for the crowdsec firewall

# Installation from Source

Via the ports tree catalog

## Build

```
$ make -C /usr/ports/security/crowdsec build
$ make -C /usr/ports/security/crowdsec-bouncer-firewall build
```

## Create package and install

```
$ sudo make -C /usr/ports/security/crowdsec package install
$ sudo make -C /usr/ports/security/crowdsec-bouncer-firewall package install
```

# Installation from Package

Via binary package

```
# pkg update
# pkg install -y crowdsec
# pkg install -y crowdsec-firewall-bouncer
```

# Configuration

When the service is run the first time, it will register the machine to both local and remote APIs. It will also update the plugin repository (hub) and GeoIP information.

Before being actually useful, CrowdSec still needs to be told which logs to watch and which actions to take. Please refer to https://docs.crowdsec.net/docs/intro/