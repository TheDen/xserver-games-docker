FROM ubuntu:16.04

RUN apt-get -y update \
      && apt-get install -y --no-install-recommends sudo xauth xorg \
      && apt-get install -y --no-install-recommends gnome-games bomber bovo granatier kajongg kapman katomic kblackbox kblocks kbounce kbreakout kdiamond kfourinline kgoldrunner kigo killbots kiriki kjumpingcube klickety klines kmahjongg kmines knavalbattle knetwalk kolf kollision konquest kpat kreversi kshisen ksirk ksnakeduel kspaceduel ksquares ksudoku ktuberling kubrick lskat palapeli picmi \
      && adduser --disabled-password --gecos '' ubuntu \
      && adduser ubuntu sudo \
      && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
      && rm -rf /var/lib/apt/lists/*

USER ubuntu
ENV PATH $PATH:/usr/games/
WORKDIR /home/ubuntu
COPY --chown=ubuntu start.sh /home/ubuntu
RUN ls -A /usr/games | xargs -n 1 -I {} -P $(nproc) sh -c "apt-cache search ^{}$" > ${HOME}/gamelist \
      && touch ~/.hushlogin \
      && chmod a+x $HOME/start.sh

ENTRYPOINT ["./start.sh"]
