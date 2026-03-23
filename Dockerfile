FROM jupyter/scipy-notebook

USER root

# Install Ruby + build deps needed by IRuby native gems
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  ruby ruby-dev \
  build-essential \
  libzmq3-dev \
  && rm -rf /var/lib/apt/lists/*

# Install IRuby system-wide
RUN gem install --no-document iruby

# Register IRuby kernel for the notebook user
USER $NB_UID
RUN iruby register --force