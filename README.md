# rRoad

Get road distances and routes with R, GraphHopper and OpenStreetMap.

## Installation

Install rRoad within R with:
```r
devtools::github_install("mfontcada/rRoad")
```

And follow the installation instructions from the [INSTALL.md](INSTALL.md) file in this repository.

## Usage

After the installation process, you should be able to launch GraphHopper whenever you want from the command line with:
```
./graphhopper.sh web spain-latest.osm.pbf
```
Where `spain-latest.osm.pbf` should be the OpenStreetMap data file of your desired region.

With GraphHopper running, you can get results directly in R:
```r
pontevedra <- c(42.4338555, -8.6743651)
coruna <- c(43.3618728, -8.4301933)
roadRoute(from = pontevedra, to = coruna, weighting = "fastest", calc_points = FALSE)
```

## Credits

Made with [R](http://www.r-project.org/), [GraphHopper](https://graphhopper.com/) and [OpenStreetMap](http://www.openstreetmap.org/) data downloaded from [Geofabrik](http://download.geofabrik.de/).

Original idea: [Création d’une matrice de distances routières avec des outils et des données libres (1/2) | R Géomatique](https://rgeomatic.hypotheses.org/134) by Timothée Giraud. You should check his [OSRM R package](https://github.com/rCarto/osrm) for a more recent and better tool on this subject.
