FILE = thesis-main

# make pdf, run twice for cross refs, suppress output of second run, 
# first in draftmode for speed
pdf: 
	pdflatex ${FILE}
	pdflatex ${FILE} 1>/dev/null

# make with references, don't stop if bibtex returns errors, suppress 
# output of second and third pdflatex, first two in draftmode for speed
ref:
	pdflatex -draftmode ${FILE}
	bibtex ${FILE} || true
	pdflatex -draftmode ${FILE} 1>/dev/null
	pdflatex ${FILE} 1>/dev/null

# clean temporary files
clean:
	find . -type f -regex '.*\.\(aux\|blg\|log\|out\|toc\)' -delete
