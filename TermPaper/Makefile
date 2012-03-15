PAPER=kodiTermPaper

all: ${PAPER}.pdf

${PAPER}.pdf: ${PAPER}.ps ${PAPER}.bbl
	ps2pdf ${PAPER}.ps	

${PAPER}.ps: ${PAPER}.dvi
	dvips -Ppdf ${PAPER}

${PAPER}.dvi: ${PAPER}.bbl ${PAPER}.tex
	latex ${PAPER}

${PAPER}.bbl: ${PAPER}.bib ${PAPER}.aux
	bibtex ${PAPER}
	latex ${PAPER}
	latex ${PAPER}

${PAPER}.aux: ${PAPER}.tex
	latex ${PAPER}

open:
	acroread ${PAPER}.pdf

clean:
	rm *.aux *.dvi *.pdf *.log
