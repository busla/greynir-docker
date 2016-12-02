FROM pypy:3

MAINTAINER Jon Levy "nonni@nonni.cc"

# Update aptitude with new repo

# Clone the Greynir repo
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN git clone https://github.com/busla/Reynir.git

ONBUILD COPY Reynir/requirements.txt /usr/src/app/
ONBUILD RUN pip install -r requirements.txt

ONBUILD COPY . /usr/src/app

WORKDIR /usr/src/app/Reynir 
RUN make

ADD obeyg.smaord.txt resources/obeyg.smaord.txt
ADD plastur.feb2013.txt resources/plastur.feb2013.txt
ADD SHsnid.csv resources/SHsnid.csv

WORKDIR /usr/src/app/Reynir/utils
RUN pypy3 external_data_validator.py

#VOLUME /usr/src/app/Reynir/resources

#WORKDIR /usr/src/app/Reynir
#CMD [ "pypy3", "main.py" ]
