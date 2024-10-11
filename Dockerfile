FROM debian

ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir /opt/voipanswer

# C component of application
RUN apt-get update && apt-get -y install build-essential libpopt-dev
RUN mkdir /opt/voipanswer/c
COPY c /opt/voipanswer/c
WORKDIR /opt/voipanswer/c
RUN ls -la /opt/voipanswer
RUN ls -la /opt/voipanswer/c
RUN make
RUN make test

# Python component of application
RUN apt-get update && apt-get -y install python3 python3-pip python3-venv
RUN mkdir /opt/voipanswer/python
COPY python /opt/voipanswer/python
WORKDIR /opt/voipanswer/python
RUN python3 -m venv venv
RUN venv/bin/pip install .

RUN mkdir /opt/voipanswer/wav
COPY wav /opt/voipanswer/wav

WORKDIR /opt/voipanswer
ENTRYPOINT ["c/bin/voip-answer", "--rec-script", "python/voip-rec-email/voip_rec_email.py", "--directory", "wav", "-v", "-V"]
