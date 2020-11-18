#!/bin/bash

# Reconfigure netdev User id if set by user
if [ ! -z "${NETDEV_UID}" ]; then
  echo "Update uid for user netdev with ${NETDEV_UID}"
  usermod -u ${NETDEV_UID} netdev
fi

if [ ! -z "${NETDEV_GID}" ]; then
  echo "Update gid for group netdev with ${NETDEV_GID}"
  groupmod -g ${NETDEV_GID} netdev
fi

export PATH=$PATH:/home/netdev/.local/bin
cd /projects/
su - netdev -c "cd /projects && /bin/zsh"