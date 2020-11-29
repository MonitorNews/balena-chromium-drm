FROM balenalib/amd64-ubuntu:focal-run

ENV DEBIAN_FRONTEND=noninteractive
ENV DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
ENV PULSE_SERVER=unix:/run/pulse/pulseaudio.socket
ENV EGL_PLATFORM=surfaceless
ENV HOME=/home/displayuser

ENV CHROME_VERSION=p1-87

ENV UDEV=1

RUN apt update \
 && apt -y install \
 bash sudo tzdata \
 libegl1-mesa libgles2-mesa libgl1-mesa-dri \
 vainfo i965-va-driver \
 libpulse0 libatomic1 libpci3 libnss3 libpangocairo-1.0-0 libxkbcommon0 \
 kbd \
 wget \
 && ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime \
 && dpkg-reconfigure --frontend noninteractive tzdata \
 && cd /opt \
 && wget https://anubis.steffend.me/chromium/ozone_drm/chromium-$CHROME_VERSION.tar.gz \
 && tar xvf chromium-$CHROME_VERSION.tar.gz \
 && rm chromium-$CHROME_VERSION.tar.gz \
 && apt clean && rm -rf /var/lib/apt/lists/* \
 # ----- software install finished -----
 # create user
 && useradd -u 1500 -m displayuser -s /bin/bash \
 && usermod -a -G audio,video,tty,input displayuser \
 && chown -R displayuser:displayuser /home/displayuser

WORKDIR /opt/chromium-p1

COPY ./entry.sh /opt/entry.sh

ENTRYPOINT ["bash", "/opt/entry.sh"]
CMD [""]
