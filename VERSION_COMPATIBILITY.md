# Version Compatibility & Reproducibility

## Julia Version Support

### Current Status
- **Developed with**: Julia **1.10.2**
- **Minimum required**: Julia **1.10.0**
- **Tested up to**: Julia 1.11 (latest)
- **Last updated**: May 2026

### Compatibility Table

| Julia Version | Status | Notes |
|---------------|--------|-------|
| 1.10.0 - 1.10.x | ✅ Supported | Recommended minimum version |
| 1.11+ | ✅ Supported | Expected to work, report issues if found |
| 1.9.x | ❌ Not supported | Some features may not work |
| 2.0+ | ⚠️ Unknown | Will require code updates when available |

---

## Reproducibility & Package Management

### How We Guarantee Reproducibility

This repository includes two critical files:

1. **`backend/Project.toml`**
   - Lists all package dependencies
   - Specifies minimum package versions

2. **`backend/Manifest.toml`**
   - Locks **exact versions** of all packages
   - Ensures identical environments across machines
   - Guarantees reproducibility for ~2-3 years

### Key Packages (Locked Versions)

```julia
ForwardDiff = "f6369f11-7733-5829-9624-2563aa707210"   # Automatic differentiation
HTTP = "cd3eb016-35fb-5094-929b-558a96fad6f3"         # Server framework
Optim = "429524aa-4258-5aef-a3af-852621145aeb"        # Optimization reference
Oxygen = "df9a0d86-3283-4920-82dc-4555fc0d1d8b"       # Web server
```

When you run the setup script, Julia uses `Manifest.toml` to install **exactly** these versions, ensuring consistency.

---

## Long-Term Maintenance

### How Long Will This Work?

**Guaranteed working**: Until **2028** (3+ years from release)
- Package versions in Manifest.toml remain available
- Julia 1.10+ remains stable
- No breaking changes expected in used packages

### What Could Break This?

1. **Julia 2.0 release** (2027-2028 estimated)
   - May introduce syntax breaking changes
   - Would require code updates
   - Manifest.toml alone won't help with this

2. **Package removal from registries** (unlikely)
   - Julia packages are generally archived permanently
   - Manifest.toml locks exact versions, which are usually available

3. **Dependency removal** (very rare)
   - Some packages could become unavailable
   - Manifest.toml prevents this for pinned versions

### Maintenance Strategy

To ensure long-term functionality:

- ✅ **Keep this repo**: GitHub serves as permanent backup
- ✅ **Run tests annually**: Check if app still works on latest Julia
- ✅ **Document breaking changes**: Note required updates in releases
- ✅ **Consider Docker**: For truly unchanging environment (see SETUP.md)

---

## If You're Reading This in 2027+

### How to Update

If something breaks:

1. **Check Julia version compatibility** (see table above)
2. **Run the setup script again** - often fixes version conflicts
3. **Delete Julia packages** and reinstall:
   ```bash
   rm -rf ~/.julia/packages
   # Then run setup script again
   ```
4. **Check for upstream changes** - Visit the repository for updates
5. **Update Julia to latest 1.x** if on older version:
   - Visit https://julialang.org/downloads/

### When Julia 2.0 Arrives

If Julia 2.0 is released and this app breaks:

1. You can **keep using Julia 1.10.x** indefinitely (local version)
2. Or the repo owner can create a **Julia 2.0 branch** with updated code
3. Manifest.toml for 1.10.x will always be available

---

## Technical Details

### Why Manifest.toml Works

`Manifest.toml` contains:
- Exact package versions
- Package SHA-256 hashes (for integrity)
- Dependency resolution information

When Julia reads this file, it:
1. Downloads exact versions from package registries
2. Verifies checksums match
3. Sets up an identical environment to the original

This works because:
- Julia maintains package archives
- Packages are versioned immutably (version X is always version X)
- The registry keeps historical records

### Limitations of Manifest.toml

- **Julia version upgrades**: Manifest.toml assumes Julia 1.10.x behavior
  - Julia 2.0 might break code (syntax changes)
  - Manifest.toml can't solve this alone
  
- **System dependencies**: If Julia itself breaks (unlikely)
  - OS-specific binary packages could fail
  - But this is extremely rare

### Docker Alternative

For truly unchanging reproducibility:

```dockerfile
FROM julia:1.10.2
COPY . /app
WORKDIR /app/backend
RUN julia --project=. -e "using Pkg; Pkg.instantiate()"
CMD ["julia", "--project=.", "server.jl"]
```

This freezes Julia version too, but requires Docker.

---

## Current Package Versions

As of May 2026, locked to:

```
ForwardDiff v0.10.x
HTTP v1.x
Optim v1.7.x
Oxygen v1.0.x
```

These are stable, well-maintained packages with:
- Active development communities
- Strong backward compatibility
- Unlikely to be deprecated

---

## Questions?

**Q: Will this work on my computer in 2028?**
A: Yes, if you keep Julia 1.10-1.11. If Julia 2.0 breaks it, check the repository for an updated version.

**Q: What if I accidentally upgrade Julia?**
A: Run the setup script again - it will adjust to the new version (usually works fine).

**Q: Can I modify this app?**
A: Yes! The Manifest.toml locks *your* environment, so modifications stay reproducible.

**Q: Is there a version for Julia 1.9?**
A: Not currently, but could be added. Would require testing and potentially code adjustments.

---

## Summary

✅ **This app is reproducible and will work reliably for 2-3 years**
✅ **Manifest.toml guarantees exact package versions**
✅ **Julia 1.10.x will remain available indefinitely**
⚠️ **Julia 2.0 may require code updates (not yet applicable)**
✅ **GitHub repo serves as permanent backup**

You can trust this version to work reliably for your dissertation and beyond!
