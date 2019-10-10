

index.html:

.PHONY: clean

clean:
	-rm -f style.css index.html

.SECONDARY: style.css

%.html: %.rst style.css
	rst2html5.py --stylesheet=style.css $< > $@

%.css: %.scss
	node-sass $< > $@

watch:
	bash -c 'inotifywait -m -e modify index.rst style.scss | xargs -n1 -I{} make index.html'
