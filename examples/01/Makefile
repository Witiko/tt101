MAKEABLES=unihan-cjk.pdf unihan-chunom.pdf
AUXFILES=unihan-cjk.log unihan-cjk.aux unihan-chunom.log unihan-chunom.aux

.PHONY: all explode implode clean
all: explode clean
explode: $(MAKEABLES)

# Typeset a pdfLaTeX document
unihan-cjk.pdf: unihan-cjk.tex unihan-text.tex
	pdflatex $<

# Typeset a XeLaTeX document
unihan-chunom.pdf: unihan-chunom.tex unihan-text.tex
	xelatex $<

# Remove auxiliary files and directories.
clean:
	rm -f $(AUXFILES)

# Remove all non-source files.
implode: clean
	rm -f $(MAKEABLES)
