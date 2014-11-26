
gnupg2:
  pkg.installed

# RVM is now signed and requires you to accept the gpg key first
rvm_gpg:
  cmd:
    - run
    - name: command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
    - user: {{ pillar['user'] }}
    - unless: gpg2 -k | grep 'RVM signing'
    - require:
      - pkg: gnupg2
