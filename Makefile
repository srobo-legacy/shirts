assets=asset_*

SR-shirt.zip: ${assets}
	-rm -f $@
	zip $@ $^

.PHONY: clean
clean:
	-rm -f SR-shirt.zip
