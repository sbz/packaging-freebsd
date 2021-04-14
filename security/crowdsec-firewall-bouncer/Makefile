PORTNAME=	crowdsec-firewall-bouncer
DISTVERSION=	20210413
CATEGORIES=	security

MAINTAINER=	sbz@FreeBSD.org
COMMENT=	Crowdsec bouncer written in golang for firewalls

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go
USE_GITHUB=	yes

GH_ACCOUNT=	sbz
GH_PROJECT=	cs-firewall-bouncer
GH_TAGNAME=	e218300

USE_RC_SUBR=	crowdsec-firewall-bouncer

GO_MODULE=	github.com/crowdsecurity/cs-firewall-bouncer
GO_TARGET=	./crowdsec-firewall-bouncer
GO_BUILDFLAGS=	-ldflags "-s -w \
		-X github.com/crowdsecurity/cs-firewall-bouncer/pkg/version.Version=${PORTVERSION}"

PLIST_FILES=	bin/crowdsec-firewall-bouncer


do-build:
	cd ${WRKSRC}; ${GO_CMD} mod download; ${GO_CMD} build

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/cs-firewall-bouncer \
		${STAGEDIR}/${PREFIX}/bin/crowdsec-firewall-bouncer

.include <bsd.port.mk>
