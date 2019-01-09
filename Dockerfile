FROM node:10-alpine
MAINTAINER Gabriel Malet <gmalet@galilee.fr>

RUN apk --no-cache add \
        bash \
        openssh-client \
        git \
        shadow \
        python \
        py-pip \
        groff \
        less \
    && chsh -s /bin/bash

RUN pip install --upgrade awscli
RUN rm -rf ~/.cache/pip /var/cache/apk/* /tmp/* /var/tmp/*

RUN mkdir -p /root/.ssh
COPY resources/ssh_config /root/.ssh/config
COPY resources/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
