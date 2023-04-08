PANDOC=pandoc

all: formats/kjresume.html formats/kjresume.docx formats/kjresume.pdf formats/kjresume.rtf formats/kjresume.txt
.PHONY: all

formats/kjresume.html: src/kjresume.md
	[ -d formats ] || mkdir formats
	$(PANDOC) -t html -s --output $@ $< --metadata title='Kristopher Johnson'

formats/kjresume.docx: src/kjresume.md
	[ -d formats ] || mkdir formats
	$(PANDOC) -t docx -s --output $@ $<

formats/kjresume.pdf: src/kjresume.md formats
	[ -d formats ] || mkdir formats
	$(PANDOC) -t pdf --output $@ $<

formats/kjresume.rtf: src/kjresume.md formats
	[ -d formats ] || mkdir formats
	$(PANDOC) -t rtf --output $@ $<

formats/kjresume.txt: src/kjresume.md formats
	[ -d formats ] || mkdir formats
	$(PANDOC) -t plain --output $@ $<

clean:
	- $(RM) formats/kjresume.*
.PHONY: clean
