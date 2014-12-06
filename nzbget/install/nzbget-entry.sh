#!/bin/bash

set -e

[ ! -d /nzget/conf ] && mkdir -p /nzbget/conf
[ ! -d /nzget/data ] && mkdir -p /nzbget/data

function gen_conf {
  cat /usr/share/nzbget/nzbget.conf | \
        sed 's|MainDir=.*|MainDir=/nzbget/conf|g' | \
        sed 's|DestDir=.*|DestDir=/nzbget/data/incoming|g' | \
        sed 's|InterDir=.*||g' | \
        sed 's|NzbDir=.*|NzbDir=/nzbget/nzb|g' | \
        sed 's|QueueDir=.*|QueueDir=/nzbget/state/queue|g' | \
        sed 's|TempDir=.*|TempDir=/nzbget/state/temp|g' | \
        sed 's|LogFile=.*|LogFile=/nzbget/state/nzbget.log|g' | \
        sed 's|ScriptDir=.*|ScriptDir=/nzbget/scripts|g' | \
        sed 's|LockFile=.*|LockFile=/var/run/nzbget.lock|g'
}

if [ ! -f /nzbget/conf/nzbget.conf ]; then
  mkdir -p /nzbget/data/incoming
  mkdir -p /nzbget/nzb
  mkdir -p /nzbget/state
  mkdir -p /nzbget/scripts

  gen_conf > /nzbget/conf/nzbget.conf
fi

if [ /usr/share/nzbget/nzbget.conf -nt /nzbget/conf/nzbget.conf ]; then
  echo "WARNING: your config file is older than nzbget's defaults" >&2
  echo "         new config file stored as nzbget.conf.new" >&2

  gen_conf > /nzbget/conf/nzbget.conf.new
fi

nzbget --configfile /nzbget/conf/nzbget.conf $@
