#!/bin/sh
set -ex

function _install_packages() {
  LOG_FILE="/var/log/packages_installed"
  if [ -f "${LOG_FILE}" ]; then
    echo "Packages have been installed." >&2
    return
  fi
  apt update -y
  apt-get install -y openconnect dante-server
  rm -rf /var/cache/apt/* /tmp/* /var/tmp/*
  echo "at $(date +%Y-%m-%d_%H:%M:%S)" > "${LOG_FILE}"
}

function _start_proxy() {
  echo '>> Starting Socks Server...' >&2
  cat /etc/_danted.conf > /etc/danted.conf
  service danted restart
}

function _init() {
  _install_packages
  _start_proxy
}

${1:-_init}
