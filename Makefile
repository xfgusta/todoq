install:
	@install -m 0755 todoq.sh $(DESTDIR)/usr/local/bin/todoq

uninstall:
	@rm -f $(DESTDIR)/usr/local/bin/todoq
