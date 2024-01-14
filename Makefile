document:
	pdflatex main.tex

images:
	@echo "Building images..."
	@docker build -t mistat-bootstrap-analysis -f docker/Dockerfile .

jupyter:
	docker run  -it --rm \
	    -v $(PWD):/app  \
	    -p 8874:8874 mistat-bootstrap-analysis \
	    jupyter-lab --allow-root --port=8874 --ip 0.0.0.0 --no-browser

bash:
	docker run --rm -v $(PWD):/app -it --env-file .env mistat-bootstrap-analysis bash

ruff:
	docker run --rm -v $(PWD):/app -it --env-file .env mistat-bootstrap-analysis ruff .

isort:
	docker run --rm -v $(PWD):/app -it --env-file .env mistat-bootstrap-analysis isort .

mypy:
	docker run --rm -v $(PWD):/app -it --env-file .env --workdir /app mistat-bootstrap-analysis mypy src

pytest:
	docker run --rm -v $(PWD):/app -it --env-file .env mistat-bootstrap-analysis ptw --runner python run_pytest.py .
