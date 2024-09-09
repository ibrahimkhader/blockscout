version: 0.0
os: linux
files:
  - source: /
    destination: /var/app
file_exists_behavior: OVERWRITE
permissions:
  - object: /var/app
    pattern: "**"
    owner: ubuntu
    group: ubuntu

hooks:
  ApplicationStop:
      - location: scripts/stop.sh
        timeout: 300
        runas: root

  AfterInstall:
      - location: scripts/pre_start.sh
        timeout: 1000
        runas: root

  ApplicationStart:
      - location: scripts/start.sh
        timeout: 600
        runas: root
