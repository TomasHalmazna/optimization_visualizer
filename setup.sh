#!/bin/bash

# ============================================================================
# Optimization Visualizer - Mac/Linux Setup Script
# ============================================================================
# This script sets up and runs the Optimization Visualizer locally
# Requirements: Julia 1.10+ installed
# ============================================================================

set -e  # Exit on error

echo ""
echo "============================================================================"
echo "Optimization Visualizer - Local Setup"
echo "============================================================================"
echo ""

# Check if Julia is installed
if ! command -v julia &> /dev/null; then
    echo "[ERROR] Julia is not installed or not in PATH"
    echo ""
    echo "Please install Julia 1.10+ from: https://julialang.org/downloads/"
    echo ""
    exit 1
fi

# Get Julia version
JULIA_VERSION=$(julia --version 2>&1)
echo "[OK] Found Julia: $JULIA_VERSION"
echo ""

# Check if Julia version is 1.10 or higher
MAJOR_VERSION=$(julia -e 'println(VERSION.major)' 2>/dev/null)
MINOR_VERSION=$(julia -e 'println(VERSION.minor)' 2>/dev/null)

if [[ $MAJOR_VERSION -lt 1 ]] || [[ $MAJOR_VERSION -eq 1 && $MINOR_VERSION -lt 10 ]]; then
    echo "[ERROR] Julia version 1.10 or higher is required."
    echo "Current version: $JULIA_VERSION"
    echo ""
    exit 1
fi

echo "[OK] Julia version is compatible"
echo ""

# Navigate to backend directory
if [ ! -d "backend" ]; then
    echo "[ERROR] Could not find backend directory"
    echo "Please run this script from the root of the optimization_visualizer folder"
    exit 1
fi

cd backend

echo "[*] Installing/updating packages from Manifest.toml..."
echo "This may take a few minutes on first run..."
echo ""

# Install packages and start server
julia --project=. -e "using Pkg; Pkg.instantiate(); include(\"server.jl\")"

echo ""
echo "============================================================================"
echo "Optimization Visualizer is running!"
echo "============================================================================"
echo ""
echo "Server is accessible at: http://localhost:8000"
echo ""
echo "The browser should open automatically..."
echo "If not, manually open: http://localhost:8000"
echo ""
echo "Press Ctrl+C to stop the server"
echo "============================================================================"
echo ""
