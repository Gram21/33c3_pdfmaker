FROM debian:latest

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python2.7 texlive-latex-base git gcc make screen

# make nsjail
RUN git clone https://github.com/google/nsjail.git /.nsjail
RUN cd /.nsjail && make && cp /.nsjail/nsjail /bin/nsjail


# Delete some cache files to make the image smaller
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN groupadd -g 1000 pdfmaker && useradd -g pdfmaker -m -u 1000 pdfmaker -s /bin/bash

ADD deploy_key /.deploy_key

USER pdfmaker
ENV HOME /home/pdfmaker

ENV RLIMIT_AS def
ENV RLIMIT_CORE def
ENV RLIMIT_CPU def
ENV RLIMIT_FSIZE 1
ENV RLIMIT_NOFILE 16
ENV RLIMIT_NPROC def
ENV RLIMIT_STACK def

RUN cd && \
    mkdir .ssh && chmod 700 .ssh && \
    cp /.deploy_key .ssh/id_rsa && \
    chmod 600 .ssh/id_rsa && \
    ssh-keyscan github.com >> .ssh/known_hosts && \
    git clone git@github.com:Gram21/pdfmaker_chall.git .chall

RUN echo "export HISTFILE=" >> ~/.bashrc
RUN rm -f ~/.bash_history
CMD ~/.chall/challenge/start_challenge.sh; /bin/bash