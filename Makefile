OUTPUT=main
SOURCES=$(OUTPUT).tex $(OUTPUT).bib $(OUTPUT).sty acronyms.tex \
	examples/*/* chapters/*.tex
AUXFILES=$(OUTPUT).bbl $(OUTPUT).run.xml chapters/*.aux cc-by.pdf cc-by.svg
AUXDIRS=_minted-$(OUTPUT)
SUBMAKEFILES=examples/*/

.PHONY: all clean explode implode publish test tex $(SUBMAKEFILES)

# Perform the entire typesetting routine and clean up afterwards.
all: clean explode
	make clean

# Typeset the document and publish it online
publish: test all
	scp $(OUTPUT).pdf xnovot32@aisa.fi.muni.cz:public_html/tt101.pdf

# Perform the entire typesetting routine.
explode: $(SUBMAKEFILES)
	make $(OUTPUT).pdf

# Prepare the resources in subdirectories.
$(SUBMAKEFILES):
	make -C $@

# Typeset the text.
$(OUTPUT).pdf: $(SOURCES) cc-by.pdf Makefile
	latexmk -pdf $<

# Download a CC-BY icon.
# @requires: The debian `curl` package.
cc-by.svg:
	curl 'https://upload.wikimedia.org/wikipedia/commons/3/3c/Cc-by_new.svg' >$@

# Convert the CC-BY icon to PDF.
# @requires: The debian `inkscape` package.
cc-by.pdf: cc-by.svg
	inkscape --export-pdf=$@ $<

# Remove auxiliary files and directories.
clean:
	rm -f $(AUXFILES)
	rm -rf $(AUXDIRS)
	latexmk -c

# Run `proselint` on the source.
test:
	@for i in $(OUTPUT).tex chapters/*.tex; do \
	  proselint "$$i" | grep -Ev "`cat .proselintignore`" > proselint.result; \
		echo ">> $$i"; \
		cat proselint.result; \
		[ -s proselint.result ] && exit 1; \
	done || true
	@rm proselint.result

# Remove all non-source files.
implode: clean
	rm -rf $(OUTPUT).pdf
