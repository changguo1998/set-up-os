projectPath="/d/Research/Projects"
cd $projectPath
echo "Current dir: ${projectPath}"
prjs=(changguo1998.github.io
changguo1998
c-basic-library
SeisTools.jl
SeisTools_C
SeismicDatabaseManager.jl
focal-mechanism-inversion-sem
gc-research-assistant
NumericalSimulationFramework.jl
FMTools
LengthAreaVolume.jl
SeismicRayTrace.jl)

for p in ${prjs[@]}; do
    if [ ! -d $p ]; then
        echo ""
        echo ""
        echo "======================="
        echo "Clone $p"
        git clone git@github.com:changguo1998/${p}.git
    fi
done
