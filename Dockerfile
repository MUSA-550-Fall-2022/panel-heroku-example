FROM mambaorg/micromamba:1.1.0

COPY . /app
WORKDIR /app

RUN micromamba install --yes --file ./environment.yml && \
  micromamba clean --all --yes

# Get the requirements
# COPY --chown=$MAMBA_USER:$MAMBA_USER ./environment.yml /tmp/environment.yml

# # Install and activate it

# ARG MAMBA_DOCKERFILE_ACTIVATE=1 

# ADD . /app
# WORKDIR /app

