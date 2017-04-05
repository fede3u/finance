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

ENV ANACONDA_INSTALLER_URL=https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

WORKDIR /root

# Download and install Anaconda and Zipline
RUN curl --fail \
         --insecure \
         --output install.sh \
         ${ANACONDA_INSTALLER_URL} \
 && bash install.sh -b \
                    -p ~/miniconda \
 && rm install.sh \
 && bash -c "source ~/miniconda/bin/activate \
          && conda create --name zipline \
                          --yes \
                          anaconda \
                          python=3.4 \
          && source activate zipline \
          && conda install --channel Quantopian \
                           --yes \
                           zipline"