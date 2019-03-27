export BUILDROOT=cobol-build

export PROJECTROOT=..

DBDIR    := data
DATABASE := $(DBDIR)/todolist.txt

all:	test deploy

run-server: deploy
	uwsgi --ini uwsgi.conf

debug-server: deploy
	mv deploy/cgi-bin/todohandler deploy/cgi-bin/todohandler.orig
#	printf '#!/bin/sh\ncat >> /tmp/strace-cgi' > deploy/cgi-bin/todohandler
	printf '#!/bin/sh\nstrace -o /tmp/strace-cgi ./todohandler.orig' > deploy/cgi-bin/todohandler
	chmod +x deploy/cgi-bin/todohandler

	@echo
	@echo ">>>"
	@echo ">>> DEBUG MODE ENABLED"
	@echo ">>> run \`tail -F /tmp/strace-cgi' to see what is happening"
	@echo ">>>"
	@echo

	uwsgi --ini uwsgi.conf

deploy: build $(DATABASE)
	mkdir -p deploy/cgi-bin
	cp todoliste/target/TODOHANDLER deploy/cgi-bin/todohandler
	ln -fs ../../$(DATABASE) deploy/cgi-bin/todolist.txt

$(DATABASE):
	mkdir -p $(DBDIR)
	touch $(DATABASE)

clean-data:
	rm -rf $(DBDIR)

clean:
	$(MAKE) -C $(BUILDROOT) $@
	rm -rf deploy
	rm -f *~

build:  init-submodules
	$(MAKE) -C $(BUILDROOT) $@

test:	build
	$(MAKE) -C $(BUILDROOT) $@

autotest:	build
	$(MAKE) -C $(BUILDROOT) $@

init-submodules:
	git submodule init
	git submodule update
