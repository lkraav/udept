EXTRA_DIST = udept.ebuild.in

PORTAGE_OVERLAY_DIR = /srv/gentoo/trees/catmur.co.uk/app-portage/udept/
PORTAGE_DISTDIR = /usr/portage/distfiles

ebuild:
	su -c " \
cp udept.ebuild.in $(PORTAGE_OVERLAY_DIR)/udept-$(VERSION).ebuild; \
ebuild $(PORTAGE_OVERLAY_DIR)/udept-$(VERSION).ebuild fetch manifest; \
svn add $(PORTAGE_OVERLAY_DIR)/udept-$(VERSION).ebuild; \
svn add $(PORTAGE_OVERLAY_DIR)/files/digest-udept-$(VERSION); \
svn ci $(PORTAGE_OVERLAY_DIR) --message 'ebuild autobump from make ebuild'"

