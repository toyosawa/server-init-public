FROM ubuntu:24.04

ENV USER=ubuntu
ENV HOME=/home/$USER
ENV WORKSPACE_DIR=$HOME/workspace

RUN apt update -y && apt-get install -y git sudo wget curl unzip
RUN echo "ubuntu ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN git clone https://github.com/toyosawa/server-init-public $HOME/server-init-public
COPY server-init.sh $HOME/server-init.sh
RUN sudo -u $USER bash $HOME/server-init.sh

RUN sudo -u $USER mkdir -p $WORKSPACE_DIR
WORKDIR $WORKSPACE_DIR
USER $USER

CMD ["bash", "-c", "while sleep 1000; do :; done"]
