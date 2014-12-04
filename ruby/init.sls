ruby:
  cmd:
    - run
    - user: {{ pillar['user'] }}
    - name: rvm mount -r {{ pillar['ruby_binary'] }} --quiet-curl --default
    - unless: rvm list | grep {{ pillar['ruby_version'] }}
