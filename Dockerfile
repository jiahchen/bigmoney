FROM centos:centos7

RUN yum install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion
ENV HOME /home/BM
ENV ENV_PREFIX $HOME/anaconda
ENV PROJECT_NAME bigmoney

RUN mkdir $HOME
RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $HOME/anaconda.sh
RUN bash $HOME/anaconda.sh -b -p $ENV_PREFIX && rm $HOME/anaconda.sh
RUN $ENV_PREFIX/bin/conda create -n $PROJECT_NAME
ENV PATH "$ENV_PREFIX/bin:$PATH"
