adoc = $(shell find . -type f -iname "*.adoc")
html = $(patsubst %.adoc,%.html,$(adoc))
services = \
	   openstack/keystone.html \
	   openstack/placement.html \
	   openstack/glance.html \
	   openstack/neutron.html \
	   openstack/nova.html \
	   openstack/ceph-radosgw.html


.PHONY: all
all: index.html $(services)

index.html: $(wildcard *.adoc)

mysql.html: mysql.adoc $(wildcard mysql/*.adoc)
openstack.html: openstack.adoc $(wildcard openstack/*.adoc)

%.html: %.adoc asciidoc.conf
	asciidoc -a pygments -o $@ $<

.PHONY: play
play: sqlusers
	ansible-playbook $<
