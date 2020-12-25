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

# enable jupyter extensions
RUN jupyter contrib nbextension install
RUN jupyter nbextensions_configurator enable


# turn on extensions
RUN jupyter nbextension enable collapsible_headings/main
RUN jupyter nbextension enable rubberband/main
RUN jupyter nbextension enable toc2/main
RUN jupyter nbextension enable codefolding/main
RUN jupyter nbextension enable scratchpad/main
RUN jupyter nbextension enable --py widgetsnbextension

COPY binder binder
RUN pip install -U -r binder/requirements_tf.txt
# name is redundant here but the point is that if we don't want a default "Python 3" named kernel
# appear we cannot delete it as jupyter somehow just puts it back.
# https://github.com/jupyterhub/jupyterhub/issues/2759
# Instead we have to create a new one that is still called python3 internally but its display name
# is Tensorflow
RUN python -m ipykernel install --name python3 --display-name "Tensorflow"


RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p /miniconda
ENV PATH=$PATH:/miniconda/condabin

RUN conda env create -f binder/environment_pytorch.yml
SHELL ["conda","run","-n","pytorch","/bin/bash","-c"]
RUN python -m ipykernel install --name pytorch --display-name "PyTorch"
RUN pip install -U -r binder/requirements_pytorch.txt

SHELL ["/bin/bash","-c"]
RUN rm -rf binder
RUN rm Miniconda3-latest-Linux-x86_64.sh
