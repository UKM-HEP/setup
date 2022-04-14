FROM cmsopendata/cmssw_5_3_32-slc6_amd64_gcc472
MAINTAINER Siewyan Hoh <shoh@ukm.edu.my>

USER root
RUN yum update -y && yum install -y htop emacs
RUN mkdir -p /home/cmsusr/.ssh
COPY ssh_shared /home/cmsusr/.ssh
RUN chown -R cmsusr:cmsusr /home/cmsusr/.ssh
USER cmsusr
CMD ["/bin/bash"]