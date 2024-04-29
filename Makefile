.PHONY: clean

EXTENSION_DIR:="$$HOME/Documents/Bitwig Studio/Extensions"
JAVA_SOURCES:=$(shell find . -name '*.java')

all: build install

build: target/keylab-plusplus.bwextension

target/keylab-plusplus.bwextension: $(JAVA_SOURCES)
	@mvn install

test:
	@mvn test

debug:
	BITWIG_DEBUG_PORT=5005 bitwig-studio

install: target/keylab-plusplus.bwextension
	@mkdir -p $(EXTENSION_DIR)
	install target/KeylabPlusPlus.bwextension $(EXTENSION_DIR)

clean:
	@mvn clean