# 1: command 2: path 3: repository 4: branch
define git_subtree
	git subtree $(1) --prefix $(2) $(3) $(4) --squash
endef
