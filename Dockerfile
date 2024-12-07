# from ros:humble
from ros:foxy

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND=noninteractive

# install apt packages
COPY deps/packages.txt deps/packages.txt
RUN apt-get update && apt-get install -q -y --no-install-recommends \
    $(cat deps/packages.txt) \
    && rm -rf /var/lib/apt/lists/* && apt-get clean

RUN git config --global --add safe.directory /f1tenth_system
RUN git config --global user.email "formula@ualberta.ca"
RUN git config --global user.name "formula"

RUN echo -e "\nsource /f1tenth_system/hardware_bashrc.sh" >> /root/.bashrc


ENTRYPOINT [ "/bin/bash" ]
