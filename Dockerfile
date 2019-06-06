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

ENV MINICONDA_INSTALLER_URL=https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    PATH=~/miniconda3/bin:$PATH \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

WORKDIR /root

# Install Anaconda, Quandal and configure Jupyter Notebook
RUN curl --fail \
         --insecure \
         --output install.sh \
         ${MINICONDA_INSTALLER_URL} \
 && bash install.sh -b \
                    -p ~/miniconda3 \
 && rm install.sh \
 && bash -c "source activate \
          && conda update --yes \
                          conda \
          && conda create --name finance \
                          --yes \
                          anaconda \
          && source activate finance \
          && conda install --channel conda-forge \
                           --yes\
                           quandl \
          && conda install --channel conda-forge \
                           --yes \
                           jupyterlab "\
 && mkdir .finance \
          notebooks

CMD bash -c "source activate finance \
          && jupyter lab --ip='*' \
                              --no-browser \
                              --notebook-dir=~/notebooks \
                              --NotebookApp.token=''"
