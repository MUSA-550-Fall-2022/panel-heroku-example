FROM mambaorg/micromamba:1.1.0

# Get the requirements
COPY ./environment.yml /tmp/environment.yml

# Install and activate it
RUN micromamba install --yes --file /tmp/environment.yml && \
  micromamba clean --all --yes
ARG MAMBA_DOCKERFILE_ACTIVATE=1 

ADD . /opt/webapp/
WORKDIR /opt/webapp

