# Register the NodeSource repository
#   - Can be used to install node via apt-get
node_repo:
  cmd:
    - run
    - name: curl -sL https://deb.nodesource.com/setup | sudo bash -

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
    cmd:
      - run
      - name: npm install -g npm-run
      - env:
        - PATH: /bin:/usr/bin:/usr/local/bin
      - require:
        - pkg: nodejs

npm_self_update:
  npm:
    - name: npm@{{ pillar['npm']['version'] }}
    - installed
    - require:
      - pkg: nodejs
