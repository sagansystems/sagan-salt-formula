
# Disabled pending https://github.com/saltstack/salt/issues/18302
#webupd8team/java:
#  pkgrepo.managed:
#    - ppa: webupd8team/java

# Workaround until above issue is resolved
java_repo:
  cmd:
    - run
    - name: add-apt-repository -y ppa:webupd8team/java

java_license:
  cmd:
    - run
    - name: echo oracle-java{{ pillar['java']['version'] }}-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

java_pkg:
  pkg.latest:
    - name: oracle-java{{ pillar['java']['version'] }}-installer
    - refresh: True
    - requires:
      - cmd: java_license
      - cmd: java_repo

oracle-java-set-default:
  pkg.latest:
    - name: oracle-java{{ pillar['java']['version'] }}-set-default
    - requires:
      - pkg: java_pkg
