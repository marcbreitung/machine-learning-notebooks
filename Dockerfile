FROM jupyter/tensorflow-notebook

USER root
ENV DEBIAN_FRONTEND noninteractive
ENV OMP_NUM_THREADS 8

ENV OCTAVE_CLI_OPTIONS "--path /home/jovyan/mdtoolbox/mdtoolbox"

RUN apt-get -y update \
 && apt-get -y install \
      less \
      gnuplot \
      libnetcdf-dev \
      octave \
      liboctave-dev \
      git \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

USER jovyan
WORKDIR /home/jovyan

RUN octave --no-gui --eval "pkg install -verbose -forge -auto netcdf"
RUN octave --no-gui --eval "pkg install -verbose -forge -auto io"
RUN octave --no-gui --eval "pkg install -verbose -forge -auto statistics"

RUN git clone https://github.com/ymatsunaga/mdtoolbox.git

WORKDIR /home/jovyan/mdtoolbox

RUN octave --no-gui --eval "make"

RUN echo addpath\(\'/home/jovyan/mdtoolbox/mdtoolbox\'\)\; >/home/jovyan/.octaverc

RUN pip install --upgrade pip
RUN pip install octave_kernel

RUN pip install --quiet \
    keras && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

WORKDIR /home/jovyan/work