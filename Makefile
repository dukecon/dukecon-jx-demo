.PHONY:

all: README.html

%.html: %.adoc
	asciidoctor $<
