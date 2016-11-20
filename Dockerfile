FROM rocker/tidyverse
MAINTAINER Paul Staab <develop (at) paulstaab.de>

# Install ssh and java
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     openssh-client \
     default-jre \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Entrypoints with name "/init" cause problems with
# RedHeads patched version of docker.
# Hence rename it to /ep
RUN mv /init /ep

CMD ["/ep"]

