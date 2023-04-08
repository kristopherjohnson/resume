PANDOC=pandoc

# 'make all' will regenerate all the outputs from the source file src/kjresume.md
all: formats/kjresume.html formats/kjresume.docx formats/kjresume.pdf formats/kjresume.rtf formats/kjresume.txt formats/kjresume.tex
.PHONY: all

formats/kjresume.html: src/kjresume.md
	$(PANDOC) -t html -s --output $@ $< --metadata title='Kristopher Johnson'

formats/kjresume.docx: src/kjresume.md
	$(PANDOC) -t docx -s --output $@ $<

formats/kjresume.pdf: src/kjresume.md
	$(PANDOC) -t pdf --output $@ $<

formats/kjresume.rtf: src/kjresume.md
	$(PANDOC) -t rtf --output $@ $<

formats/kjresume.txt: src/kjresume.md
	$(PANDOC) -t plain --output $@ $<

formats/kjresume.tex: src/kjresume.md
	$(PANDOC) -t latex --output $@ $<

# Delete all generated files
clean:
	- $(RM) formats/kjresume.*
.PHONY: clean
