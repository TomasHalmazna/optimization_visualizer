# Setup Instructions

## Prerequisites

- **Juliaup** (The official Julia version manager)
- **Julia 1.10.2** (Specifically required to ensure package compatibility)
- Any modern web browser
- Approximately 1 GB disk space for first-time package installation
- Internet connection (required for initial package download)

## Installation

### Step 1: Obtain the Repository

**Option A: Using Git**
```bash
git clone [https://github.com/TomasHalmazna/optimization_visualizer.git](https://github.com/TomasHalmazna/optimization_visualizer.git)
cd optimization_visualizer
```

**Option B: Download Without Git**
1. Visit https://github.com/TomasHalmazna/optimization_visualizer
2. Click the green "Code" button
3. Select "Download ZIP"
4. Extract the downloaded file

### Step 2: Install Julia Environment

To ensure strict version compatibility, use the official Julia version manager (`juliaup`):

1. Install Julia via the official instructions at https://julialang.org/downloads/
2. Open your terminal or command prompt and install the specific version required by this project:
   ```bash
   juliaup add 1.10.2
   ```

### Step 3: Navigate to Backend Directory

**Windows (Command Prompt / PowerShell):**
```cmd
cd optimization_visualizer\backend
```

**Mac/Linux (Terminal):**
```bash
cd optimization_visualizer/backend
```

### Step 4: Start the Server

Run the server using the explicitly installed version of Julia. This command will automatically resolve and download all required dependencies on the first run:
```bash
julia +1.10.2 --project=. server.jl
```

## Expected Output

You should see:

```text
Activating project at `...optimization_visualizer/backend`
Starting production server on port 8080...
Started server: [http://0.0.0.0:8080](http://0.0.0.0:8080)
Listening on: 0.0.0.0:8080, thread id: 1
```

When this message appears, the server is ready.

## Accessing the Application

Open your web browser and navigate to:

```text
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

### Version Conflict / Unsatisfiable Requirements

If you attempt to run the project using a newer version of Julia (e.g., 1.12.x) without the `+1.10.2` flag, you may encounter an "Unsatisfiable requirements" error related to standard libraries like `Statistics`. 

**Solution A (Recommended):** Use `juliaup` to install and run version 1.10.2 as described in Step 2 and 4.

**Solution B (Force upgrade):** If you *must* use a newer version of Julia, you need to delete the lockfile to let Julia resolve new dependencies:
1. Delete the `Manifest.toml` file inside the `backend` folder.
2. Run `julia --project=. server.jl` again. Julia will generate a fresh manifest compatible with your current version.

### Julia or Juliaup is not installed

Verify the installation:
```bash
juliaup status
```
If this command is not found, ensure you installed Julia via the default instructions on julialang.org, which includes `juliaup`. Restart your terminal after installation.

### Port 8080 is already in use

Another application is using port 8080. Either:
- Close the other application
- Or stop any previous instance of this server (`Ctrl+C`)

### Server starts but browser shows "Cannot connect"

1. Verify the terminal shows: `Listening on: 0.0.0.0:8080`
2. Check your firewall is not blocking port 8080
3. Try opening http://127.0.0.1:8080 instead

### Browser loads but interface doesn't work

1. Ensure JavaScript is enabled in your browser
2. Check the browser console for errors (F12)
3. Verify all files loaded: app.js, style.css

## File Structure
```text
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
│   ├── index.html             # Main page
│   ├── app.js                 # JavaScript application logic
│   └── style.css              # Styling
├── README.md
├── SETUP.md
└── DOCUMENTATION.md
```

## System Requirements

| Component | Requirement |
|-----------|-------------|
| Operating System | Windows, Mac, or Linux |
| Julia | Exactly 1.10.2 via juliaup (or require Manifest deletion for newer versions) |
| Memory | 512 MB minimum, 1-2 GB recommended |
| Disk Space | Approximately 1 GB for packages |
| Internet | Required for initial setup only |

## Documentation

- **README.md** - Quick start guide
- **DOCUMENTATION.md** - Complete technical documentation
