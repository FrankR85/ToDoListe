export BUILDROOT=cobol-build

export PROJECTROOT=..

all:
	$(MAKE) -C $(BUILDROOT) $@

build:
	$(MAKE) -C $(BUILDROOT) $@

clean:
	$(MAKE) -C $(BUILDROOT) $@

test:
	$(MAKE) -C $(BUILDROOT) $@
