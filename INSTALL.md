## First steps
Source:

* [GraphHopper docs](https://github.com/graphhopper/graphhopper/blob/0.8/docs/core/quickstart-from-source.md)

### 1. Get GraphHopper
Clone GraphHopper's GitHub repository:
```
git clone git://github.com/graphhopper/graphhopper.git
```

### 2. Change to proper version
Change GraphHopper repository branch to the latest stable version:
```
cd graphhopper
git checkout 0.8
```

### 3. Download data
Get .pbf files of OpenStreetMap data for the desired region from [Geofabrik](http://download.geofabrik.de/):
```
wget http://download.geofabrik.de/europe/spain-latest.osm.pbf
```

### 4. Get Java enough memory
Allow Java to use enough memory to integrate the OpenStreetMap in GraphHopper:
```
export JAVA_OPTS="-Xmx3072M"
```

### 5. Config weightings
Copy `config-example.properties` file, rename it to `config.properties`, and change the line `prepare.chWeighting=fastest` for `prepare.chWeighting=fastest, shortest`.

### 5. Run GraphHopper with OpenStreetMap data
The first time graphhopper will import the OpenStreetMap data (may take a while):
```
./graphhopper.sh web spain-latest.osm.pbf
```

When the task is complete, you will have GraphHopper running locally in `http://localhost:8989`.
