FROM ubuntu:18.04
ENTRYPOINT []
RUN apt-get update && apt-get install -y python3.7 python3-pip && python3 -m pip install --no-cache --upgrade pip && pip3 install --no-cache rasa==1.9.7 --use-feature=2020-resolver && pip3 install --no-cache tensorflow==2.6 && pip3 install --no-cache tensorflow-addons==0.16.1
ADD . /app/
RUN chmod +x /app/start_services.sh
CMD /app/start_services.sh