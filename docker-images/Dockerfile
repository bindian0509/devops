FROM ubuntu

RUN apt update
RUN apt install python3.10 pip build-essential -y

RUN pip install flask
RUN pip install flask-mysql

COPY app.py /opt/

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080


