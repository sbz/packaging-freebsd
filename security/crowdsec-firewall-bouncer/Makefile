PORTNAME=	crowdsec-firewall-bouncer
DISTVERSIONPREFIX=	v
DISTVERSION=	0.0.24
CATEGORIES=	security

MAINTAINER=	marco@crowdsec.net
COMMENT=	CrowdSec bouncer written in golang for firewalls
WWW=		https://github.com/crowdsecurity/cs-firewall-bouncer

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	git:devel/git@lite

USES=		gmake go:1.19,no_targets

USE_GITHUB=	yes
GH_ACCOUNT=	crowdsecurity
GH_PROJECT=	cs-firewall-bouncer
GH_TAGNAME=	${DISTVERSIONFULL}-freebsd
_BUILD_TAG=     65fb86a1
USE_RC_SUBR=	crowdsec_firewall

MAKE_ARGS=	BUILD_VERSION="${DISTVERSIONFULL}" \
		BUILD_TAG="${_BUILD_TAG}" \
		BUILD_VENDOR_FLAGS="-mod=vendor -modcacherw"

SUB_FILES=	pkg-deinstall pkg-install pkg-message

ETCDIR=		${PREFIX}/etc/crowdsec/bouncers

post-patch:
	${REINPLACE_CMD} 's,$${BACKEND},pf,g' \
		${WRKSRC}/config/crowdsec-firewall-bouncer.yaml

do-install:
	#
	# Binaries
	#

	${INSTALL_PROGRAM} ${WRKSRC}/crowdsec-firewall-bouncer \
		${STAGEDIR}${PREFIX}/bin/crowdsec-firewall-bouncer

	#
	# Configuration
	#

	@${MKDIR} ${STAGEDIR}${ETCDIR}
	${INSTALL_DATA} ${WRKSRC}/config/crowdsec-firewall-bouncer.yaml \
		${STAGEDIR}${ETCDIR}/crowdsec-firewall-bouncer.yaml.sample

.include <bsd.port.mk>
