# Variables
GO = go
PROJECT_DIR = $(shell pwd)
BIN_PROJET_DIR = $(PROJECT_DIR)/bin/server
GQLGEN = github.com/99designs/gqlgen

# Enviroment
PORT = 8080

# Commands

build:
	@echo "==> (1/2) Building Server...."
	@$(GO) build - $(BIN_PROJET_DIR) $(PROJECTBIN_PROJET_DIR_DIR).go
	@echo "==> (2/2) Server built into:" $(BIN_PROJET_DIR)

run: build 
	@echo "==> (1/1) Running Server...."
	@PORT=$(PORT) $(BIN_PROJET_DIR)

generate:
	@echo "==> (1/2) Generating GraphQL Schema...."
	@$(GO) run $(GQLGEN) generate
	@echo "==> (2/2) Schema Generated Success...."

clean:
	@echo "==> (1/2) Cleaning Bin Project...."
	@rm -rf $(BIN_PROJET_DIR)
	@echo "==> (2/2) $(BIN_PROJET_DIR) Cleaned up"


.DEFAULT_GOAL := run