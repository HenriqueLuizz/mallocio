# Makefile for the GNU C++ compiler

PROJECT_NAME=mallocio
VERSION=1.2.0
PROGRAM=mallocio
ARC=x86_64
OS=windows
TYPE=cpp
PATH_SOURCE=./src/
PATH_BUILD=./build/
PATH_INSTALL=./install/

# Compile
.PHONY: windows
windows:
	@ echo 'Building binary using G++ linker: OS $@'
	cp $(PATH_SOURCE)$(PROGRAM).$(TYPE) $(PATH_SOURCE)$(PROGRAM)-windows-$(ARC).$(TYPE)
	sed -i 's/xVs/$(VERSION)/g' $(PATH_SOURCE)$(PROGRAM)-windows-$(ARC).$(TYPE)
	sed -i 's/xArc/$(ARC)/g' $(PATH_SOURCE)$(PROGRAM)-windows-$(ARC).$(TYPE)
	mkdir -p $(PATH_BUILD)
	x86_64-w64-mingw32-g++ -pedantic -std=c++11 -o $(PATH_BUILD)$(PROGRAM)-windows-$(VERSION)-$(ARC).exe $(PATH_SOURCE)$(PROGRAM)-windows-$(ARC).$(TYPE) -static-libgcc -static-libstdc++ -Wl,-Bstatic -lstdc++ -lpthread -Wl,-Bdynamic
	zip $(PATH_BUILD)$(PROGRAM)-windows-$(VERSION)-$(ARC).zip $(PATH_BUILD)$(PROGRAM)-windows-$(VERSION)-$(ARC).exe $(PATH_BUILD)teste.txt
	rm -f $(PATH_SOURCE)$(PROGRAM)-windows-$(ARC).$(TYPE)

.PHONY: linux
linux:
	@ echo 'Building binary using G++ linker: OS $@'
	cp $(PATH_SOURCE)$(PROGRAM).$(TYPE) $(PATH_SOURCE)$(PROGRAM)-linux-$(ARC).$(TYPE)
	sed -i 's/xVs/$(VERSION)/g' $(PATH_SOURCE)$(PROGRAM)-linux-$(ARC).$(TYPE)
	sed -i 's/xArc/$(ARC)/g' $(PATH_SOURCE)$(PROGRAM)-linux-$(ARC).$(TYPE)
	mkdir -p $(PATH_BUILD)
	g++ -pedantic -std=c++11 -o $(PATH_BUILD)$(PROGRAM)-linux-$(VERSION)-$(ARC) $(PATH_SOURCE)$(PROGRAM)-linux-$(ARC).$(TYPE)
	tar -zcvf $(PATH_BUILD)$(PROGRAM)-linux-$(VERSION)-$(ARC).tar.gz $(PATH_BUILD)$(PROGRAM)-linux-$(VERSION)-$(ARC) $(PATH_BUILD)teste.txt
	rm -f $(PATH_SOURCE)$(PROGRAM)-linux-$(ARC).$(TYPE)

.PHONY: both
both: windows linux


.PHONY: deploy
deploy:
	@ echo 'Deploying binary to ARTE'
	./deploy.sh