## What is this repo? 

The basis for [myBinder](https://mybinder.readthedocs.io/en/latest/) instances working with an "overclocked" Julia system.

Specifically, we use [PackageCompiler.jl](https://github.com/JuliaLang/PackageCompiler.jl) to "bake" the `Plots, DataFrames, GR` and `Query` packages into our system image. As Simon Danisch points out in his [article](https://medium.com/@sdanisch/compiling-julia-binaries-ddd6d4e0caf4) on the tool: 

> Julia so far only offers precompilation, which just caches the result of Julia’s lowering pass — which is at most half of the total compilation cost.

The advantage of PackageCompiler is that you can pre-pay the _entire_ compilation cost. Which helps a ton, especially for heavy packages like Plots.

## Usage 

Click the badge below to spin up your own Binder instance. That's it!

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/arnavs/compiled-binder-example/v0.2.0?filepath=notebooks/demo.ipynb)

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
