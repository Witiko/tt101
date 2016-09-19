MAKEABLES=cornford12.pdf
AUXFILES=cornford12.log cornford12.aux

.PHONY: all explode implode clean
all: explode clean
explode: $(MAKEABLES)

# Typeset a TeX document.
%.pdf: %.tex
	xelatex -jobname $(basename $@) $<

# Remove auxiliary files and directories.
clean:
	rm -f $(AUXFILES)

# Remove all non-source files.
implode: clean
	rm -f $(MAKEABLES)
