# Optimization Visualizer

An interactive web application for exploring and comparing various mathematical optimization algorithms.

## Installation

### Obtaining the Repository

If you have Git installed:
```bash
git clone https://github.com/TomasHalmazna/optimization_visualizer.git
cd optimization_visualizer
```

If you do not have Git, download the repository directly:
- Visit https://github.com/TomasHalmazna/optimization_visualizer
- Click the green "Code" button
- Select "Download ZIP"
- Extract the downloaded file

### Prerequisites

- Julia 1.10 or higher ([download from julialang.org](https://julialang.org/downloads/))
- Any modern web browser
- Approximately 1 GB disk space for first-time setup

## Running Locally

Navigate to the backend directory and start the server:

**Windows (Command Prompt):**
```cmd
cd optimization_visualizer\backend
julia --project=. server.jl
```

**Mac/Linux (Terminal):**
```bash
cd optimization_visualizer/backend
julia --project=. server.jl
```

Then open your browser to: **http://localhost:8080**

First run takes 2-5 minutes (packages download and compile). Subsequent runs take 30-60 seconds.

## Detailed Setup Guide

See [SETUP.md](SETUP.md) for comprehensive setup instructions and troubleshooting.

## Features

- 10 built-in test functions (Rosenbrock, Ackley, Sphere, Himmelblau, etc.)
- 6 optimization methods (Steepest Descent, Conjugate Gradient, Newton's Method, DFP, BFGS, L-BFGS)
- 5 line search strategies (Backtracking, Golden Section Search, Brent's Method, Dichotomous Search, Quadratic Fit)
- 2D interactive contour plots with trajectory visualization
- Real-time convergence monitoring through evolution plots
- Custom function definition capability

## Documentation

See [DOCUMENTATION.md](DOCUMENTATION.md) for complete technical documentation including algorithm descriptions, API reference, and implementation details.
