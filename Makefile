.PHONY: all

# Build macism (macOS only)
all:
	@case "$$(uname -s)" in \
		Darwin) \
			mkdir -p mac-bin && \
			$(MAKE) -C macism && \
			mv macism/macism mac-bin/ && \
			echo "macism: built -> mac-bin/macism" ;; \
		*) \
			echo "macism: skipping (not macOS)" ;; \
	esac
