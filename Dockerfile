FROM heroku/heroku:20-build

USER root
WORKDIR /build

# Install required dependencies
RUN apt update && apt-get install -y git make cmake gcc g++ libmad0-dev \
  libid3tag0-dev libsndfile1-dev libgd-dev libboost-filesystem-dev \
  libboost-program-options-dev \
  libboost-regex-dev

# Extract source
COPY src/1.5.1.tar.gz .
RUN tar xzvf 1.5.1.tar.gz

# Build
RUN cd audiowaveform-1.5.1/ && \
  cmake -D ENABLE_TESTS=0 . && \
  make -j $(nproc) && \
  strip audiowaveform
