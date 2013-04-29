jenkins.repo:
  file.managed:
    - name: /etc/yum.repos.d/jenkins.repo
    - source: salt://jenkins/jenkins.repo

base_pkgs:
  pkg.installed:
    - pkgs:
      - java-1.7.0-openjdk
      - jenkins
      - require:
        - file: jenkins.repo