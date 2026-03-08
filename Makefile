PROTO_DIR = proto
DEST_DIR = gen/go

PROTO_FILES = $(shell find $(PROTO_DIR) -name "*.proto")

.PHONY: proto
proto:
	@echo "Генерация кода для сервиса [$(SERVICE_NAME)] версия [$(API_VERSION)]..."
	@mkdir -p $(DEST_DIR)
	protoc -I $(PROTO_DIR) \
		$(PROTO_FILES) \
		--go_out=$(DEST_DIR) --go_opt=paths=source_relative \
		--go-grpc_out=$(DEST_DIR) --go-grpc_opt=paths=source_relative
	@echo "Успешно! Файлы в: $(DEST_DIR)"

.PHONY: clean
clean:
	rm -rf gen/go/$(SERVICE_NAME)
