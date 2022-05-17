## download-plugins: Downloads kafka connect plugins
download-plugins:
	@echo Downloading kafka connect plugins...
	@scripts/download-plugins.sh

## create-connectors: Creates kafka connectors
create-connectors:
	@echo Creating connectors...
	@scripts/create-connectors.sh

help: Makefile
	@echo
	@echo " Choose a command run:"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo
