MAKEABLES=recipe.rng poe-groff.pdf poe-tex.pdf
AUXFILES=poe-tex.log

.PHONY: all implode clean
all: $(MAKEABLES) clean

# Conversion from the Relax NG compact syntax to the full XML syntax
# @requires: the debian `trang` package
%.rng: %.rnc
	trang $< $@

# The typesetting of a groff document
# @requires: The debian `groff-base` and `groff` packages
%-groff.pdf: %.groff
	groff -kT pdf -mom $< > $@

# The typesetting of a tex document
%-tex.pdf: %.tex
	pdftex -jobname $(basename $@) $<

clean:
	rm -f $(AUXFILES)

implode: clean
	rm -f $(MAKEABLES)
