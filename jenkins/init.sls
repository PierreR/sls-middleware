jenkins.repo:
  file.managed:
    - name: /etc/yum.repos.d/jenkins.repo
    - source: salt://jenkins/jenkins.repo
  file.managed:
    - name: /etc/yum.repos.d/jenkins.org.key
    - source: salt://jenkins/jenkins-ci.org.key

base_pkgs:
  pkg.installed:
    - pkgs:
      - java-1.7.0-openjdk
      - jenkins
      - require:
        file: jenkins.repo