FROM python:2.7

RUN echo "deb http://research.cs.wisc.edu/htcondor/ubuntu/stable/ trusty contrib" >> /etc/apt/sources.list &&\
    echo "deb http://research.cs.wisc.edu/htcondor/ubuntu/development/ trusty contrib" >> /etc/apt/sources.list &&\
    curl http://research.cs.wisc.edu/htcondor/ubuntu/HTCondor-Release.gpg.key | apt-key add - &&\
    apt-get update &&\
    apt-get -y install condor &&\
    cd /usr/local/lib/python2.7/site-packages &&\
    cp /usr/lib/python2.7/dist-packages/htcondor.so . &&\
    cp /usr/lib/python2.7/dist-packages/classad.so .


RUN condor_status -h
