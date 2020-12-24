FROM tensorflow/tensorflow:latest-jupyter
RUN pip install --upgrade pip
RUN apt-get update && apt-get install -y git
RUN apt-get install -y python-opengl
RUN apt-get install -y xvfb
RUN apt-get install libxrender1
RUN apt-get install -y wget

RUN pip install -U jupyter_contrib_nbextensions
RUN pip install -U jupyter_nbextensions_configurator
RUN pip install -U jupyter
RUN pip install -U ipywidgets


ARG NB_USER
ARG NB_UID

#RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER
RUN useradd -m -s /bin/bash -u $NB_UID $NB_USER

RUN mkdir -p /opt/src
RUN chown -R $NB_USER /opt/src
RUN jupyter kernelspec remove -f python3

USER $NB_USER
ENV HOME=/home/$NB_USER

WORKDIR $HOME


# enable jupyter extensions
RUN jupyter contrib nbextension install --user
RUN jupyter nbextensions_configurator enable --user


# turn on extensions
RUN jupyter nbextension enable collapsible_headings/main
RUN jupyter nbextension enable rubberband/main
RUN jupyter nbextension enable toc2/main
RUN jupyter nbextension enable codefolding/main
RUN jupyter nbextension enable scratchpad/main
RUN jupyter nbextension enable --py widgetsnbextension

COPY binder binder
RUN pip install -U -r binder/requirements_tf.txt
RUN python -m ipykernel install --user --display-name "Tensorflow"


COPY Miniconda3-latest-Linux-x86_64.sh .
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda
ENV PATH=$PATH:$HOME/miniconda/condabin

RUN conda env create -f binder/environment_pytorch.yml
SHELL ["conda","run","-n","pytorch","/bin/bash","-c"]
RUN python -m ipykernel install --user --name pytorch --display-name "PyTorch"
RUN pip install -U -r binder/requirements_pytorch.txt

USER root
RUN rm -rf binder
RUN rm Miniconda3-latest-Linux-x86_64.sh
USER $NB_USER


RUN conda init
#RUN echo "conda activate pytorch" >> ~/.bashrc

WORKDIR /opt/src

EXPOSE 8888



