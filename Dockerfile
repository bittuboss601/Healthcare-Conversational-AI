FROM ubuntu:18.04
ENTRYPOINT []
# Upgrade installed packages
RUN apt update && apt upgrade -y && apt clean

# install python 3.7.10 (or newer)
RUN apt update && \
    apt install --no-install-recommends -y build-essential software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt install --no-install-recommends -y python3.7 python3.7-dev python3.7-distutils && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Register the version in alternatives (and set higher priority to 3.7)
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2

RUN apt-get -y install python3-pip

ADD . /app/
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN chmod +x /app/start_services.sh
CMD /app/start_services.sh