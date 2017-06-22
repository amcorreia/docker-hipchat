#
# DESCRIPTION:    Image with Hipchat4
# TO_BUILD:       docker build -t amcorreia/docker-hipchat .
# TO_RUN:         docker run -d --rm -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/video0 -e DISPLAY=unix$DISPLAY --name hipchat amcorreia/docker-hipchat

FROM debian:jessie

MAINTAINER  Alessandro Madruga Correia <mutley.sandro@gmail.com>

# To avoid problems with Dialog and curses wizards
ENV DEBIAN_FRONTEND noninteractive
ENV DISPLAY :0.0

RUN apt-get update -y && \
    apt-get --yes --quiet --no-install-recommends install ca-certificates apt-transport-https apt-utils wget attr lsb-release && \
    echo "deb https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client $(lsb_release -c -s) main" > /etc/apt/sources.list.d/atlassian-hipchat4.list && \
    wget -O - https://atlassian.artifactoryonline.com/atlassian/api/gpg/key/public | apt-key add - && \
    apt-get update --yes --quiet && \
    apt-get --yes --no-install-recommends install hipchat4 libx11-xcb1 libxcb-xkb1 libxcb-icccm4 libxcb-image0 \
        libxcb-render-util0 libqt5x11extras5 libgl1-mesa-swx11 libqt5gui5 && \
    rm -rf -- /var/lib/apt/lists/*

ENV USER user
ENV UID 1000
ENV GROUPS video
ENV HOME /home/$USER
RUN useradd -u $UID -m -d $HOME -s /usr/sbin/nologin -g $GROUPS $USER
#
WORKDIR $HOME
#VOLUME [ "/tmp" ]
VOLUME ["/tmp/.X11-unix"]

ENTRYPOINT [ "/opt/HipChat4/bin/HipChat4" ]

