FROM ubuntu:12.04.5
MAINTAINER Petr Shevtsov <petr.shevtsov@gmail.com>
RUN echo "deb http://cran.rstudio.com/bin/linux/ubuntu precise/" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
RUN apt-get update && apt-get install -y r-base wget libssl0.9.8 sudo lsb-release
RUN R -e "install.packages('shiny', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('rmarkdown', repos='http://cran.rstudio.com/')"
RUN update-locale
RUN wget http://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.2.2.367-amd64.deb
RUN dpkg --install shiny-server-1.2.2.367-amd64.deb
RUN rm shiny-server-1.2.2.367-amd64.deb
CMD /usr/bin/shiny-server
