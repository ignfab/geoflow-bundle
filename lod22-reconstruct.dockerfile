FROM scratch
ARG VERSION
LABEL org.opencontainers.image.authors="Léa Vauchier <lea.vauchier@ign.fr>"
LABEL org.opencontainers.image.title="lod22-reconstruct"
LABEL org.opencontainers.image.description="Tool for reconstructing building models"
LABEL org.opencontainers.image.licenses="(GPL-3.0 AND AGPL-3.0)"
LABEL org.opencontainers.image.version=$VERSION

COPY --from=ignfab/geoflow-builder:2022.06.17-debug /export/ /
COPY flowcharts/reconstruct_custom.json /usr/local/geoflow-flowcharts/

ENTRYPOINT ["/usr/local/bin/geof", "/usr/local/geoflow-flowcharts/reconstruct_custom.json"]
CMD ["--help"]