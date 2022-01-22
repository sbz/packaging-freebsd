PORTNAME=	crowdsec-firewall-bouncer
PORTVERSION=	0.0.22  # NOTE: change BUILD_VERSION and BUILD_TAG as well
PORTREVISION=	1
DISTVERSIONPREFIX=	v
CATEGORIES=	security

MAINTAINER=	marco@crowdsec.net
COMMENT=	CrowdSec bouncer written in golang for firewalls

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	git:devel/git@lite \
		go:lang/go

USES=		gmake

RUN_DEPENDS=	crowdsec>0:security/crowdsec

USE_GITHUB=	yes
GH_ACCOUNT=	crowdsecurity
GH_PROJECT=	cs-firewall-bouncer
GH_TAGNAME=	v0.0.22-freebsd
#GH_TAGNAME is automatically set from DISTVERSION

USE_RC_SUBR=	crowdsec_firewall

SUB_FILES=	pkg-message \
		pkg-install \
		pkg-deinstall

# BUILD_VERSION=$(git describe --tags $(git rev-list --tags --max-count=1))
# BUILD_TAG=$(git rev-parse HEAD)
MAKE_ENV=	BUILD_VERSION="v0.0.22" \
		BUILD_TAG="50336d1ecdd97b296c3d9d4f1604afd4d59c4c3f"

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

	#
	# Log rotation
	#

	${INSTALL_DATA} ${FILESDIR}/crowdsec-firewall-bouncer.conf-newsyslog ${STAGEDIR}${PREFIX}/etc/newsyslog.conf.d/crowdsec-firewall-bouncer.conf.sample

.include <bsd.port.mk>
