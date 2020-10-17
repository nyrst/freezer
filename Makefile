all: help

build-nyrst: # Build data for nyrst and copy to nyrst.tools folder
	brrr freezer generate_web_data

help: ## Print this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: all build-nyrst help