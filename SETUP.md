# Setup Instructions

## Prerequisites

- Julia 1.10 or higher
- Any modern web browser
- Approximately 1 GB disk space for first-time package installation
- Internet connection (required for initial package download)

## Installation

### Step 1: Obtain the Repository

**Option A: Using Git**
```bash
git clone https://github.com/TomasHalmazna/optimization_visualizer.git
cd optimization_visualizer
```

**Option B: Download Without Git**
1. Visit https://github.com/TomasHalmazna/optimization_visualizer
2. Click the green "Code" button
3. Select "Download ZIP"
4. Extract the downloaded file

### Step 2: Install Julia

If not already installed:
- Download from https://julialang.org/downloads/
- Install following the official instructions
- Verify installation by opening a terminal and running: `julia --version`

### Step 3: Navigate to Backend Directory

**Windows (Command Prompt):**
```cmd
cd optimization_visualizer\backend
```

**Mac/Linux (Terminal):**
```bash
cd optimization_visualizer/backend
```

### Step 4: Start the Server

```
julia --project=. server.jl
```

## Expected Output

You should see:

```
Activating project at `...optimization_visualizer/backend`
Starting production server on port 8080...
Started server: http://0.0.0.0:8080
Listening on: 0.0.0.0:8080, thread id: 1
```

When this message appears, the server is ready.

## Accessing the Application

Open your web browser and navigate to:

```
http://localhost:8080
```

## Stopping the Server

Press `Ctrl+C` in the terminal where the server is running.

## Performance Notes

**First Run:** 3-5 minutes
- Julia downloads required packages (~300-500 MB)
- Packages are compiled to native code
- This only happens once; packages are cached locally

**Subsequent Runs:** 30-60 seconds
- Only loading and initialization
- No package downloads

## Troubleshooting

### Julia is not installed or not in PATH

Verify Julia is in your system PATH:

```
julia --version
```

If this command is not found, install Julia from https://julialang.org/downloads/

**Windows:** Ensure "Add Julia to PATH" is checked during installation. Restart terminal after installation.

**Mac/Linux:** Follow the official installation guide at https://docs.julialang.org/en/v1/manual/getting-started/

### Package installation failed

Ensure you have:
- A working internet connection
- At least 1 GB of free disk space
- Write permissions to the installation directory

Retry the command:
```
julia --project=. server.jl
```

### Port 8080 is already in use

Another application is using port 8080. Either:
- Close the other application
- Or stop any previous instance of this server (Ctrl+C)

### Server starts but browser shows "Cannot connect"

1. Verify the terminal shows: `Listening on: 0.0.0.0:8080`
2. Check your firewall is not blocking port 8080
3. Try opening http://127.0.0.1:8080 instead

### Browser loads but interface doesn't work

1. Ensure JavaScript is enabled in your browser
2. Check the browser console for errors (F12)
3. Verify all files loaded: app.js, style.css

### Module not found errors

Ensure you are in the `backend` folder and try running the command again. Julia may need time to download and compile packages on first run.

## File Structure

```
optimization_visualizer/
├── backend/
│   ├── server.jl              # Main server entry point
│   ├── Core.jl                # Core optimization framework
│   ├── Project.toml           # Package dependencies
│   ├── Manifest.toml          # Locked package versions
│   ├── Optimizers/            # Optimization algorithms
│   │   ├── SteepestDescent.jl
│   │   ├── ConjugateGradient.jl
│   │   ├── NewtonMethod.jl
│   │   ├── BFGS.jl
│   │   ├── DFP.jl
│   │   └── LBFGS.jl
│   └── LineSearch/            # Line search methods
│       ├── Backtracking.jl
│       ├── GoldenSectionSearch.jl
│       ├── BrentsMethod.jl
│       ├── DichotomousSearch.jl
│       └── QuadraticFitSearch.jl
├── frontend/
│   ├── index.html            # Main page
│   ├── app.js                # JavaScript application logic
│   └── style.css             # Styling
├── README.md
├── SETUP.md
└── DOCUMENTATION.md
```

## System Requirements

| Component | Requirement |
|-----------|-------------|
| Operating System | Windows, Mac, or Linux |
| Julia | 1.10.2 or higher |
| Memory | 512 MB minimum, 1-2 GB recommended |
| Disk Space | Approximately 1 GB for packages |
| Internet | Required for initial setup only |

## Documentation

- **README.md** - Quick start guide
- **DOCUMENTATION.md** - Complete technical documentation
