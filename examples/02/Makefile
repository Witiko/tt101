MAKEABLES=recipe.rng poe-groff.pdf poe-tex.pdf
AUXFILES=poe-tex.log

.PHONY: all explode implode clean
all: explode clean
explode: $(MAKEABLES)

# Convert a document in the compact Relax NG syntax to the XML syntax.
# @requires: the debian `trang` package
%.rng: %.rnc
	trang $< $@

# Typeset a groff document.
# @requires: The debian `groff-base` and `groff` packages
%-groff.pdf: %.groff
	groff -kT pdf -mom $< > $@

# Typeset a TeX document.
%-tex.pdf: %.tex
	pdftex -jobname $(basename $@) $<

# Remove auxiliary files and directories.
clean:
	rm -f $(AUXFILES)

# Remove all non-source files.
implode: clean
	rm -f $(MAKEABLES)
