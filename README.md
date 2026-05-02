# Optimization Visualizer

An interactive web application for exploring and comparing various mathematical optimization algorithms.

## 🚀 Quick Start

### Windows
```bash
Double-click: setup.bat
```

### Mac/Linux
```bash
chmod +x setup.sh
./setup.sh
```

## 📖 Full Documentation

See **[SETUP.md](SETUP.md)** for detailed setup instructions and troubleshooting.

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