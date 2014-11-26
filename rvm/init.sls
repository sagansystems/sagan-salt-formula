
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

rvm:
  cmd:
    - run
    - user: {{ pillar['user'] }}
    - name: curl -s -L get.rvm.io | bash -s stable --quiet-curl
    - unless: test -s "$HOME/.rvm/scripts/rvm"
    - require:
      - cmd: rvm_gpg

rvm_profile:
  cmd:
    - run
    - user: {{ pillar['user'] }}
    - name: echo "[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm" >> $HOME/.profile
    - unless: grep ".rvm/scripts/rvm" ~/.profile
    - require:
      - cmd: rvm
