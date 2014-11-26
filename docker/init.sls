
docker:
  cmd:
    - run
    - name: curl -sSL https://get.docker.com/ubuntu/ | sudo sh
    - creates: /usr/bin/docker

docker_service:
  service:
    - name: docker
    - running
    - enable: True
    - requires:
        - cmd: docker

docker_group:
    group.present:
        - name: docker
        - require:
            - cmd: docker
        - members:
            - {{ pillar['user'] }}

fig:
    cmd:
        - run
        - name: |
            wget -q https://github.com/docker/fig/releases/download/{{ pillar['docker']['fig_version'] }}/fig-`uname -s`-`uname -m` -O /usr/local/bin/fig
            chmod +x /usr/local/bin/fig
        - unless: /usr/local/bin/fig --version | grep {{ pillar['docker']['fig_version'] }}
