FROM python:alpine
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
WORKDIR /app
COPY . .
CMD python bookstore-api.py