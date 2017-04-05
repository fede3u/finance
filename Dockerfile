FROM debian:latest

# Install dependencies
RUN apt-get update \
 && apt-get install --no-install-recommends \
                    --yes \
                    bzip2 \
                    curl \
 && rm --force \
       --recursive \
       /var/lib/apt/lists/*

ENV ANACONDA_INSTALLER_URL=https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh \
    ANACONDA_INSTALLER_SHA256=4447b93d2c779201e5fb50cfc45de0ec96c3804e7ad0fe201ab6b99f73e90302

WORKDIR /root

# Download and install Anaconda
RUN curl --fail \
         --insecure \
         --output anaconda.sh \
         ${ANACONDA_INSTALLER_URL} \
 && echo ${ANACONDA_INSTALLER_SHA256} anaconda.sh \
  | sha256sum --check \
              - \
 && bash anaconda.sh -b \
                     -p ~/anaconda \
 && rm anaconda.sh \
 && source ~/anaconda/bin/activate \
 && conda create --name zipline \
                 --yes \
                 anaconda \
                 python=3.4 \
 && source activate zipline \
 && conda install --channel Quantopian \
                  --yes \
                  zipline