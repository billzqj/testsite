# this is an official Python runtime, used as the parent image
FROM python:3.6.4-slim

# set the working directory in the container to /app
WORKDIR /app

# add the current directory to the container as /app
COPY sourcecode /app

# execute everyone's favorite pip command, pip install 
RUN pip install --trusted-host pypi.python.org flask==1.0.2

# unblock port 80 for the Flask app to run on
EXPOSE 5000

# execute the Flask app
CMD ["python", "main.py"]
