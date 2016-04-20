assets=asset_*

SR-shirt.zip: ${assets} layout.png
	-rm -f $@
	zip $@ $^

%.png: %.svg
	inkscape $< --export-png=$@

layout.png: layout_front.png layout_back.png
	convert $^ +append $@

.PHONY: clean
clean:
	-rm -f SR-shirt.zip *.png
