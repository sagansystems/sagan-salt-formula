
ruby:
  cmd:
    - run
    - user: {{ pillar['user'] }}
    - name: rvm mount -r {{ pillar['ruby']['binary'] }} --quiet-curl
