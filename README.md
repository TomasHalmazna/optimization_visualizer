# Optimization Visualizer

An interactive web application for exploring and comparing various mathematical optimization algorithms.

## 🚀 Quick Start

### Prerequisites
- Julia 1.10+ (download from [julialang.org](https://julialang.org/downloads/))
- Any modern web browser

### Windows
Open Command Prompt and run:
```cmd
cd path\to\optimization_visualizer\backend
julia --project=. -e "using Pkg; Pkg.instantiate(); include(\"server.jl\")"
```

Then open your browser to: **http://localhost:8000**

### Mac/Linux
Open Terminal and run:
```bash
cd path/to/optimization_visualizer/backend
julia --project=. -e "using Pkg; Pkg.instantiate(); include(\"server.jl\")"
```

Then open your browser to: **http://localhost:8000**

## 📖 Detailed Setup & Troubleshooting

See **[SETUP.md](SETUP.md)** for detailed setup instructions, expected output, and troubleshooting.

## 📋 Features

- **10+ Built-in Test Functions**: Rosenbrock, Ackley, Sphere, Himmelblau, and more
- **6 Optimization Methods**: Steepest Descent, Conjugate Gradient, Newton's Method, DFP, BFGS, L-BFGS
- **5 Line Search Strategies**: Backtracking, Golden Section Search, Brent's Method, Dichotomous Search, Quadratic Fit
- **2D Interactive Visualizations**: Contour plots with trajectory overlays
- **Convergence Monitoring**: Real-time evolution plots showing optimization progress
- **Custom Functions**: Define your own objective functions

## 🔧 Requirements

- Julia 1.10+ (download from [julialang.org](https://julialang.org/downloads/))
- Modern web browser
- ~1 GB disk space (first-time setup)

## ⚙️ Reproducibility

This app uses **Manifest.toml** to lock exact package versions, ensuring it works identically:
- On any machine (Windows, Mac, Linux)
- For years to come
- See [VERSION_COMPATIBILITY.md](VERSION_COMPATIBILITY.md) for details

## 📚 More Information

- **[DOCUMENTATION.md](DOCUMENTATION.md)** - Complete technical documentation
- **[VERSION_COMPATIBILITY.md](VERSION_COMPATIBILITY.md)** - Julia version support & long-term reproducibility