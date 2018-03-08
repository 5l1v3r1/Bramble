CC=g++ 
CFLAGS= -g -c -Wall -Wextra -ansi -std=c++11 -Wno-unused-parameter -Wno-unused-function
LDFLAGS= -g
SOURCES=src/main.cpp src/tools.cpp src/crypt.cpp
OBJECTS=$(SOURCES:.cpp=.o)
#Crée les dépendances avec les .h si un .h modifié on refait le make
DEPS=$(SOURCES:.cpp=.d)
EXECUTABLE=bramble
# if you add your own script add DIR.. and add it to $(EXEc) and clean instruction
DIR=steganography
DIR2=vacuum
DIR3=tools
DIR4=cryptography
DIR5=option
DIR6=wifiJammer
EXEC=($DIR)/stenography

all: $(SOURCES) $(EXECUTABLE) $(EXEC)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

$(EXEC) :
	@(cd $(DIR) && $(MAKE))
	@(cd $(DIR2) && $(MAKE))
	@(cd $(DIR3) && $(MAKE))
	@(cd $(DIR4) && $(MAKE))
	@(cd $(DIR5) && $(MAKE))
	@(cd $(DIR6) && $(MAKE))

%.o: %.cpp
	$(CC) $(CFLAGS) $< -o $@

#Crée les dépendances avec les .h si un .h modifié on refait le make
%.d: %.cpp
	$(CC) -MM -MD $(CFLAGS) $< -o $@

clean:
	rm -f bramble src/*.o src/*.d src/*~ *~ result/scanNetwork/*
	@(cd $(DIR) && $(MAKE) $@)
	@(cd $(DIR2) && $(MAKE) $@)
	@(cd $(DIR3) && $(MAKE) $@)
	@(cd $(DIR4) && $(MAKE) $@)
	@(cd $(DIR5) && $(MAKE) $@)
	@(cd $(DIR6) && $(MAKE) $@)
	
#Crée les dépendances avec les .h si un .h modifié on refait le make
-include $(DEPS)
