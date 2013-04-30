jenkins.repo:
  file:
    - managed:
      - name: /etc/yum.repos.d/jenkins-ci.repo
      - source: salt://jenkins/jenkins-c.repo
  file:
    - managed:
        - name: /etc/yum.repos.d/jenkins-ci.org.key
        - source: salt://jenkins/jenkins-ci.org.key

base_pkgs:
  pkg.installed:
    - pkgs:
      - java-1.7.0-openjdk
      - jenkins
      - require:
        file: jenkins.repo