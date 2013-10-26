BASE=bugs-in-square

all: $(BASE).ps $(BASE).xhtml

pdf: $(BASE).pdf

$(BASE).pdf: $(BASE).ps
	ps2pdf $<

$(BASE).dvi: $(BASE).tex
	latex $<

$(BASE).ps: $(BASE).dvi
	dvips -o $@ $<

$(BASE).xml: $(BASE).tex
	mk4ht mzlatex $<

$(BASE).xhtml: $(BASE).xml
	cp -f $< $@
