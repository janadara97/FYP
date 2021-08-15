import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart' as geoCo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:search_map_place/search_map_place.dart';

class MapSearch extends StatefulWidget {
  const MapSearch({Key key}) : super(key: key);

  @override
  _MapSearchState createState() => _MapSearchState();
}

class _MapSearchState extends State<MapSearch> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  ///Get current location
  Geolocator geolocator = Geolocator();
  double latitude;
  double longitude;
  String address = "";

  String addressLocation;
  String country;
  String postalCode;

  String _address = "";

  Position position;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  // static const _cameraPosition =CameraPosition(
  //     target: LatLng(6.135520201939238, 80.19810725273825),
  //     zoom: 11.5,
  // );
  GoogleMapController _googleMapController;
  Marker _origin;
  Marker _destination;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //////////////////////App Bar
      appBar: AppBar(
        title: Text("Google Map"),
        centerTitle: false,
        actions: [
          if (_origin != null)
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.green,
                textStyle: TextStyle(fontWeight: FontWeight.w600),
              ),
              onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: _origin.position, zoom: 14.5, tilt: 50.0),
                ),
              ),
              child: Text("Origin"),
            ),
          if (_destination != null)
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.blue,
                textStyle: TextStyle(fontWeight: FontWeight.w600),
              ),
              onPressed: () => _googleMapController.animateCamera(
                  CameraUpdate.newCameraPosition(CameraPosition(
                      target: _origin.position, zoom: 14.5, tilt: 50.0))),
              child: Text("Des"),
            ),
        ],
      ),
      body: Container(
        child: Column(children: [
          Text("data"),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SizedBox(
              height: 600,
              child: GoogleMap(
                trafficEnabled: true,
                compassEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(position.latitude.toDouble(),
                      position.longitude.toDouble()),
                  zoom: 15.00,
                ),
                onMapCreated: (controller) => _googleMapController = controller,
                markers: Set<Marker>.of(markers.values),
                //     if(_origin != null)_origin,
                //     if(_destination != null)_destination,
                // },
                onLongPress: addMarker,
                onTap: (tapped) async {
                  // final coordinated =
                  //     new geoCo.Coordinates(tapped.latitude, tapped.longitude);
                  // getMarker(tapped.latitude, tapped.longitude);
                  // var address = await geoCo.Geocoder.local
                  //     .findAddressesFromCoordinates(coordinated);
                  // var firstAddress = address.first;

                  // Map<String, dynamic> data = {
                  //   "latitude": tapped.latitude,
                  //   'logitude': tapped.longitude,
                  //   'address': firstAddress.addressLine,
                  //   'Country ': firstAddress.countryName,
                  //   'postalcode': firstAddress.postalCode
                  // };
                  // await FirebaseFirestore.instance
                  //     .collection('location')
                  //     .add(data);
                  // setState(() {
                  //   country = firstAddress.countryName;
                  //   postalCode = firstAddress.postalCode;
                  //   addressLocation = firstAddress.addressLine;
                  // });

                  // Position position = await Geolocator.getCurrentPosition(
                  //     desiredAccuracy: LocationAccuracy.best);

                  final coordinated = new geoCo.Coordinates(tapped.latitude, tapped.longitude);
                  getMarker(tapped.latitude, tapped.longitude);
                  var address = await geoCo.Geocoder.local.findAddressesFromCoordinates(coordinated);
                  var firstAddress = address.first;

                  print(tapped.latitude);
                  print(tapped.longitude);


                  Map<String,dynamic> data={"latitude": tapped.latitude,'logitude' : tapped.longitude,'address' : firstAddress.addressLine,'Country ' : firstAddress.countryName,'postalcode': firstAddress.postalCode };
                  await FirebaseFirestore.instance.collection('location').add(data);
                  setState(() {

                    country=firstAddress.countryName;

                    postalCode=firstAddress.postalCode;
                    addressLocation=firstAddress.addressLine;
                  });
                  print(country);
                  print(postalCode);
                  print(addressLocation);

                  ///Here you have choose level of distance
                  ///latitude = position.latitude.toString() ?? '';
                 // longitude = position.longitude;
                  // latitude = position.latitude;
                  // longitude = position.longitude.toString() ?? '';
                  // var placemarks = await  placemarkFromCoordinates(
                  //     position.latitude, position.longitude);

                  // final coorinated=new geoCo.Coordinates(tapped.latitude, tapped.longitude);
                  // print(coorinated);
                  // var placemarks = await geoCo.Geocoder.local.findAddressesFromCoordinates(coorinated) ;
                  // print("Place$placemarks");
                  // address =
                  //     '${placemarks.first.featureName.isNotEmpty ? placemarks.first.featureName + ', ' : ''}${placemarks.first.thoroughfare.isNotEmpty ? placemarks.first.thoroughfare + ', ' : ''}${placemarks.first.subLocality.isNotEmpty ? placemarks.first.subLocality + ', ' : ''}${placemarks.first.locality.isNotEmpty ? placemarks.first.locality + ', ' : ''}${placemarks.first.subAdminArea.isNotEmpty ? placemarks.first.subAdminArea + ', ' : ''}${placemarks.first.postalCode.isNotEmpty ? placemarks.first.postalCode + ', ' : ''}${placemarks.first.adminArea.isNotEmpty ? placemarks.first.adminArea : ''}';
                  // print("latitude" + latitude.toString());
                  // print("longitude" + longitude.toString());
                  // print("adreess" + address);
                },
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(CameraPosition(
                target: LatLng(position.latitude, position.longitude)))),
        child: Icon(Icons.center_focus_strong),
      ),
    );
  }

  void addMarker(LatLng pos) {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
            markerId: MarkerId("origin"),
            infoWindow: const InfoWindow(title: 'Origin'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            position: pos);
        _destination = null;
      });
    } else {
      setState(() {
        _destination = Marker(
            markerId: MarkerId("Destination"),
            infoWindow: const InfoWindow(title: 'Destination'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: pos);
      });
    }
  }

  void getMarker(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker _marker = Marker(
      markerId: markerId,
      position: LatLng(lat, long),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      infoWindow: InfoWindow(snippet: addressLocation),
    );
    setState(() {
      markers[markerId] = _marker;
    });
  }

  void getCurrentPosition() async {
    Position currentPosition =
        await GeolocatorPlatform.instance.getCurrentPosition();

    setState(() {
      position = currentPosition;
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }
}
