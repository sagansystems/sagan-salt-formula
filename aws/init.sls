
aws_cli:
  cmd:
    - run
    - name: |
        wget -q https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
        unzip awscli-bundle.zip > /dev/null
        ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
        rm -rf awscli-bundle*
    - creates: /usr/local/bin/aws
