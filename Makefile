assets=$(wildcard asset_*.svg)
asset_pdfs=$(patsubst %.svg,%.pdf,$(assets))

SR-shirt.zip: ${assets} ${asset_pdfs} layout.png README
	-rm -f $@
	zip $@ $^

%.png: %.svg
	inkscape $< --export-png=$@

%.pdf: %.svg
	inkscape $< --export-pdf=$@

layout.png: layout_front.png layout_back.png
	convert $^ +append $@

.PHONY: clean
clean:
	-rm -f SR-shirt.zip *.png *.pdf
