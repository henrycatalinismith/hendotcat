bin:=$(shell yarn bin)
meta:=$(bin)/meta
comma:= ,
empty:=
space:= $(empty) $(empty)

$(meta):
	yarn

install: $(meta)
	@$(meta) git update

remotes: $(meta)
	@$(meta) git remote rename origin github

update: $(meta)
	@$(meta) --parallel git remote update --prune
	@$(meta) git merge --ff-only "@{u}"

yarn: $(meta)
	@$(meta) yarn install --include-only $(subst $(space),$(comma),$(shell \
		find . -maxdepth 2 -mindepth 2 -type f | \
		cut -c3- | \
		grep yarn.lock | \
		rev | \
		cut -c11- | \
		rev | \
		sort \
	))

.PHONY: install remotes update yarn

