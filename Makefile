NAME=com.getdropbox.Dropbox
VERSION=2015.10.28
ARCH=amd64
DEBNAME=dropbox_$(VERSION)_$(ARCH).deb

all: repo json dropboxd dropbox
	rm -rf $(NAME)
	flatpak-builder --repo=repo $(NAME) $(NAME).json

dropbox: $(DEBNAME) data.tar.gz

$(DEBNAME):
	wget -c "https://linux.dropbox.com/packages/debian/$(DEBNAME)" -O $@.part
	mv $@.part $@

data.tar.gz: $(DEBNAME)
	ar x $<

dropboxd: dropboxd.tar.gz
dropboxd.tar.gz:
	wget -c "https://www.dropbox.com/download?plat=lnx.x86_64" -O $@.part
	mv $@.part $@

json: $(NAME).json
$(NAME).json: $(NAME).json.in
	cat $< | sed s/'@NAME@'/"$(NAME)"/ > $@

repo:
	ostree init --mode=archive-z2 --repo=repo
