FROM python:3

ENV PYTHONUNBUFFERED 1

RUN python -m pip install --upgrade pip



RUN mkdir /new_app

WORKDIR /new_app

ADD . /new_app/

RUN apt-get update && apt-get install -y vim
# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

CMD python manage.py runserver 0.0.0.0:$PORT
