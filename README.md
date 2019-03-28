## What is this repo? 

The basis for [myBinder](https://mybinder.readthedocs.io/en/latest/) instances working with an "overclocked" Julia system.

Specifically, we use [PackageCompiler.jl](https://github.com/JuliaLang/PackageCompiler.jl) to "bake" the `Plots` package into our system image. As Simon Danisch points out in his [article](https://medium.com/@sdanisch/compiling-julia-binaries-ddd6d4e0caf4) on the tool: 

> Julia so far only offers precompilation, which just caches the result of Julia’s lowering pass — which is at most half of the total compilation cost.

The advantage of PackageCompiler is that you can pre-pay the _entire_ compilation cost. Which helps a ton, especially for heavy packages like Plots.

## Usage 

Click the badge below to spin up your own Binder instance. That's it!

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/arnavs/compiled-binder-example/v0.1.0)

## Adaptation

> How do I add new packages to "bake in?"

You can edit the following line in the Dockerfile: 

```
RUN julia -e "using Pkg; pkg\"add PackageCompiler Plots DataFrames GR Query\"; using PackageCompiler; compile_incremental(:Plots, :DataFrames, GR, :Query, force = true)"
```

That is, first add the package in the `pkg\"add PackageCompiler Plots...\"`, and then add it to the `compile_incremental(:Plots, :DataFrames, ...)`

> How do I add new packages that aren't baked-in?

You can edit the next line of the Dockerfile: 

```
RUN julia -e "using Pkg; pkg\"add IJulia Parameters\""
```

> How do I build set up myBinder instances from my own image?

Once you have a Dockerfile, set it up in a public GitHub repository, and follow the instructions at the [myBinder website](https://mybinder.org).

## Contributions, etc. 

You can file an issue or PR on this repository if there are any problems. Or contact me at `arnav.sood@ubc.ca`.
