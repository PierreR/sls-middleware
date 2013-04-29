base_pkgs:
  pkg.installed:
    - pkgs:
      - java-1.7.0-openjdk

/etc/yum.repos.d:
  file.managed:
    - source: salt://jenkins/jenkins.repo