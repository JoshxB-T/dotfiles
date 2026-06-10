mod: install.sh
	chmod +x $<

install: install.sh
	./$<
