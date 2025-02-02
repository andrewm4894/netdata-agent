.PHONY: requirements
.PHONY: requirements-install
.PHONY: pre-commit
.PHONY: app
.PHONY: cli
.PHONY: bump-version-patch bump-version-minor bump-version-major
.PHONY: build
.PHONY: publish

requirements:
	@pip-compile requirements.compile -o requirements.txt

requirements-install:
	@pip install -r requirements.txt

pre-commit:
	@pre-commit install
	@pre-commit install --hook-type commit-msg
	@pre-commit install --hook-type pre-push
	@pre-commit run --all-files
	@pre-commit autoupdate

app:
	@streamlit run netdata_llm_agent/app.py

cli:
	@python netdata_llm_agent/cli.py

bump-version-patch:
	@bump2version patch

bump-version-minor:
	@bump2version minor

bump-version-major:
	@bump2version major

build:
	@python -m build

publish:
	@twine upload dist/*
