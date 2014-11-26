
/etc/motd:
  file.managed:
    - source: salt://environment/motd
    - replace: True

/home/{{ pillar['user'] }}/.profile:
  file.append:
    - text:
        - cd /vagrant

/home/{{ pillar['user'] }}/.bash_profile:
  file.append:
    - text: source ~/.profile
