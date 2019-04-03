## What is this repo? 

The basis for [myBinder](https://mybinder.readthedocs.io/en/latest/) instances working with an "overclocked" Julia system.

Specifically, we use [PackageCompiler.jl](https://github.com/JuliaLang/PackageCompiler.jl) to "bake" the `Plots, DataFrames, GR` and `Query` packages into our system image. As Simon Danisch points out in his [article](https://medium.com/@sdanisch/compiling-julia-binaries-ddd6d4e0caf4) on the tool: 

> Julia so far only offers precompilation, which just caches the result of Julia’s lowering pass — which is at most half of the total compilation cost.

The advantage of PackageCompiler is that you can pre-pay the _entire_ compilation cost. Which helps a ton, especially for heavy packages like Plots.

## Usage 

Click the badge below to spin up your own Binder instance (as of `v0.2.1` of this repo.) That's it! 

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/arnavs/compiled-binder-example/v0.2.2?filepath=notebooks/demo.ipynb)

And here is a link to `master`. **Note:** Because of how Binder is built, this link will often be slower than the static tag above. 

[![badge](https://img.shields.io/badge/dev-binder-E66581.svg?logo=data:image/png;base64,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)](https://mybinder.org/v2/gh/arnavs/compiled-binder-example/master)
## Adaptation

> How do I add new packages to "bake in?"

Edit the following line in the Dockerfile: 

```
RUN julia -e "using Pkg; pkg\"add PackageCompiler Plots DataFrames GR Query\"; using PackageCompiler; compile_incremental(:Plots, :DataFrames, GR, :Query, force = true)"
```

That is, first add the package in the `pkg\"add PackageCompiler Plots...\"`, and then add it to the `compile_incremental(:Plots, :DataFrames, ...)`

> How do I add new packages that aren't baked-in?

Edit the next line of the Dockerfile: 

```
RUN julia -e "using Pkg; pkg\"add IJulia Parameters\"; pkg\"precompile\""
```

> What repository files get added to the Dockerfile? 

Everything that's not listed in the `.dockerignore`.

> How do I build set up myBinder instances from my own image?

Once you have a Dockerfile, set it up in a public GitHub repository, and follow the instructions at the [myBinder website](https://mybinder.org).

**Notes about Deployment:** 

1. These images are much faster if you use static tags (i.e., tag a release, and then have your binder link refer to that release). For example, the link above begins `https://mybinder.org/v2/gh/arnavs/compiled-binder-example/v0.2.0?`. Note that, if you don't do this, it will build a new image every time you commit to the repository. 

2. To set a particular file as the entrypoint, you can add a string to the end of the URL. For example, we added `filepath=notebooks/demo.ipynb)`.

3. Speed is variable. Repositories that are used a lot get unintentional speed bosts, because their Docker images are already cached on each Binder server (but, this only helps if you use static tags/have unchanging content!) 

4. It helps to keep your Dockerfile small. This involves bundling as many commands as make sense in individual `RUN` statements (to minimize additional layers), and following hygiene (e.g., after we add our Ubuntu packages, we run `apt-get clean`.)

## Contributions, etc. 

You can file an issue or PR on this repository if there are any problems. Or contact me at `arnav.sood@ubc.ca`.
