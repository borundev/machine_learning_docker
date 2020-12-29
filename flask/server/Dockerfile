FROM python:3.8
ADD server.py /code/
ADD requirements.txt /code/
WORKDIR /code
RUN pip install -r requirements.txt
RUN rm requirements.txt
CMD python server.py