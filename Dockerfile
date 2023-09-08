FROM node:20

RUN apt-get -y update && apt-get -y install --no-install-recommends python3-pip npm curl zip groff python3-virtualenv
RUN npm install -g aws-cdk

RUN curl -sSL https://get.docker.com/ | sh

COPY requirements.txt .

RUN pip3 install -r requirements.txt --break-system-packages

WORKDIR /files
COPY . /files

RUN chmod a+x /files/*.py /files/*.sh