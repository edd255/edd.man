MDS    := $(filter-out README.md, $(wildcard *.md))
EDDS   := $(MDS:.md=.edd)
MANDIR := ./manedd
MANEDDS := $(addprefix $(MANDIR)/,$(EDDS))

all: $(MANEDDS)

$(MANDIR):
	mkdir -p $@

$(MANDIR)/%.edd: %.pandoc | $(MANDIR)
	pandoc -f markdown-tex_math_dollars --standalone --to man $< -o $@

%.pandoc: %.md Makefile
	{ \
	  echo "% $*(edd)"; \
	  echo "% edd255"; \
	  echo "% `git log --pretty=format:%as $*.md | head -1`"; \
	  cat $<; \
	} > $@

clean:
	rm -rf $(MANDIR) *.pandoc
