include ../buildconf.mk

LIB   	:= -lpthread -lsyndicate -lprotobuf
C_SRCS	:= $(wildcard *.c)
CXSRCS	:= $(wildcard *.cpp)
OBJDIR  := obj/
OBJ      := $(patsubst %.c,$(BUILD_RG)/$(OBJDIR)/%.o,$(C_SRCS)) \
            $(patsubst %.cpp,$(BUILD_RG)/$(OBJDIR)/%.o,$(CXSRCS))

RG_BUILD := $(BUILD_RG)/syndicate-rg $(BUILD_LIBEXEC_DIR)/rg-driver
RG_INSTALL := $(BINDIR)/syndicate-rg $(LIBEXECDIR)/rg-driver

all: $(RG_BUILD)

$(BUILD_RG)/syndicate-rg: $(OBJ)
	@mkdir -p "$(shell dirname "$@")"
	$(CPP) -o "$@" $(OBJ) $(LIB) $(LIBINC)

$(BUILD_LIBEXEC_DIR)/%: libexec/%
	@mkdir -p "$(shell dirname "$@")"
	cp -a "$<" "$@"

$(BUILD_RG)/$(OBJDIR)/%.o : %.c 
	@mkdir -p "$(shell dirname "$@")"
	$(CPP) -o "$@" $(INC) -c "$<" $(DEFS)

$(BUILD_RG)/$(OBJDIR)/%.o : %.cpp 
	@mkdir -p "$(shell dirname "$@")"
	$(CPP) -o "$@" $(INC) -c "$<" $(DEFS)

.PHONY: clean 
clean:
	rm -f $(OBJ)

.PHONY: install
install: $(RG_INSTALL)

$(BINDIR)/%: $(BUILD_RG)/%
	@mkdir -p "$(shell dirname "$@")"
	cp -a "$<" "$@"

$(LIBEXECDIR)/%: $(BUILD_LIBEXEC_DIR)/%
	@mkdir -p "$(shell dirname "$@")"
	cp -a "$<" "$@"

.PHONY: uninstall
uninstall:
	rm -f "$(RG_INSTALL)"

print-%: ; @echo $*=$($*)
