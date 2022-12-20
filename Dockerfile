FROM mambaorg/micromamba:1.1.0

RUN micromamba install --yes --name base --channel conda-forge \
  pyopenssl=20.0.1  \
  python=3.9.1 \
  requests=2.25.1 && \
  micromamba clean --all --yes

# Get the requirements
# COPY --chown=$MAMBA_USER:$MAMBA_USER ./environment.yml /tmp/environment.yml

# # Install and activate it
# RUN micromamba install --yes --file /tmp/environment.yml && \
#   micromamba clean --all --yes
# ARG MAMBA_DOCKERFILE_ACTIVATE=1 

# ADD . /app
# WORKDIR /app

