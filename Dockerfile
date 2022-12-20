FROM mambaorg/micromamba:1.1.0

ENV MAMBA_USER=mambauser
USER $MAMBA_USER

# Get the requirements
COPY --chown=$MAMBA_USER:$MAMBA_USER ./environment.yml /tmp/environment.yml

# Install and activate it
RUN micromamba install --yes --file /tmp/environment.yml && \
  micromamba clean --all --yes
ARG MAMBA_DOCKERFILE_ACTIVATE=1 

ADD . /app
WORKDIR /app

