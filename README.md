## What is this repo? 

The basis for [myBinder](https://mybinder.readthedocs.io/en/latest/) instances working with an "overclocked" Julia system.

Specifically, we use [PackageCompiler.jl](https://github.com/JuliaLang/PackageCompiler.jl) to "bake" the `Plots` package into our system image. As Simon Danisch points out in his [article](https://medium.com/@sdanisch/compiling-julia-binaries-ddd6d4e0caf4) on the tool: 

> Julia so far only offers precompilation, which just caches the result of Julia’s lowering pass — which is at most half of the total compilation cost.

The advantage of PackageCompiler is that you can pre-pay the _entire_ compilation cost. Which helps a ton, especially for heavy packages like Plots.

## Usage 

Click the badge below to spin up your own Binder instance. That's it!

## Adaptation

To add new packages to "bake in": 

[EDIT HERE]

To add new packages that aren't baked in: 

[EDIT HERE]

You can then set up your own binder link for the resulting repo by following the instructions: 

[EDIT HERE]

## Contributions, etc. 

You can file an issue or PR on this repository if there are any problems. Or contact me at `arnav.sood@ubc.ca`.
