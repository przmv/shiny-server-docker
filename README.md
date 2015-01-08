Docker image for RStudio Shiny Server
=====================================

Current version: 1.2.3.368

Example usage
-------------

```
$ git clone https://github.com/rstudio/shiny-examples.git
# Run shiny-server container and expose 3838 port to host
$ docker run -d \
    -v $(pwd)/shiny-examples:/srv/shiny-server \
    -p 3838:3838 \
    pshevtsov/shiny-server
```

Open the output IP address on port 3838 in your browser, e.g. http://172.17.0.100:3838
