using Downloads

global downloaddir = joinpath(@__DIR__, "downloads")

function downloadsoftware(name::String = ""; win::String = "",
                          linux::String = "", fnm::String="")
    global downloaddir
    url = ""
    if Sys.iswindows()
        if !isempty(win)
            url = win
        end
    elseif Sys.islinux()
        if !isempty(linux)
            url = linux
        end
    end
    if isempty(url)
        return nothing
    end
    (_, filename) = splitdir(url)
    if !isempty(fnm)
        filename = fnm
    end
    fpath = joinpath(downloaddir, filename)
    if !isfile(fpath)
        @info "Download $name"
        Downloads.download(url, fpath)
        @info "Download $name done"
    end
    return nothing
end

function downloadsource(name::String = "", url::String = ""; fnm::String="")
    global downloaddir
    (_, filename) = splitdir(url)
    if !isempty(fnm)
        filename = fnm
    end
    fpath = joinpath(downloaddir, filename)
    if !isfile(fpath)
        @info "Download $name"
        Downloads.download(url, fpath)
        @info "Download $name done"
    end
end

mkpath(downloaddir)
cd(downloaddir)

# gmsh
downloadsoftware("gmsh";
                 win = "https://gmsh.info/bin/Windows/gmsh-4.13.1-Windows64.zip",
                 linux = "https://gmsh.info/bin/Linux/gmsh-4.13.1-Linux64.tgz")

# meshlab
downloadsoftware("meshlab";
                 win = "https://github.com/cnr-isti-vclab/meshlab/releases/download/MeshLab-2023.12/MeshLab2023.12-windows.exe",
                 linux = "https://github.com/cnr-isti-vclab/meshlab/releases/download/MeshLab-2023.12/MeshLab2023.12-linux.tar.gz")

# mobaXterm
downloadsoftware("mobaXterm";
                 win = "https://download.mobatek.net/2422024061715901/MobaXterm_Installer_v24.2.zip")

# miniconda
downloadsoftware("Miniconda";
                 win = "https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe",
                 linux = "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh")

# msys2
downloadsoftware("MSYS2";
                 win = "https://github.com/msys2/msys2-installer/releases/download/2024-07-27/msys2-x86_64-20240727.exe")

# netcdf
downloadsource("NetCDF-C",
               "https://downloads.unidata.ucar.edu/netcdf-c/4.9.2/netcdf-c-4.9.2.tar.gz")
downloadsource("NetCDF-Fortran",
               "https://downloads.unidata.ucar.edu/netcdf-fortran/4.6.1/netcdf-fortran-4.6.1.tar.gz")

# fftw
downloadsource("FFTW3", "https://www.fftw.org/fftw-3.3.10.tar.gz")

# lapack
downloadsource("LAPACK",
               "https://github.com/Reference-LAPACK/lapack/archive/refs/tags/v3.12.0.tar.gz"; fnm="lapack-3.12.0.tar.gz")

# 7 zip
# vscode
# Obsidian
# Sumatra PDF
# tex studio
# zotero
# Paraview

@info "Done"
