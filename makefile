install:
	@meta git update

remotes:
	@meta git remote rename origin github

update:
	@meta --parallel git remote update --prune
	@meta git merge --ff-only "@{u}"

.PHONY: install remotes update

