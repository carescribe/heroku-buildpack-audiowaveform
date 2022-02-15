# Heroku buildpack: audiowaveform

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks) for using audiowaveform.

## Lineage

Originally based on [Mattchewone/heroku-buildpack-audiowaveform](https://github.com/Mattchewone/heroku-buildpack-audiowaveform).

## Compatibility

Tested on the [Heroku-20 stack](https://devcenter.heroku.com/articles/heroku-20-stack).

## Dependencies

We build and ship our own version of `audiowaveform`.

Heroku must have the dependencies required installed. We do this using
[heroku-buildpack-apt](https://github.com/heroku/heroku-buildpack-apt). The
required dependencies are:

    libmad0-dev
    libid3tag0-dev
    libsndfile1-dev
    libgd-dev

Add them to `Aptfile` in the root of your application.

## Building the `audiowaveform` binary

Build the binary inside the Docker image

    docker build . -f Dockerfile -t audiowaveform-builder

Copy the built binary to /dist/

    docker run -it -v (pwd)/dist/:/dist --rm audiowaveform-builder cp /build/audiowaveform-1.5.1/audiowaveform /dist/audiowaveform/bin/

Create an archive

    cd build/
    tar -zcvf audiowaveform.tar.gz audiowaveform

