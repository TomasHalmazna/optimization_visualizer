# Optimization Visualizer - Setup Instructions

A production-ready optimization algorithm visualizer for exploring and comparing optimization methods locally.

## Quick Start

### Prerequisites
- **Julia 1.10+** (required)
- **Browser** (any modern browser: Chrome, Firefox, Safari, Edge)
- **Internet connection** (first-time setup only)

### Windows Users

#### 1. Install Julia (if not already installed)
- Download from: https://julialang.org/downloads/
- Run the installer
- **Important**: Check "Add Julia to PATH" during installation
- Restart your computer after installation

#### 2. Open Command Prompt
- Press `Win + R`, type `cmd`, and press Enter
- Or search for "Command Prompt" in Start menu

#### 3. Navigate to the backend folder
```cmd
cd path\to\optimization_visualizer\backend
```

**Example:**
```cmd
cd C:\Users\YourUsername\Desktop\optimization_visualizer\backend
```

#### 4. Start the server
```cmd
julia --project=. server.jl
```

#### 5. You should see output like:
```
Starting production server on port 8080...
```

When you see this message, the server is **running and ready**.

#### 6. Open your browser
Navigate to: **http://localhost:8080**

#### 7. To stop the server
Press `Ctrl+C` in the command prompt

**Note**: First run takes 2-5 minutes (packages downloading). Subsequent runs take ~30-60 seconds.

---

### Mac/Linux Users

#### 1. Install Julia (if not already installed)
**Option A: Download installer**
- Visit: https://julialang.org/downloads/
- Extract and follow installation instructions

**Option B: Using Homebrew (Mac)**
```bash
brew install julia
```

#### 2. Open Terminal

#### 3. Navigate to the backend folder
```bash
cd /path/to/optimization_visualizer/backend
```

**Example:**
```bash
cd ~/Downloads/optimization_visualizer/backend
```

#### 4. Start the server
```bash
julia --project=. server.jl
```

#### 5. You should see output like:
```
Starting production server on port 8080...
```

When you see this message, the server is **running and ready**.

#### 6. Open your browser
Navigate to: **http://localhost:8080**

#### 7. To stop the server
Press `Ctrl+C` in the terminal

**Note**: First run takes 2-5 minutes (packages downloading). Subsequent runs take ~30-60 seconds.

## What Happens When You Run the Command

When you execute:
```
julia --project=. server.jl
```

Julia will:

1. ✅ Load the project from current directory
2. ✅ Read `Manifest.toml` to see required packages
3. ✅ Download and install packages (first time only, ~2-3 minutes)
4. ✅ Compile packages (Julia compiles to native code)
5. ✅ Run server.jl and start the web server

**First run**: Takes 3-5 minutes total (downloading, compiling, and starting)
**Subsequent runs**: Takes 30-60 seconds (just loading and starting)

You'll see output like:
```
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type `?help` (and press enter) for help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.10.2 (2024-02-13)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org release
|__/                   |

Starting production server on port 8080...
```

**When you see `Starting production server on port 8080...`, the server is ready!**

Open your browser and navigate to: **http://localhost:8080**

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

**Error message:**
```
'julia' is not recognized as an internal or external command
```

**Solution:**
- Install Julia from: https://julialang.org/downloads/
- **Windows**: Make sure "Add Julia to PATH" is checked during installation
- **Mac/Linux**: Follow the [official installation guide](https://docs.julialang.org/en/v1/manual/getting-started/)
- **After installation, restart your terminal/command prompt and try again**

To verify Julia is installed:
```cmd
julia --version
```

Should show: `julia version 1.10.x` (or higher)

---

### "The server doesn't start / no Listening message"

**Solution:**
1. Check the error messages in your terminal (scroll up to see them)
2. Ensure you're in the `backend` folder:
   ```cmd
   cd backend
   dir
   ```
   You should see: `server.jl`, `Project.toml`, `Manifest.toml`

3. Try running Julia without the app first:
   ```cmd
   julia --version
   ```
   If this fails, Julia is not properly installed

---

### Package download errors / "Network error"

**Error message:**
```
ERROR: failed to fetch registry information
```

**Solution:**
- Ensure you have **internet connection** (required for first run)
- Try running the command again
- If persistent, try:
  ```cmd
  julia --project=. -e "using Pkg; Pkg.update()"
  ```

---

### "Port 8000 is already in use"

**Error message:**
```
ERROR: failed to listen
```

**Solution:**
- Close any other application using port 8000
- Or stop the previous instance of this app (press `Ctrl+C`)
- If you want to use a different port, edit `backend/server.jl` and change the port number in the last line

---

### Browser opens but says "Cannot connect"

**Solution:**
1. Check that the Julia terminal shows:
   ```
   [ Info: Listening on: 127.0.0.1:8000
   ```
2. Try manually opening: http://localhost:8000 or http://127.0.0.1:8000
3. If still doesn't work, Julia server may have crashed - check error messages in terminal

---

### "Module not found" or "Package Error"

**Example error:**
```
ERROR: ArgumentError: Package Optim not found in current path...
```

**Solution:**
- Ensure you're in the `backend` folder
- Run the command again (Julia needs to download packages first time):
  ```cmd
  julia --project=. -e "using Pkg; Pkg.instantiate(); include(\"server.jl\")"
  ```
- If persists, delete Julia's package cache and try again:
  ```cmd
  julia --project=. -e "using Pkg; Pkg.rm(\"Optim\")"
  ```

---

### "Precompiling failed" or compilation errors

**Solution:**
- This is usually temporary. Try again:
  ```cmd
  julia --project=. -e "using Pkg; Pkg.instantiate(); include(\"server.jl\")"
  ```
- If it fails repeatedly, the issue is likely with your Julia installation
- Try updating Julia to the latest 1.10.x version

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

## System Requirements

| Component | Requirement |
|-----------|-------------|
| **OS** | Windows, Mac, or Linux |
| **Julia** | 1.10.2+ (tested up to 1.11) |
| **RAM** | 512 MB minimum, 1-2 GB recommended |
| **Disk** | ~1 GB for Julia packages (first install) |
| **Network** | Required for first setup (package download) |
| **Terminal** | Command Prompt (Windows) or Terminal (Mac/Linux) |

---

## Performance

| Scenario | Time |
|----------|------|
| **First run** (download packages) | 3-5 minutes |
| **First run** (compile packages) | 1-2 minutes |
| **Subsequent runs** (load and start) | 30-60 seconds |
| **Optimization computation** | 1-5 seconds (depends on function) |

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
