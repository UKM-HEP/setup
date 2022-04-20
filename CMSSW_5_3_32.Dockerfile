FROM cmsopendata/cmssw_5_3_32-slc6_amd64_gcc472
MAINTAINER Siewyan Hoh <shoh@ukm.edu.my>

USER root
RUN yum update -y && yum install -y htop emacs
RUN mkdir -p /home/cmsusr/.ssh
COPY ssh_shared /home/cmsusr/.ssh
RUN chown -R cmsusr:cmsusr /home/cmsusr/.ssh
RUN chmod 600 /home/cmsusr/.ssh/config
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN git config --global user.email "$(git config --global user.email)"
RUN git config --global user.name "$(git config --global user.name)"
USER cmsusr
CMD ["/bin/bash"]