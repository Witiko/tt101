MAKEABLES=cornford12.pdf CIExy1931.pdf
AUXFILES=cornford12.log cornford12.aux

.PHONY: all explode implode clean
all: explode clean
explode: $(MAKEABLES)

# Typeset a TeX document.
cornford12.pdf: cornford12.tex
	xelatex -jobname $(basename $@) $<

# Download a CIE chromacity diagram.
# @requires: The debian `curl` package.
CIExy1931.svg:
	curl 'https://upload.wikimedia.org/wikipedia/commons/1/1e/CIE1931xy_gamut_comparison.svg' >$@

# Convert the CIE chromacity diagram to PDF.
# @requires: The debian `inkscape` package.
CIExy1931.pdf: CIExy1931.svg
	inkscape --export-pdf=$@ $<

# Remove auxiliary files and directories.
clean:
	rm -f $(AUXFILES)

# Remove all non-source files.
implode: clean
	rm -f $(MAKEABLES)
