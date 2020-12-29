FROM jupyter/minimal-notebook
RUN pip install -U pip
ADD requirements.txt /home/jovyan

WORKDIR /home/jovyan
RUN pip install -U -r requirements.txt

ADD home/images /home/jovyan/images
ADD home/Client.ipynb /home/jovyan

RUN rm requirements.txt

USER root
RUN chown -R jovyan:users /home/jovyan
USER jovyan



#ENTRYPOINT ["jupyter", "notebook", "--no-browser","--ip=0.0.0.0","--NotebookApp.token=''",
#"--NotebookApp.password=''"]
