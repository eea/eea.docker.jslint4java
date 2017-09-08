# Docker image for jslint checker

[jslint](http://www.jslint.com/) a java wrapper around the fabulous tool by Douglas Crockford, jslint (See http://jslint.com/). It provides a simple interface for detecting potential problems in JavaScript code.


## Supported tags and respective `Dockerfile` links

- [`latest` (*Dockerfile*)](https://github.com/eea/eea.docker.jslint4java/blob/master/Dockerfile)
- [`1.4.4.1` (*Dockerfile*)](https://github.com/eea/eea.docker.jslint4java/blob/1.4.4.1/Dockerfile)

## Usage

    $ docker run --rm -v /path/to/python/code:/code eeacms/jslint4java

or

    $ docker run --rm -v eeacms/jslint4java https://github.com/eea/eea.similarity.git

See jslint4java `--help` for more options:


    $ docker run --rm eeacms/jslint4java
