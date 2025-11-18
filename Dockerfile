FROM python:latest

RUN pip install virtualenv

ENV VIRTUAL_ENV=/venv

RUN virtualenv venv -p python

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /app

ADD . /app

RUN pip install -r requirements.txt

RUN pip list --outdated

RUN pip install --upgrade Flask gunicorn itsdangerous jinja2 MarkupSafe Werkzeug

EXPOSE 5000

ENTRYPOINT ["python", "app.py"]

