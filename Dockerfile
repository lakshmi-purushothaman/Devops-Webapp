FROM python:3.7-slim-buster as parent
RUN apt-get update -y

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . /app

EXPOSE 8080

FROM parent as development
ENTRYPOINT ["python"]
CMD ["run.py"]

FROM parent as test
ENTRYPOINT ["pytest", "python"]
CMD ["run.py"]