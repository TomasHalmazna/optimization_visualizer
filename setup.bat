@echo off
REM ============================================================================
REM Optimization Visualizer - Windows Setup Script
REM ============================================================================
REM This script sets up and runs the Optimization Visualizer locally on Windows
REM Requirements: Julia 1.10+ installed and available in PATH
REM ============================================================================

setlocal enabledelayedexpansion

echo.
echo ============================================================================
echo Optimization Visualizer - Local Setup
echo ============================================================================
echo.

REM Check if Julia is installed
where julia >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Julia is not installed or not in PATH
    echo.
    echo Please install Julia 1.10+ from: https://julialang.org/downloads/
    echo Make sure to add Julia to your system PATH during installation.
    echo.
    pause
    exit /b 1
)

REM Get Julia version
for /f "tokens=*" %%i in ('julia --version 2^>nul') do set JULIA_VERSION=%%i
echo [OK] Found Julia: %JULIA_VERSION%
echo.

REM Check if Julia version is 1.10 or higher
for /f "tokens=2" %%i in ('julia --version 2^>nul') do (
    set VERSION=%%i
    for /f "tokens=1 delims=." %%a in ('echo !VERSION!') do set MAJOR=%%a
    for /f "tokens=2 delims=." %%b in ('echo !VERSION!') do set MINOR=%%b
)

if %MAJOR% LSS 1 (
    echo [ERROR] Julia version 1.10 or higher is required.
    echo Current version: %VERSION%
    echo.
    pause
    exit /b 1
)

if %MAJOR% EQU 1 if %MINOR% LSS 10 (
    echo [ERROR] Julia version 1.10 or higher is required.
    echo Current version: %VERSION%
    echo.
    pause
    exit /b 1
)

echo [OK] Julia version is compatible
echo.

REM Navigate to backend directory
cd backend
if errorlevel 1 (
    echo [ERROR] Could not navigate to backend directory
    echo Please run this script from the root of the optimization_visualizer folder
    pause
    exit /b 1
)

echo [*] Installing/updating packages from Manifest.toml...
echo This may take a few minutes on first run...
echo.

REM Install packages using Julia
julia --project=. -e "using Pkg; Pkg.instantiate(); include(\"server.jl\")" 2>nul

if errorlevel 1 (
    echo [ERROR] Failed to start the server
    echo.
    echo Troubleshooting tips:
    echo - Make sure you have internet connection (first run downloads packages)
    echo - Check that backend/Project.toml and Manifest.toml exist
    echo - Try deleting the 'packages' folder and running again
    echo.
    pause
    exit /b 1
)

echo.
echo ============================================================================
echo Optimization Visualizer is running!
echo ============================================================================
echo.
echo Server is accessible at: http://localhost:8000
echo.
echo The browser should open automatically...
echo If not, manually open: http://localhost:8000
echo.
echo Press Ctrl+C to stop the server
echo ============================================================================
echo.

pause
exit /b 0
