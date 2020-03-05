# If you ever switch to a new (stable!) Ubuntu version make sure everything works with the new version!
FROM ubuntu:18.04
MAINTAINER Gerd Aschemann <gerd@aschemann.net>

ADD bin /setup/bin
WORKDIR /root

ENV SHELL=/bin/bash

# tag::install-tools[]
RUN /setup/bin/install-base
RUN /setup/bin/install-yq
RUN /setup/bin/install-hub
RUN /setup/bin/install-helm
RUN /setup/bin/install-ksync
RUN /setup/bin/install-jx
RUN /setup/bin/install-gcloud
# end::install-tools[]

