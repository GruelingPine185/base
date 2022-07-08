include mk/build.mk

PROJECT = base

LIB_BASE := lib$(PROJECT).$(LIB_EXT)

INCLUDES += -I$(INC_DIR)

.PHONY: all clean
all:
	@$(MAKE) $(LIB_DIR)/$(LIB_BASE)
clean:
	-rm -rf $(BIN_DIR) *.o $(LIB_DIR) *.$(LIB_EXT)

$(LIB_DIR)/$(LIB_BASE): $(LIB_DIR) $(BIN_DIR) $(INC_DIR)/*.h $(SRC_DIR)/*.c
	$(call make_lib,$(INCLUDES),$(SRC_DIR)/*.c,$(LIB_BASE))

$(LIB_DIR):
	-mkdir $@

$(BIN_DIR):
	-mkdir $@
