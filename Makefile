include config.mk

LIB=libcommon.a
INC=include
INCLUDE_PATH=-Iinclude/
COMMON_OBJ = $(patsubst %.cc, %.o, $(wildcard src/*.cc))

.PHONY: install clean

$(LIB): $(COMMON_OBJ) $(COMMON_HEADER)
	$(AR) -rs $@ $(COMMON_OBJ)

%.o: %.cc
	$(CXX) $(CXXFLAGS) $(INCLUDE_PATH) -c $< -o $@

clean:
	rm -rf $(LIB)
	rm -rf $(COMMON_OBJ)

install: $(LIB) $(INC)
	@mkdir -p $(PREFIX)
	@mkdir -p $(PREFIX)/lib
	@cp $(LIB) $(PREFIX)/lib
	@mkdir -p $(PREFIX)/include
	@cp  $(INC)/* $(PREFIX)/include
	@echo 'Install succeed, target directory is "'$(PREFIX)'".'
