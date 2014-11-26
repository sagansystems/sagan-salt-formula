# Register the NodeSource repository
#   - Can be used to install node via apt-get
nodejs:
  cmd:
    - run
    - name: curl -sL https://deb.nodesource.com/setup | sudo bash -
