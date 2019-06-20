# Extends STILT Dockerfile to run on tasks infrastructure 
# two special directories are assumed
#    /metdir for meteoroligical data inputs
#    /out for the output

FROM us.gcr.io/dl-ci-cd/images/tasks/public/py3.7/default:v2019.02.12

WORKDIR /app

COPY . /app

ENV TZ UTC
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
                build-essential \
                git \
                libhdf5-serial-dev \
                libnetcdf-dev \
                libssl-dev \
                locales \
                netcdf-bin \
                procps \
                r-base \
                r-base-dev \
                unzip \
                wget \
        && locale-gen en_US.UTF-8 \
        && update-locale \
        && bash setup 3 \
        && Rscript r/dependencies.r \
        && apt-get remove --purge -y \
                build-essential \
                git \
                locales \
                wget \
        && apt-get autoremove -y \
        && rm -rf /var/lib/apt/lists/* \
        && mkdir /metdir \
        && mkdir /outdir


