FROM golang:1.10-alpine as compiler

WORKDIR /hbin
COPY src/hackudo.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hackudohi .

FROM scratch
LABEL maintainer="Hackudo <hackudo@mailxy.org>"  \
			org.opencontainers.image.schema="1.0" \
		  org.opencontainers.image.authors="Hackudo <hackudo@mailxy.org>" \
		  org.opencontainers.image.title="Hackudo Scratch" \
			org.opencontainers.image.vendor="Hackudo" \
		  org.opencontainers.image.url="https://www.hackudo.com/dist/scratch" \
		  org.opencontainers.image.source="github.com:hackudo/hackudo-docker-scatch.git" \
		  org.opencontainers.image.licenses="apache-license-2.0-(apache-2.0)"

		  #org.opencontainers.image.documentation="" \
		  #org.opencontainers.image.description="" \

		  #org.opencontainers.image.created="$BUILD_DATE" \
		  #org.opencontainers.image.version="$BUILD_VERSION" \
		  #org.opencontainers.image.revision="$BUILD_REV" \


		  #com.hackudo.varsfile="hackudo.vars"
		  #com.hackudo.signature="$HACKUDO_SIG"
		  #com.hackudo.finger="$SIG_FINGER"
		  #com.hackudo.md5="$SIG_MD5"

		  #org.label-schema.docker.cmd.devel
		  #org.label-schema.docker.cmd.help
		  #org.label-schema.docker.params
		  #https://developercertificate.org/
		  #https://pgp.mit.edu/pks/lookup?op=get&search=0xFD5EB4DB480717ED
WORKDIR /hbin
COPY --from=compiler /hbin/hackudohi .
CMD ["/hbin/hackudohi"]