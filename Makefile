all: help

build-nyrst: # Build data for nyrst
	brrr freezer generate_web_data

build-nyrst-whale: ## Build data for nyrst with Docker
	docker run --rm -it -v ${CURDIR}:/workspace -w /workspace brrr freezer generate
		
help: ## Print this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: all build-nyrst help