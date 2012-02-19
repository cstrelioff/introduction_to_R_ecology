##
## makefile for Lecture03
##
filename = Lecture03
LATEX = pdflatex

all: $(filename).pdf $(filename).R

$(filename).pdf : $(filename).tex 
	$(LATEX) $(filename).tex
	$(LATEX) $(filename).tex

$(filename).tex : $(filename).Rnw
	R CMD Sweave $(filename).Rnw 

$(filename).R : $(filename).Rnw
	R CMD Stangle $(filename).Rnw 

clean: 
	rm -rf *.eps *.pdf *.tex *.log *.aux *.out *.nav *.toc *.snm *.vrb 
	rm $(filename).R


