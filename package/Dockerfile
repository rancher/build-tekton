FROM registry.suse.com/bci/bci-base:15.4.27.11.28
RUN zypper -n update && \
    zypper -n install --no-recommends openssh git && \
    zypper -n clean -a
RUN useradd -U -m gituser
USER gituser
COPY bin/* /usr/bin/
ENTRYPOINT ["entrypoint"]
