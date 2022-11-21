import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController{

  final RxDouble lat=0.0.obs;
  final RxDouble lng=0.0.obs;
  @override
  void onInit(){
    super.onInit();
    getUserLocation();
  }

  Future<void> getUserLocation() async{
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    location.enableBackgroundMode(enable: true);

   // _locationData = await location.getLocation();
    location.onLocationChanged.listen((LocationData currentLocation) {
      print(currentLocation);
      lat.value = currentLocation.latitude!;
      lng.value = currentLocation.longitude!;


      location.enableBackgroundMode(enable: true);
    });
  }

}