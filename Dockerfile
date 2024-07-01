FROM registry.suse.com/bci/golang:1.22 as builder

ENV TEKTON_TAG v0.41.0
ENV GO111MODULE off

RUN zypper -n install --no-recommends git docker vim curl wget ca-certificates
RUN mkdir -p /go/src/github.com/tektoncd/pipeline && \
	git clone --depth 1 --branch ${TEKTON_TAG} https://github.com/tektoncd/pipeline.git /go/src/github.com/tektoncd/pipeline

WORKDIR /go/src/github.com/tektoncd/pipeline
COPY scripts scripts
RUN /usr/bin/bash scripts/build


FROM registry.suse.com/bci/bci-base:15.6
RUN zypper -n update && \
    zypper -n install --no-recommends openssh git && \
    zypper -n clean -a
RUN useradd -U -m gituser
USER gituser
COPY --from=builder /go/src/github.com/tektoncd/pipeline/bin/entrypoint /usr/bin/
COPY --from=builder /go/src/github.com/tektoncd/pipeline/bin/git-init /usr/bin/
ENTRYPOINT ["entrypoint"]
