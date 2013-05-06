install:
  file.recurse:
    - name: /etc/yum.repos.d
    - source: salt://jenkins/yum.repos.d
  cmd.run:
    - name: rpm --import /etc/yum.repos.d/jenkins-ci.org.key
    - require:
      - file: install
  pkg.installed:
    - pkgs:
      - java-1.7.0-openjdk
      - jenkins
      - fontconfig
      - libXfont
      - libfontenc
      - ttmkfdir
      - xorg-x11-font-utils
    - require:
      - file: install
      - cmd: install
