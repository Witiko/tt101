TEX=lualatex -shell-escape --
OUTPUT=main
SOURCES=$(OUTPUT).tex $(OUTPUT).bib $(OUTPUT).sty acronyms.tex \
	examples/*/*
AUXFILES=$(OUTPUT).aux $(OUTPUT).toc $(OUTPUT).bbl $(OUTPUT).blg \
	$(OUTPUT).ind $(OUTPUT).idx $(OUTPUT).out $(OUTPUT).gl[gos] \
	$(OUTPUT).xdy $(OUTPUT).lo[ftg] $(OUTPUT).ac[rn] $(OUTPUT).alg \
	$(OUTPUT).run.xml $(OUTPUT).bcf $(OUTPUT)-blx.bib $(OUTPUT).mw \
	$(OUTPUT).cb $(OUTPUT).cb2 $(OUTPUT).ilg texput.log proselint.result
SUBMAKEFILES=examples/*/

.PHONY: all clean explode implode publish test tex $(SUBMAKEFILES)
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
$(OUTPUT).pdf: $(SOURCES) Makefile
	make tex
	biber $(OUTPUT)
	make tex
	makeindex $(OUTPUT)
	make tex

# Performs a fast incremental typesetting of the document.
tex:
	$(TEX) $(OUTPUT)

# Remove auxiliary files and directories.
clean:
	rm -f $(AUXFILES)

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
