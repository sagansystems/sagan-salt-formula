# Register the NodeSource repository
#   - Can be used to install node via apt-get
node_repo:
  cmd:
    - run
    - name: curl -sL https://deb.nodesource.com/setup | sudo bash -
    - unless: test -e /etc/apt/sources.list.d/nodesource.list

nodejs:
  pkg.installed:
    - require:
      - cmd: node_repo

default_npm_path:
  file.append:
    - name: /etc/profile.d/path.sh
    - text:
        - PATH=$PATH:/usr/local/bin:./node_modules/.bin

npm_run_pkg:
    npm.installed:
      - name: npm-run
      - require:
        - pkg: nodejs

npm_self_update:
  npm.installed:
    - name: npm@{{ pillar['npm']['version'] }}
    - require:
      - pkg: nodejs

npm_remove_lock:
  file.absent:
    - name: /home/{{ pillar['user'] }}/.npm/_locks
    - onchanges:
      - npm: npm_self_update
      - npm: npm_run_pkg
