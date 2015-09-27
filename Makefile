TEX=xelatex
OUTPUT=main
SOURCES=$(OUTPUT).tex
AUXFILES=$(OUTPUT).aux $(OUTPUT).toc $(OUTPUT).bbl $(OUTPUT).blg \
	$(OUTPUT).ind $(OUTPUT).idx $(OUTPUT).out $(OUTPUT).gl[gos] \
	$(OUTPUT).xdy $(OUTPUT).lo[ftg] $(OUTPUT).ac[rn] $(OUTPUT).alg \
	$(OUTPUT).run.xml $(OUTPUT).bcf $(OUTPUT)-blx.bib $(OUTPUT).mw \
	$(OUTPUT).cb $(OUTPUT).cb2 $(OUTPUT).ilg texput.log

.PHONY: all clean implode
all: $(OUTPUT).pdf clean

$(OUTPUT).pdf: $(SOURCES) Makefile
	$(TEX) $<
	$(TEX) $<

clean:
	rm -f $(AUXFILES)

implode: clean
	rm -f $(OUTPUT).pdf
