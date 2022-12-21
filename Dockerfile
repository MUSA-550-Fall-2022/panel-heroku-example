# Container for building the environment
FROM condaforge/mambaforge:latest as conda

COPY environment.yml .
RUN mamba env create -p /env --file environment.yml && conda clean -afy
COPY . /pkg
RUN conda run -p /env python -m pip install --no-deps /pkg

# Distroless for execution
FROM gcr.io/distroless/base-debian10

COPY --from=conda /env /env
