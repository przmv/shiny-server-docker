FROM rocker/r-base

MAINTAINER "Petr Shevtsov" petr.shevtsov@gmail.com

ENV DEBIAN-FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    sudo \
    ca-certificates \
&& wget -q http://ftp.us.debian.org/debian/pool/main/o/openssl/libssl0.9.8_0.9.8o-4squeeze14_amd64.deb \
&& dpkg -i libssl0.9.8_0.9.8o-4squeeze14_amd64.deb && rm libssl0.9.8_0.9.8o-4squeeze14_amd64.deb \
&& (ver=$(wget -qO- https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/VERSION) \
&& wget https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/shiny-server-${ver}-amd64.deb -O shiny-server.deb \
&& dpkg -i shiny-server.deb \
&& rm shiny-server.deb)

RUN R -e "install.packages(c('shiny', 'rmarkdown'), repos='http://cran.rstudio.com/')"

RUN cp -R /usr/local/lib/R/site-library/shiny/examples/* /srv/shiny-server/

EXPOSE 3838

USER shiny
CMD ["/usr/bin/shiny-server"]
