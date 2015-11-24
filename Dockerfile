FROM python:2.7-slim
MAINTAINER Secret Sauce Partners, Inc. <dev@sspinc.io>

RUN mkdir -p /etc/luigi
ADD luigi.cfg /etc/luigi/luigi.cfg

# Install Pip requirements
RUN pip install --upgrade pip
RUN pip install luigi==1.3.0

ENTRYPOINT ["luigid"]
