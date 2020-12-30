FROM ubuntu:21.04
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y wget

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p /miniconda
ENV PATH=$PATH:/miniconda/pcondabin:/miniconda/bin
COPY environment.yml environment.yml
RUN conda env update -f environment.yml
RUN rm environment.yml

RUN mkdir -pv /etc/ipython/
COPY ipython/ipython_config.py /etc/ipython/ipython_config.py

ENV NB_USER feynman
ENV NB_UID 1002

RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER

WORKDIR /home/${NB_USER}
USER $NB_USER

EXPOSE 8888

ENTRYPOINT ["jupyter", "notebook", "--no-browser","--ip=0.0.0.0","--NotebookApp.token=''", "--NotebookApp.password=''"]
