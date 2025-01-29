FROM python:alpine3.21
ADD helloworld.py /
RUN pip install flask
RUN pip install flask_restful
EXPOSE 5000
CMD [ "python", "./helloworld.py"]
