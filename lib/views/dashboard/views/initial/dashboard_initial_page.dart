import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hack10/views/dashboard/dashboard_page.dart';
import 'package:hack10/views/dashboard/model/scheduled_consultation.dart';
import 'package:hack10/views/dashboard/views/initial/scheduled_consultation_card.dart';
import 'package:latlong2/latlong.dart';



Future<Position> _determinePosition() async {


  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
  return position;
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  print('going to check if service is enabled');
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    print('service not enabled');
    return Future.error('Location services are disabled.');
  }

  print('going to check if permission is granted');
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

class DashboardInitialPage extends StatelessWidget {
  const DashboardInitialPage({super.key});


  @override
  Widget build(BuildContext context) {
    return DashboardPage(
        body: Column(children: [
          for(ScheduledConsultation consultation in [
      ScheduledConsultation(date: DateTime(2024, 08, 28, 14, 0)),
      ScheduledConsultation(date: DateTime(2024, 09, 28, 14, 0)),
          ])
      Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: ScheduledConsultationCard(
          scheduledConsultation:
              ScheduledConsultation(date: DateTime(2024, 08, 28, 14, 0)),
        ),
      ),

          true ? Container(
            width: 400,
            height: 400,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(51.509364, -0.128928), // Center the map over London
                initialZoom: 9.2,
              ),
              children: [
                TileLayer( // Bring your own tiles
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
                  userAgentPackageName: 'com.example.app', // Add your app identifier
                  // And many more recommended properties!
                ),
              ],
            ),
          ) :
          FutureBuilder<Position>(
            future: _determinePosition(),
            builder: (context, snapshot) {
              if(snapshot.hasData == false) {
                return const CircularProgressIndicator();
              }

              return Container(
                width: 400,
                height: 400,
                child: false ?
                FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(snapshot.data!.latitude, snapshot.data!.longitude), // Center the map over London
                    initialZoom: 9.2,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      maxZoom: 19,
                    ),
                    CurrentLocationLayer(),
                  ],
                )
                    :FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(51.509364, -0.128928), // Center the map over London
                    initialZoom: 9.2,
                  ),
                  children: [
                    TileLayer( // Bring your own tiles
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
                      userAgentPackageName: 'com.example.app', // Add your app identifier
                      // And many more recommended properties!
                    ),
                  ],
                ),
              );
            }
          )


    ]));
  }
}
