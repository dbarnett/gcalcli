.PHONY: build agenda

build:
	docker build -t kyokley/gcalcli .

publish: build
	docker push kyokley/gcalcli

agenda:
	docker run --rm \
		-v ~/.gcalcli_oauth:/root/.gcalcli_oauth \
		kyokley/gcalcli agenda
