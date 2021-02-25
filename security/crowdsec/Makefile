# $FreeBSD$

PORTNAME=	crowdsec
PORTVERSION=	1.0.7
DISTVERSIONPREFIX=	v
CATEGORIES=	security

MAINTAINER=	sbz@FreeBSD.org
COMMENT=	Crowdsec lightweight and collaborative security engine

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:modules

USE_GITHUB=yes

GH_ACCOUNT=	crowdsecurity

GH_TUPLE=	\
		go-playground:locales:v0.13.0:go_playground_locales/vendor/github.com/go-playground/locales \
		go-playground:universal-translator:v0.17.0:go_playground_universal_translator/vendor/github.com/go-playground/universal-translator \
		go-playground:validator:v10.4.1:go_playground_validator_v10/vendor/github.com/go-playground/validator/v10 \
		go-sql-driver:mysql:681ffa848bae:go_sql_driver_mysql/vendor/github.com/go-sql-driver/mysql \
		go-stack:stack:v1.8.0:go_stack_stack/vendor/github.com/go-stack/stack \
		go-tomb:tomb:d5d1b5820637:go_tomb_tomb_1/vendor/gopkg.in/tomb.v2 \
		go-tomb:tomb:dd632973f1e7:go_tomb_tomb/vendor/gopkg.in/tomb.v1 \
		go-yaml:yaml:eeeca48fe776:go_yaml_yaml_1/vendor/gopkg.in/yaml.v3 \
		go-yaml:yaml:v2.4.0:go_yaml_yaml/vendor/gopkg.in/yaml.v2 \
		gogo:protobuf:v1.3.2:gogo_protobuf/vendor/github.com/gogo/protobuf \
		golang:crypto:eec23a3978ad:golang_crypto/vendor/golang.org/x/crypto \
		golang:mod:v0.4.1:golang_mod/vendor/golang.org/x/mod \
		golang:net:6772e930b67b:golang_net/vendor/golang.org/x/net \
		golang:protobuf:v1.4.3:golang_protobuf/vendor/github.com/golang/protobuf \
		golang:sys:4bcb84eeeb78:golang_sys/vendor/golang.org/x/sys \
		golang:term:2321bbc49cbf:golang_term/vendor/golang.org/x/term \
		golang:text:v0.3.5:golang_text/vendor/golang.org/x/text \
		google:go-genproto:6edceaf6022f:google_go_genproto/vendor/google.golang.org/genproto \
		google:go-querystring:v1.0.0:google_go_querystring/vendor/github.com/google/go-querystring \
		google:uuid:v1.1.5:google_uuid/vendor/github.com/google/uuid \
		goombaio:namegenerator:989e774b106e:goombaio_namegenerator/vendor/github.com/goombaio/namegenerator \
		grpc:grpc-go:v1.35.0:grpc_grpc_go/vendor/google.golang.org/grpc \
		hashicorp:go-version:v1.2.1:hashicorp_go_version/vendor/github.com/hashicorp/go-version \
		inconshreveable:mousetrap:v1.0.0:inconshreveable_mousetrap/vendor/github.com/inconshreveable/mousetrap \
		josharian:intern:v1.0.0:josharian_intern/vendor/github.com/josharian/intern \
		json-iterator:go:v1.1.10:json_iterator_go/vendor/github.com/json-iterator/go \
		kballard:go-shellquote:95032a82bc51:kballard_go_shellquote/vendor/github.com/kballard/go-shellquote \
		leodido:go-urn:v1.2.1:leodido_go_urn/vendor/github.com/leodido/go-urn \
		lib:pq:v1.9.0:lib_pq/vendor/github.com/lib/pq \
		logrusorgru:grokky:47edf017d42c:logrusorgru_grokky/vendor/github.com/logrusorgru/grokky \
		mailru:easyjson:v0.7.6:mailru_easyjson/vendor/github.com/mailru/easyjson \
		mattn:go-colorable:v0.1.8:mattn_go_colorable/vendor/github.com/mattn/go-colorable \
		mattn:go-isatty:v0.0.12:mattn_go_isatty/vendor/github.com/mattn/go-isatty \
		mattn:go-runewidth:v0.0.10:mattn_go_runewidth/vendor/github.com/mattn/go-runewidth \
		mattn:go-sqlite3:v2.0.3:mattn_go_sqlite3/vendor/github.com/mattn/go-sqlite3 \
		matttproud:golang_protobuf_extensions:v1.0.1:matttproud_golang_protobuf_extensions/vendor/github.com/matttproud/golang_protobuf_extensions \
		mgutz:ansi:d51e80ef957d:mgutz_ansi/vendor/github.com/mgutz/ansi \
		mitchellh:mapstructure:v1.4.1:mitchellh_mapstructure/vendor/github.com/mitchellh/mapstructure \
		moby:moby:v20.10.2:moby_moby/vendor/github.com/docker/docker \
		modern-go:concurrent:bacd9c7ef1dd:modern_go_concurrent/vendor/github.com/modern-go/concurrent \
		modern-go:reflect2:v1.0.1:modern_go_reflect2/vendor/github.com/modern-go/reflect2 \
		mohae:deepcopy:c48cc78d4826:mohae_deepcopy/vendor/github.com/mohae/deepcopy \
		mongodb:mongo-go-driver:v1.4.4:mongodb_mongo_go_driver/vendor/go.mongodb.org/mongo-driver \
		natefinch:lumberjack:v2.0.0:natefinch_lumberjack/vendor/gopkg.in/natefinch/lumberjack.v2 \
		nxadm:tail:v1.4.6:nxadm_tail/vendor/github.com/nxadm/tail \
		olekukonko:tablewriter:v0.0.4:olekukonko_tablewriter/vendor/github.com/olekukonko/tablewriter \
		opencontainers:go-digest:v1.0.0:opencontainers_go_digest/vendor/github.com/opencontainers/go-digest \
		opencontainers:image-spec:v1.0.1:opencontainers_image_spec/vendor/github.com/opencontainers/image-spec \
		oschwald:geoip2-golang:v1.4.0:oschwald_geoip2_golang/vendor/github.com/oschwald/geoip2-golang \
		oschwald:maxminddb-golang:v1.8.0:oschwald_maxminddb_golang/vendor/github.com/oschwald/maxminddb-golang \
		pkg:errors:v0.9.1:pkg_errors/vendor/github.com/pkg/errors \
		pmezard:go-difflib:v1.0.0:pmezard_go_difflib/vendor/github.com/pmezard/go-difflib \
		prometheus:client_golang:v1.9.0:prometheus_client_golang/vendor/github.com/prometheus/client_golang \
		prometheus:client_model:v0.2.0:prometheus_client_model/vendor/github.com/prometheus/client_model \
		prometheus:common:v0.15.0:prometheus_common/vendor/github.com/prometheus/common \
		prometheus:procfs:v0.3.0:prometheus_procfs/vendor/github.com/prometheus/procfs \
		prometheus:prom2json:v1.3.0:prometheus_prom2json/vendor/github.com/prometheus/prom2json \
		protocolbuffers:protobuf-go:v1.25.0:protocolbuffers_protobuf_go/vendor/google.golang.org/protobuf \
		rivo:uniseg:v0.2.0:rivo_uniseg/vendor/github.com/rivo/uniseg \
		russross:blackfriday:v2.1.0:russross_blackfriday_v2/vendor/github.com/russross/blackfriday/v2 \
		sirupsen:logrus:v1.7.0:sirupsen_logrus/vendor/github.com/sirupsen/logrus \
		spf13:cobra:v1.1.1:spf13_cobra/vendor/github.com/spf13/cobra \
		spf13:pflag:v1.0.5:spf13_pflag/vendor/github.com/spf13/pflag \
		stretchr:testify:v1.6.1:stretchr_testify/vendor/github.com/stretchr/testify \
		ugorji:go:v1.2.3:ugorji_go_codec/vendor/github.com/ugorji/go

GO_BUILDFLAGS=	-ldflags "-s -w \
		-X github.com/crowdsecurity/crowdsec/pkg/cwversion.Version=${PORTVERSION}"

GO_TARGET=	./cmd/crowdsec \
		./cmd/crowdsec-cli

PLIST_FILES=	bin/crowdsec \
		bin/crowdsec-cli

.include <bsd.port.mk>
