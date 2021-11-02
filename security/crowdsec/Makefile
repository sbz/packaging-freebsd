PORTNAME=	crowdsec
PORTVERSION=	1.2.0
DISTVERSIONPREFIX=	v
CATEGORIES=	security

MAINTAINER=	sbz@FreeBSD.org
COMMENT=	Crowdsec lightweight and collaborative security engine

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:modules

USE_RC_SUBR=	crowdsec

GO_MODULE=	github.com/crowdsecurity/crowdsec

GO_BUILDFLAGS=	-ldflags "-s -w \
		-X github.com/crowdsecurity/crowdsec/pkg/cwversion.Version=v${PORTVERSION} \
		-X github.com/crowdsecurity/crowdsec/pkg/cwversion.System=freebsd \
		-X github.com/crowdsecurity/crowdsec/pkg/cwversion.BuildDate=`date -u '+%Y-%m-%d_%I:%M:%S%p'`"

GO_TARGET=	./cmd/crowdsec \
		./cmd/crowdsec-cli

SUB_FILES=	pkg-message \
		pkg-deinstall

post-patch:
	@${REINPLACE_CMD} 's,/etc/crowdsec/,${ETCDIR}/,g' \
		${WRKSRC}/pkg/csconfig/config.go \
		${WRKSRC}/cmd/crowdsec-cli/machines.go \
		${WRKSRC}/cmd/crowdsec-cli/main.go \
		${WRKSRC}/cmd/crowdsec/main.go \
		${WRKSRC}/config/config.yaml \
		${WRKSRC}/config/profiles.yaml

	@${REINPLACE_CMD} 's,/var/lib/,/var/db/,g' \
		${WRKSRC}/pkg/csconfig/config.go \
		${WRKSRC}/pkg/metabase/database.go \
		${WRKSRC}/config/config.yaml \
		${WRKSRC}/config/profiles.yaml

do-install:
	@${MKDIR} ${STAGEDIR}${ETCDIR}
	@(cd ${WRKSRC}/config && ${COPYTREE_SHARE} . ${STAGEDIR}${ETCDIR})

	@${MV} ${STAGEDIR}${ETCDIR}/acquis.yaml \
		${STAGEDIR}${ETCDIR}/acquis.yaml.sample

	@${MV} ${STAGEDIR}${ETCDIR}/config.yaml \
		${STAGEDIR}${ETCDIR}/config.yaml.sample

	@${MV} ${STAGEDIR}${ETCDIR}/profiles.yaml \
		${STAGEDIR}${ETCDIR}/profiles.yaml.sample

	# managed by "cscli simulation"
	@${MV} ${STAGEDIR}${ETCDIR}/simulation.yaml \
		${STAGEDIR}${ETCDIR}/simulation.yaml.sample

	# updated by "cscli machines" at first service start
	@${MV} ${STAGEDIR}${ETCDIR}/local_api_credentials.yaml \
		${STAGEDIR}${ETCDIR}/local_api_credentials.yaml.sample

	# updated by "cscli capi" at first service start
	@${MV} ${STAGEDIR}${ETCDIR}/online_api_credentials.yaml \
		${STAGEDIR}${ETCDIR}/online_api_credentials.yaml.sample

	@${MKDIR} ${STAGEDIR}${ETCDIR}/hub
	@${MKDIR} ${STAGEDIR}/var/db/crowdsec/data

	${INSTALL_PROGRAM} ${WRKDIR}/bin/crowdsec ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKDIR}/bin/crowdsec-cli ${STAGEDIR}${PREFIX}/bin/cscli

.include <bsd.port.mk>
