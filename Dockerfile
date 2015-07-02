FROM rocker/hadleyverse
MAINTAINER Paul Staab <develop (at) paulstaab.de>

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    seq-gen  \
    valgrind \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN Rscript -e 'devtools::install("statgenlmu/coala")' &&
    Rscript -e 'devtools::install("statgenlmu/jaatha")'
 
