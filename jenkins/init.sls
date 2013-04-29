jenkins.repo:
  file.managed:
    - source: salt://jenkins/jenkins.repo
    - target: /etc/yum.repos.d/jenkins.repo

base_pkgs:
  pkg.installed:
    - pkgs:
      - java-1.7.0-openjdk
      - jenkins
      - require:
        - file: jenkins.repo

