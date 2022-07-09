include mk/build.mk


PROJECT = base
LIB_BASE := lib$(PROJECT).$(LIB_EXT)


.PHONY: all clean
all:
	@$(MAKE) $(LIB_DIR)/$(LIB_BASE)
clean:
	-rm -rf $(BIN_DIR) *.o $(LIB_DIR) *.$(LIB_EXT)
install:
	sudo cp -r $(LOCAL_DIR)/$(INC_DIR) $(INSTALL_INC_DIR)
	sudo cp $(LOCAL_DIR)/$(LIB_DIR)/$(LIB_BASE) $(INSTALL_LIB_DIR)
uninstall:
	sudo rm -rf $(INSTALL_INC_DIR)/$(PROJECT)
	sudo rm -f $(INSTALL_LIB_DIR)$(LIB_BASE)

$(LIB_DIR)/$(LIB_BASE): $(LIB_DIR) $(BIN_DIR) $(INC_DIR)/*.h $(SRC_DIR)/*.c
	$(call make_lib,$(INCLUDES),$(SRC_DIR)/*.c,$(LIB_BASE),)

$(LIB_DIR):
	-mkdir $@

$(BIN_DIR):
	-mkdir $@
