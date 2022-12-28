FROM ubuntu:22.04

WORKDIR /home/

COPY . .

ENV PATH "$PATH:/usr/local/go/bin:/home/$USERNAME/go/bin:/home/$USERNAME/.cargo/bin:/root/.cargo/bin"
RUN bash ./setup.sh
