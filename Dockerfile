FROM FROM julia:1.1

WORKDIR /projects

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
	ca-certificates \
        autoconf \
        build-essential \
        git \
        mc \
        nano \
		curl \
	; \
	rm -rf /var/lib/apt/lists/*

RUN julia -e "using Pkg; pkg\"add PackageCompiler Plots GR\"; using PackageCompiler; compile_incremental(:Plots, :GR, force = true)"
