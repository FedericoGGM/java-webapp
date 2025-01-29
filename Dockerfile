#FROM python:3
FROM python:3.11-slim
ADD helloworld.py /
RUN pip install flask
RUN pip install flask_restful
EXPOSE 5000
CMD [ "python", "./helloworld.py"]
