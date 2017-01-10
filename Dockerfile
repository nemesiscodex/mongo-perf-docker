FROM python:2.7-alpine

RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    echo http://dl-4.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    echo http://dl-4.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
 apk add --no-cache mongodb zip wget

RUN wget https://github.com/mongodb/mongo-perf/archive/master.zip -O /mongo-perf.zip && \
    unzip /mongo-perf.zip -d / && rm /mongo-perf.zip

WORKDIR /mongo-perf-master/

ENTRYPOINT ["python", "benchrun.py"]
CMD ["--help"]

