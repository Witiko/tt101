TEX=xelatex -shell-escape --
OUTPUT=main
SOURCES=$(OUTPUT).tex $(OUTPUT).bib $(OUTPUT).sty examples/*
AUXDIRS=_minted-main
AUXFILES=$(OUTPUT).aux $(OUTPUT).toc $(OUTPUT).bbl $(OUTPUT).blg \
	$(OUTPUT).ind $(OUTPUT).idx $(OUTPUT).out $(OUTPUT).gl[gos] \
	$(OUTPUT).xdy $(OUTPUT).lo[ftg] $(OUTPUT).ac[rn] $(OUTPUT).alg \
	$(OUTPUT).run.xml $(OUTPUT).bcf $(OUTPUT)-blx.bib $(OUTPUT).mw \
	$(OUTPUT).cb $(OUTPUT).cb2 $(OUTPUT).ilg texput.log
SUBMAKEFILES=examples/*/

.PHONY: all clean implode $(SUBMAKEFILES)
all: $(SUBMAKEFILES) $(OUTPUT).pdf clean

$(SUBMAKEFILES):
	make -C $@

$(OUTPUT).pdf: $(SOURCES) Makefile
	$(TEX) $<
	$(TEX) $<

clean:
	rm -f $(AUXFILES)
	rm -rf $(AUXDIRS)

implode: clean
	rm -rf $(OUTPUT).pdf
