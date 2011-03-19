SUBDIRS = src doc completion packaging

EXTRA_DIST = ChangeLog.20060126

FTPHOST = catmur.co.uk

checkin:
	test Makefile -nt configure.ac
	svn ci -m "Release $(PACKAGE_VERSION) \"$(PACKAGE_TAG)\""
	svn up
	svn2cl
	cp ChangeLog www/

upload: checkin dist-bzip2
	ssh $(FTPHOST) test -e udept/udept-$(VERSION).tar.bz2 || scp udept-$(VERSION).tar.bz2 $(FTPHOST):udept/

ebuild: upload
	$(MAKE) -C packaging ebuild

