FROM ubuntu:16.04
MAINTAINER jaekwon park <jaekwon.park@code-post.com>


# Configure apt
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends libnss-ldapd libpam-ldapd openssh-server && \
     apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD entrypoint.sh /usr/local/bin/

RUN mkdir -p /var/run/sshd && chmod u+x /usr/local/bin/entrypoint.sh

VOLUME /sshd_key /etc/profile.d/

EXPOSE 22

CMD ["entrypoint.sh"]