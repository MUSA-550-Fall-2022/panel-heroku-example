FROM mambaorg/micromamba:1.1.0

# Get the requirements
COPY . /app
WORKDIR /app

# Install and activate it
RUN micromamba install --yes --file /app/environment.yml && \
  micromamba clean --all --yes
ARG MAMBA_DOCKERFILE_ACTIVATE=1 


