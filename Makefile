BUILD=build
MAIN_NAME=debian-gnome-sneltoetsen
LATEX_IMAGE=leplusorg/latex:sha-4a17317

view: generate_pdf
	evince $(BUILD)/$(MAIN_NAME).pdf

clean:
	rm -rf $(BUILD)
	
prepare:
	mkdir -p $(BUILD)

generate_pdf: prepare
	docker run --rm -t --workdir=/tmp --user="$(shell id -u):$(shell id -g)" --net=none -e TEXINPUTS=src: -v "$(shell pwd):/tmp" $(LATEX_IMAGE) pdflatex -output-directory $(BUILD) $(MAIN_NAME).tex


