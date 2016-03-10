include buildconf.mk

all: syndicate

syndicate: rg

.PHONY: rg
rg:
	$(MAKE) -C rg

.PHONY: install
install:
	$(MAKE) -C rg install

.PHONY: uninstall
uninstall:
	$(MAKE) -C rg uninstall

.PHONY: clean
clean:
	$(MAKE) -C rg clean

