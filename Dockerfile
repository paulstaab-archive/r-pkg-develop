FROM rocker/tidyverse
MAINTAINER Paul Staab <develop (at) paulstaab.de>

# Install ssh and java
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
     default-jre \
     libssl-dev \
     openssh-client \
     qpdf \
     rsync \
     texlive-fonts-extra \
     texlive-fonts-recommended \
     texlive-latex-base \
     texi2html \
     texinfo && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/ && \
  rm -rf /tmp/downloaded_packages/ /tmp/*.rds 
  
# Install my R Packages with suggested dependencies
RUN install2.r --error --deps "TRUE" \
    coala \
    jaatha \
    scrm

# Entrypoints with name "/init" cause problems with
# Red Hat's patched version of docker.
# Hence rename it to /ep
RUN mv /init /ep

CMD ["/ep"]

