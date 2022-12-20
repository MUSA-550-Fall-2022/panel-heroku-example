FROM mambaorg/micromamba:1.1.0

# Get the requirements
COPY . /app
WORKDIR /app

RUN ls .
RUN cat environment.yml

# Install and activate it
RUN micromamba install --yes --file environment.yml && \
  micromamba clean --all --yes
ARG MAMBA_DOCKERFILE_ACTIVATE=1 


