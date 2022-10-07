FROM ubuntu:18.04
ENTRYPOINT []
RUN apt-get update && apt-get install -y python3.7 python3-pip && python3 -m pip install --no-cache --upgrade pip && pip3 install --no-cache rasa==1.9.7 --use-feature=2020-resolver
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt && pip3 install httplib2>=0.20.2
ADD . /app/
RUN chmod +x /app/start_services.sh
CMD /app/start_services.sh