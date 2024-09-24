# Use a base image with TensorFlow installed
FROM tensorflow/tensorflow:1.4.0-py3

# Set the working directory
WORKDIR /app

# Upgrade pip and setuptools
RUN pip install --upgrade pip setuptools

RUN apt-get update && apt-get install -y python3-tk

# Install required libraries
RUN pip install --no-cache-dir --index-url=https://pypi.org/simple/ \
    keras==2.1.3 \
    numpy \
    scipy \
    pillow \
    scikit-image

# Copy your code into the container (adjust the path as needed)
COPY . /app

# Command to run your application (adjust as needed)
CMD ["python", "cifar10_cnn.py"]
