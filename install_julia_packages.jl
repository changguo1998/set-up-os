using Pkg

pkg_list = ["CUDA", "CairoMakie", "GLMakie", "GeoMakie",
"DSP", "FFTW", "Interpolations", "JuliaFormatter",
            "JLD2", "NCDatasets", "NetCDF", "OhMyREPL", "PkgTemplates",
            "Polynomials", "QuadGK", "SpecialFunctions", "SpecialMatrices",
            "SpecialPolynomials", "TimeZones"]

projectsdir = abspath("D:/Research/Projects/")

prj_list = ["DWN", "SeismicRayTrace.jl", "LengthAreaVolume.jl", "SeisTools.jl",
            "JuliaSourceMechanism", "NumericalSimulationFramework.jl",
            "gc-research-assistant", "SeismicDatabaseManager.jl"]

@info "Install packages"
Pkg.add(pkg_list)
for prj in prj_list
    pp = abspath(joinpath(projectsdir, prj))
    if isdir(pp)
        try
            Pkg.develop(path=pp)
            @info "Developed project $prj"
        catch err
            @error "Error while developing $prj, path: $pp"
        end
    end
end

@info "Install Julia config"
config_target_dir = joinpath(ENV["JULIA_DEPOT_PATH"], "config")
config_target_file = joinpath(config_target_dir, "startup.jl")
if isfile(config_target_file)
    cp(joinpath(@__DIR__, "startup.jl"), config_target_file; force=true)
end

@info "Done"
