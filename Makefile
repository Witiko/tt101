TEX=xelatex -shell-escape --
OUTPUT=main
SOURCES=$(OUTPUT).tex $(OUTPUT).bib $(OUTPUT).sty acronyms.tex \
	examples/*/*
AUXDIRS=_minted-main
AUXFILES=$(OUTPUT).aux $(OUTPUT).toc $(OUTPUT).bbl $(OUTPUT).blg \
	$(OUTPUT).ind $(OUTPUT).idx $(OUTPUT).out $(OUTPUT).gl[gos] \
	$(OUTPUT).xdy $(OUTPUT).lo[ftg] $(OUTPUT).ac[rn] $(OUTPUT).alg \
	$(OUTPUT).run.xml $(OUTPUT).bcf $(OUTPUT)-blx.bib $(OUTPUT).mw \
	$(OUTPUT).cb $(OUTPUT).cb2 $(OUTPUT).ilg texput.log
SUBMAKEFILES=examples/*/

.PHONY: all clean explode implode $(SUBMAKEFILES)
all: clean explode
	make clean

# Perform the entire typesetting routine.
explode: $(SUBMAKEFILES)
	make $(OUTPUT).pdf

# Prepare the resources in subdirectories.
$(SUBMAKEFILES):
	make -C $@

# Typeset the text.
$(OUTPUT).pdf: $(SOURCES) Makefile
	$(TEX) $<
	biber $(OUTPUT)
	$(TEX) $<
	makeindex $(OUTPUT)
	$(TEX) $<

# Remove auxiliary files and directories.
clean:
	rm -f $(AUXFILES)
	rm -rf $(AUXDIRS)

# Remove all non-source files.
implode: clean
	rm -rf $(OUTPUT).pdf
