import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String LatitudeData = "";
  String LongitudeData = "";

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    final geoposition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      LatitudeData = geoposition.latitude.toString();
      LongitudeData = geoposition.longitude.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Geolocator App",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Text("Latitude Of Present Location Is : " + LatitudeData + " °"),
          Text("Longitude Of Present Location Is : " + LongitudeData + " °"),
        ],
      ),
    );
  }
}
