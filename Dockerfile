FROM python:3.5-slim
MAINTAINER Zadkiel Aslafy-Aharonian <zadkiel.aharonian@gmail.com>

RUN mkdir -p /etc/luigi
ADD luigi.cfg /etc/luigi/luigi.cfg

# Install requirements
RUN pip install --upgrade pip
RUN pip install luigi==2.0.1

# Fix last version task summary bug
RUN sed -i "s/= _get_set_of_params(tasks)/= {}/" /usr/local/lib/python3.5/site-packages/luigi/execution_summary.py

ENTRYPOINT ["luigid"]
