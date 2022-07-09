include mk/build.mk


PROJECT = base
LIB_BASE := lib$(PROJECT).$(LIB_EXT)


.PHONY: all clean
all:
	@$(MAKE) $(LIB_BASE)
clean:
	-rm -rf $(BIN_DIR) *.o *.$(LIB_EXT)
install:
	cp -r $(INC_DIR) $(INSTALL_INC_DIR)
	cp $(LIB_BASE) $(INSTALL_LIB_DIR)
uninstall:
	rm -rf $(INSTALL_INC_DIR)/$(PROJECT)
	rm -f $(INSTALL_LIB_DIR)$(LIB_BASE)

$(LIB_BASE): $(BIN_DIR) $(INC_DIR)/*.h $(SRC_DIR)/*.c
	$(CC) $(CFLAGS) $(INCLUDES) -fPIC -c $(SRC_DIR)/*.c
	mv *.o $(BIN_DIR)
	$(CC) $(CFLAGS) -shared $(BIN_DIR)/*.o -o $(LIB_BASE)

$(LIB_DIR):
	-mkdir $@

$(BIN_DIR):
	-mkdir $@
