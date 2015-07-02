FROM rocker/hadleyverse
MAINTAINER Paul Staab <develop (at) paulstaab.de>

#RUN apt-get install -y --no-install-recommends -t testing \
#    seq-gen  \
#    valgrind \
#  && apt-get clean \
#  && rm -rf /var/lib/apt/lists/ \
#  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN cd /usr/local/bin \
  && wget http://pst-public.s3-website.eu-central-1.amazonaws.com/msms.jar \ 
  && chmod 644 msms.jar \
  && wget http://pst-public.s3-website.eu-central-1.amazonaws.com/ms \
  && chmod 755 ms

RUN Rscript -e 'devtools::install_github("statgenlmu/coala")' \
  && Rscript -e 'devtools::install_github("statgenlmu/jaatha")'

