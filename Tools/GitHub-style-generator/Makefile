SASS = node_modules/.bin/sass

target = dist/GitHub2.css

all:

generate: $(target)

$(target): index.sass package-lock.json
	mkdir -p dist
	$(SASS) --load-path=node_modules $< | sed s/.markdown-body/body/ > $@

clean:
	$(RM) $(target)

.PHONY: all generate clean
