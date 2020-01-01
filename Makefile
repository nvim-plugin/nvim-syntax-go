# ----------------------------------------------------------------------------
# global

.DEFAULT_GOAL = manifest
APP = nvim-syntax-go
CMD = $(PKG)/cmd/$(APP)

# ----------------------------------------------------------------------------
# target

.PHONY: all
all: mod pkg/install manifest

##@ manifest

.PHONY: manifest
manifest: static  ## Writes the plugin manifest.
	$(call target)
	@$(CURDIR)/bin/${APP} -manifest ${APP} -location $(CURDIR)/plugin/${APP}.vim

.PHONY: manifest/dump
manifest/dump: static  ## Dumps plugin manifest.
	$(call target)
	@$(CURDIR)/bin/${APP} -manifest ${APP}

# ----------------------------------------------------------------------------
# include

include hack/make/go.mk

# ----------------------------------------------------------------------------
# overlays
