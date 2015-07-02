FROM rocker/hadleyverse
MAINTAINER Paul Staab <develop (at) paulstaab.de>

#RUN apt-get install -y --no-install-recommends -t testing \
#    seq-gen  \
#    valgrind \
#  && apt-get clean \
#  && rm -rf /var/lib/apt/lists/ \
#  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN Rscript -e 'devtools::install_github("statgenlmu/coala")' \
  && Rscript -e 'devtools::install_github("statgenlmu/jaatha")'

