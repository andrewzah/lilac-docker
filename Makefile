IGNORED_DIRS  := http_proxy
PROXY_SERVICE := http_proxy

update: dependencies up

up:
	IGNORED_DIRS="${IGNORED_DIRS}" ./compose.sh up -d --remove-orphans
	@echo "Started services except '${IGNORED_DIRS}'"
	@echo "Start '${PROXY_SERVICE}' manually to avoid LetsEncrypt rate limiting by accident"

dependencies:
	./compose.sh pull

httpl:
	./compose.sh logs -f "${PROXY_SERVICE}"

httpr:
	./compose.sh stop "${PROXY_SERVICE}" && ./compose.sh up "${PROXY_SERVICE}"

httprd:
	./compose.sh stop "${PROXY_SERVICE}" && ./compose.sh up -d "${PROXY_SERVICE}"

