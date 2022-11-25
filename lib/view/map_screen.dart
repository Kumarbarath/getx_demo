import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapScreen extends StatefulWidget {

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late List<MapLatLng> polygon;

  @override
  void initState() {


    polygon = [
      MapLatLng(38.8026, -116.4194),
      MapLatLng(46.8797, -110.3626),
      MapLatLng(41.8780, -93.0977),
    ];


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfMaps(

        layers: [
          MapTileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            sublayers: [
              MapPolygonLayer(
                  polygons: Set.of([MapPolygon(
                      points: polygon,
                      color: Colors.blue[200],
                      strokeColor: Colors.blue[900],
                      strokeWidth: 4,
                  )
                  ])
              ),
            ],
            initialZoomLevel: 3,
            zoomPanBehavior: MapZoomPanBehavior(
              enableDoubleTapZooming: true
            ),
            initialFocalLatLng: MapLatLng(39.0119, -98.4842),
          ),
        ]
    );
  }
}
