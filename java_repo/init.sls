
# Disabled pending https://github.com/saltstack/salt/issues/18302
#webupd8team/java:
#  pkgrepo.managed:
#    - ppa: webupd8team/java

# Workaround until above issue is resolved
java_repo:
  cmd:
    - run
    - name: add-apt-repository -y ppa:webupd8team/java

