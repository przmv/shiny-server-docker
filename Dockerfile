FROM pshevtsov/r

ENV CRAN_MIRROR http://cran.rstudio.com/
ENV DEBIAN_FRONTEND noninteractive
ENV SHINY_SERVER_DEB http://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.2.3.368-amd64.deb

USER root

RUN R -e "install.packages(c('shiny', 'rmarkdown'), repos='$CRAN_MIRROR')"

RUN apt-get update; apt-get -y upgrade
RUN apt-get install -y libssl0.9.8

RUN update-locale

ADD $SHINY_SERVER_DEB /
RUN dpkg --install /$(basename $SHINY_SERVER_DEB)
RUN rm /$(basename $SHINY_SERVER_DEB)

EXPOSE 3838

USER shiny
CMD /usr/bin/shiny-server
