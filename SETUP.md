# Optimization Visualizer - Setup Instructions

A production-ready optimization algorithm visualizer for exploring and comparing optimization methods locally.

## Quick Start

### Prerequisites
- **Julia 1.10+** (required)
- **Browser** (any modern browser: Chrome, Firefox, Safari, Edge)
- **Internet connection** (first-time setup only)

### Windows Users

1. **Install Julia** (if not already installed)
   - Download from: https://julialang.org/downloads/
   - Run the installer and select "Add Julia to PATH" during installation

2. **Run the app**
   - Double-click: `setup.bat`
   - Wait for packages to install (first run takes ~2-3 minutes)
   - Browser will open to `http://localhost:8000`

3. **To stop the server**
   - Press `Ctrl+C` in the command prompt

### Mac/Linux Users

1. **Install Julia** (if not already installed)
   - Download from: https://julialang.org/downloads/
   - Or use Homebrew: `brew install julia`

2. **Make script executable**
   ```bash
   chmod +x setup.sh
   ```

3. **Run the app**
   ```bash
   ./setup.sh
   ```
   - Wait for packages to install (first run takes ~2-3 minutes)
   - Browser will open to `http://localhost:8000`

4. **To stop the server**
   - Press `Ctrl+C` in the terminal

---

## What Happens During Setup

The setup script will:

1. ✅ Check that Julia 1.10+ is installed
2. ✅ Verify version compatibility
3. ✅ Navigate to the `backend` directory
4. ✅ Install/update all packages from `Manifest.toml`
   - Downloads optimization libraries
   - Sets up automatic differentiation
   - Configures web server framework
5. ✅ Start the local server on `http://localhost:8000`
6. ✅ Open your browser automatically

---

## Usage

Once the app is running:

1. **Select a test function** or define a custom one
2. **Configure optimization parameters:**
   - Choose optimization method (Steepest Descent, BFGS, Newton, etc.)
   - Select line search strategy
   - Set termination criteria and tolerance
3. **Click "Run Optimization"**
4. **Visualize results:**
   - 2D contour plot with optimization trajectory
   - Evolution plots showing convergence metrics

---

## Troubleshooting

### "Julia is not installed or not in PATH"

**Solution:**
- Install Julia from: https://julialang.org/downloads/
- **Windows**: Make sure "Add Julia to PATH" is checked during installation
- **Mac/Linux**: Follow the [official installation guide](https://docs.julialang.org/en/v1/manual/getting-started/)
- After installation, restart your terminal/command prompt

### "Julia version 1.10 or higher is required"

**Solution:**
- Update Julia to the latest 1.10+ version
- Check current version: Open terminal and run `julia --version`

### "Package installation failed" or "Module not found"

**Solution:**
- Ensure you have internet connection (first run downloads ~300MB)
- Try running the script again
- If persists, delete the `~/.julia/packages` folder and try again
- Check that `backend/Project.toml` and `backend/Manifest.toml` exist

### "Port 8000 is already in use"

**Solution:**
- Close the other application using port 8000
- Or modify `backend/server.jl` to use a different port (change port number in the last line)

### Server starts but browser doesn't open

**Solution:**
- Manually open: http://localhost:8000 in your browser
- Make sure JavaScript is enabled in your browser

---

## First Run Performance

⏱️ **First run** (packages downloading): ~3-5 minutes  
⏱️ **Subsequent runs**: ~2-3 seconds to start server

The wait on first run is normal - Julia is downloading and compiling optimization libraries.

---

## File Structure

```
optimization_visualizer/
├── backend/                    # Julia backend server
│   ├── server.jl              # Main server entry point
│   ├── Core.jl                # Core optimization framework
│   ├── Project.toml           # Package dependencies (reproducibility)
│   ├── Manifest.toml          # Locked package versions
│   ├── Optimizers/            # Optimization algorithms
│   │   ├── SteepestDescent.jl
│   │   ├── ConjugateGradient.jl
│   │   ├── Newton.jl
│   │   ├── BFGS.jl
│   │   ├── DFP.jl
│   │   └── LBFGS.jl
│   └── LineSearch/            # Line search methods
│       ├── Backtracking.jl
│       ├── GoldenSectionSearch.jl
│       ├── BrentsMethod.jl
│       ├── DichotomousSearch.jl
│       └── QuadraticFitSearch.jl
├── frontend/                  # Web interface
│   ├── index.html            # Main page
│   ├── app.js                # JavaScript application logic
│   └── style.css             # Styling
├── setup.bat                 # Windows launcher
├── setup.sh                  # Mac/Linux launcher
├── SETUP.md                  # This file
├── VERSION_COMPATIBILITY.md  # Julia version info
└── DOCUMENTATION.md          # Complete technical documentation
```

---

## Advanced: Manual Server Start

If the setup scripts don't work, you can start the server manually:

**Windows:**
```powershell
cd backend
julia --project=. -e "using Pkg; Pkg.instantiate(); include(\"server.jl\")"
```

**Mac/Linux:**
```bash
cd backend
julia --project=. -e "using Pkg; Pkg.instantiate(); include(\"server.jl\")"
```

---

## System Requirements

| Component | Requirement |
|-----------|-------------|
| **OS** | Windows, Mac, or Linux |
| **Julia** | 1.10.2+ (tested up to 1.11) |
| **RAM** | 512 MB minimum, 1-2 GB recommended |
| **Disk** | ~1 GB for Julia packages (first install) |
| **Network** | Required for first setup (package download) |

---

## Support & Documentation

- **Full technical documentation**: See `DOCUMENTATION.md`
- **Julia compatibility**: See `VERSION_COMPATIBILITY.md`
- **Report issues**: Check troubleshooting section above

---

## License

See the original thesis repository for licensing information.

---

**Happy optimizing!** 🚀
