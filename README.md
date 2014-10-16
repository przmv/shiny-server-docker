Docker image for RStudio Shiny Server
=====================================

Current version: 1.2.3.368

Example usage
-------------

```
$ git clone https://github.com/rstudio/shiny-examples.git
# Rub shiny-server container and output its IP address
$ docker run -d -v $(pwd)/shiny-examples:/srv/shiny-server pshevtsov/shiny-server | \
    xargs docker inspect --format '{{ .NetworkSettings.IPAddress }}'
```

Open the output IP address on port 3838 in your browser, e.g. http://172.17.0.100:3838
