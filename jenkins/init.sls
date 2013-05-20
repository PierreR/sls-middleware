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
  service:
    - name: jenkins
    - running

{% for name in salt['pillar.get']('jenkins:extensions') %}
wget --no-check-certificate http://updates.jenkins-ci.org/latest/{{name}}.hpi:
  cmd.run:
    - require:
      - service: install
{% endfor %}

