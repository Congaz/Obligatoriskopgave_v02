//
//  Model.swift
//  PersistenceBruus
//
//  Created by dmu mac 26 on 27/10/2022.
//

import Foundation

struct Wrapper: Codable {
    var features: [Earthquake]
}

struct Earthquake : Identifiable, Codable {
    let id = UUID().uuidString
    var properties: Property
    var geometry: Geometry

    struct Property : Codable {
        var mag: Double
        var place: String
        // milliseconds since the epoch UTC ( 1970-01-01T00:00:00.000Z)
        var time: Date
    }

    struct Geometry : Codable {
        var type: String
        var coordinates: [Double]
    }
    
}

/*
--- Data structure from Web API ---
{
  "type": "FeatureCollection",
  "metadata": {
    "generated": 1668070540000,
    "url": "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson",
    "title": "USGS All Earthquakes, Past Hour",
    "status": 200,
    "api": "1.10.3",
    "count": 6
  },
  "features": [
    {
      "type": "Feature",
      "properties": {
        "mag": 2.7,
        "place": "63 km S of Shungnak, Alaska",
        "time": 1668068943276, // MILLISECONDS SINCE EPOCH IN UTC
        "updated": 1668070489464,
        "tz": null,
        "url": "https://earthquake.usgs.gov/earthquakes/eventpage/ak022effonx3",
        "detail": "https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/ak022effonx3.geojson",
        "felt": 1,
        "cdi": 2.6,
        "mmi": null,
        "alert": null,
        "status": "automatic",
        "tsunami": 0,
        "sig": 112,
        "net": "ak",
        "code": "022effonx3",
        "ids": ",ak022effonx3,",
        "sources": ",ak,",
        "types": ",dyfi,origin,phase-data,",
        "nst": null,
        "dmin": null,
        "rms": 0.98,
        "gap": null,
        "magType": "ml",
        "type": "earthquake",
        "title": "M 2.7 - 63 km S of Shungnak, Alaska"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [
          -156.992, // LONGITUDE
          66.3218, // LATITUDE
          0
        ]
      },
      "id": "ak022effonx3"
    },
    {
      "type": "Feature",
      "properties": {
        "mag": 2.8,
        "place": "92 km NW of Elfin Cove, Alaska",
        "time": 1668068445004,
        "updated": 1668069946040,
        "tz": null,
        "url": "https://earthquake.usgs.gov/earthquakes/eventpage/ak022effmtp0",
        "detail": "https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/ak022effmtp0.geojson",
        "felt": null,
        "cdi": null,
        "mmi": null,
        "alert": null,
        "status": "automatic",
        "tsunami": 0,
        "sig": 121,
        "net": "ak",
        "code": "022effmtp0",
        "ids": ",us7000inqv,ak022effmtp0,",
        "sources": ",us,ak,",
        "types": ",origin,phase-data,",
        "nst": null,
        "dmin": null,
        "rms": 0.78,
        "gap": null,
        "magType": "ml",
        "type": "earthquake",
        "title": "M 2.8 - 92 km NW of Elfin Cove, Alaska"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [
          -137.4454,
          58.7928,
          2.4
        ]
      },
      "id": "ak022effmtp0"
    },
    {
      "type": "Feature",
      "properties": {
        "mag": 1.08,
        "place": "2km SE of Pacifica, CA",
        "time": 1668067982130,
        "updated": 1668069015529,
        "tz": null,
        "url": "https://earthquake.usgs.gov/earthquakes/eventpage/nc73803225",
        "detail": "https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/nc73803225.geojson",
        "felt": null,
        "cdi": null,
        "mmi": null,
        "alert": null,
        "status": "automatic",
        "tsunami": 0,
        "sig": 18,
        "net": "nc",
        "code": "73803225",
        "ids": ",nc73803225,",
        "sources": ",nc,",
        "types": ",nearby-cities,origin,phase-data,scitech-link,",
        "nst": 8,
        "dmin": 0.03152,
        "rms": 0.01,
        "gap": 141,
        "magType": "md",
        "type": "earthquake",
        "title": "M 1.1 - 2km SE of Pacifica, CA"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [
          -122.4663315,
          37.5999985,
          8.55
        ]
      },
      "id": "nc73803225"
    },
    {
      "type": "Feature",
      "properties": {
        "mag": 1.2,
        "place": "31 km NE of Four Mile Road, Alaska",
        "time": 1668067805556,
        "updated": 1668068084525,
        "tz": null,
        "url": "https://earthquake.usgs.gov/earthquakes/eventpage/ak022effklhr",
        "detail": "https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/ak022effklhr.geojson",
        "felt": null,
        "cdi": null,
        "mmi": null,
        "alert": null,
        "status": "automatic",
        "tsunami": 0,
        "sig": 22,
        "net": "ak",
        "code": "022effklhr",
        "ids": ",ak022effklhr,",
        "sources": ",ak,",
        "types": ",origin,phase-data,",
        "nst": null,
        "dmin": null,
        "rms": 0.76,
        "gap": null,
        "magType": "ml",
        "type": "earthquake",
        "title": "M 1.2 - 31 km NE of Four Mile Road, Alaska"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [
          -148.7126,
          64.829,
          7.5
        ]
      },
      "id": "ak022effklhr"
    },
    {
      "type": "Feature",
      "properties": {
        "mag": 1.96000004,
        "place": "22 km E of Honaunau-Napoopoo, Hawaii",
        "time": 1668067338460,
        "updated": 1668067668740,
        "tz": null,
        "url": "https://earthquake.usgs.gov/earthquakes/eventpage/hv73215197",
        "detail": "https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/hv73215197.geojson",
        "felt": null,
        "cdi": null,
        "mmi": null,
        "alert": null,
        "status": "automatic",
        "tsunami": 0,
        "sig": 59,
        "net": "hv",
        "code": "73215197",
        "ids": ",hv73215197,",
        "sources": ",hv,",
        "types": ",origin,phase-data,",
        "nst": 23,
        "dmin": null,
        "rms": 0.180000007,
        "gap": 48,
        "magType": "md",
        "type": "earthquake",
        "title": "M 2.0 - 22 km E of Honaunau-Napoopoo, Hawaii"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [
          -155.655334472656,
          19.4869995117188,
          -1.86000001430511
        ]
      },
      "id": "hv73215197"
    },
    {
      "type": "Feature",
      "properties": {
        "mag": 1.8,
        "place": "62 km W of Anchor Point, Alaska",
        "time": 1668067155357,
        "updated": 1668067667590,
        "tz": null,
        "url": "https://earthquake.usgs.gov/earthquakes/eventpage/ak022eff9ocp",
        "detail": "https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/ak022eff9ocp.geojson",
        "felt": null,
        "cdi": null,
        "mmi": null,
        "alert": null,
        "status": "automatic",
        "tsunami": 0,
        "sig": 50,
        "net": "ak",
        "code": "022eff9ocp",
        "ids": ",ak022eff9ocp,",
        "sources": ",ak,",
        "types": ",origin,phase-data,",
        "nst": null,
        "dmin": null,
        "rms": 1.63,
        "gap": null,
        "magType": "ml",
        "type": "earthquake",
        "title": "M 1.8 - 62 km W of Anchor Point, Alaska"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [
          -152.9434,
          59.7244,
          57
        ]
      },
      "id": "ak022eff9ocp"
    }
  ],
  "bbox": [
    -156.992,
    19.486999511719,
    -1.8600000143051,
    -122.4663315,
    66.3218,
    57
  ]
}
*/
