# HELM Julia Testbed

This document provides information 

* Bullet point.

## Installation and Execution
First, navigate to the `julia` directory within the `code` top-level directory. You can confirm by starting the [Julia REPL](https://docs.julialang.org/en/v1/stdlib/REPL/) and executing the following.
```
pwd()
```

Now, you should enter the Pkg mode by pressing the `]` key. The prompt should change. To add the custom HELM package you can run the following command.
```
add https://github.com/pnnl/Continual-Load-Modelling-HELM.git:code/julia/HELM/
```

Then, use the following command (in Pkg mode) to activate the current environment.
```
activate .
```

Finally, exit Pkg mode (press the `Backspace` key or `ctrl+C` on Windows), and run the following command to try the HELM Julia Testbed.
```
include("getFCMfromHarmonics.jl")
```