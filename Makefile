.PHONY: build agenda

build:
	docker build -t kyokley/gcalcli .

publish: build
	docker push kyokley/gcalcli

agenda:
	docker run --rm \
		-v ~/.gcalcli_oauth:/root/.gcalcli_oauth \
		kyokley/gcalcli agenda

shell:
	docker run --rm -it \
		-v ~/.gcalcli_oauth:/root/.gcalcli_oauth \
		--entrypoint /bin/sh \
		kyokley/gcalcli
