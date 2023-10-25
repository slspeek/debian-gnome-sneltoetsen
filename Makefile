MAIN_NAME=debian-gnome-sneltoetsen
LATEX_IMAGE=leplusorg/latex

view: generate_pdf
	evince build/$(MAIN_NAME).pdf

prepare:
	mkdir -p build

generate_pdf: prepare
	docker run -i --rm -t --workdir=/tmp --user="$(shell id -u):$(shell id -g)" --net=none -e TEXINPUTS=src: -v "$(shell pwd):/tmp" $(LATEX_IMAGE) pdflatex -output-directory build $(MAIN_NAME).tex


