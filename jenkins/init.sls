/etc/yum.repos.d:
  file.recurse:
    - source: salt://jenkins/yum.repos.d

base_pkgs:
  pkg.installed:
    - pkgs:
      - java-1.7.0-openjdk
      - jenkins
      - require:
        - file: /etc/yum.repos.d
