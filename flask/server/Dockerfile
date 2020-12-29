FROM python:3.8
ADD requirements.txt /code/
WORKDIR /code
RUN pip install -r requirements.txt
RUN rm requirements.txt
ADD server.py /code/
CMD python server.py