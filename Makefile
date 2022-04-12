IMAGE_NAME=beaker

.PHONY : run-checks
run-checks :
	isort --check .
	black --check .
	flake8 .
	mypy .

.PHONY : docker-image
docker-image :
	docker build -t $(IMAGE_NAME) .

.PHONY : test-run
test-run : docker-image
	docker run -e BEAKER_TOKEN=$$BEAKER_TOKEN --rm $(IMAGE_NAME) workspace 'list ai2 --text="petew"'
