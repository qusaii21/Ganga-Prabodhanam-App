import 'package:flutter/material.dart';
import 'package:flutter_application_3/splash.dart';
import 'package:flutter_application_3/waterqualitypage.dart';
import 'package:flutter_application_3/weatherpage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(SplashScreenApp());
}

class SplashScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Ganga River Map',
      home: SplashScreen(), // Start with the SplashScreen
    );
  }
}

class GangaRiverMap extends StatefulWidget {
  @override
  _GangaRiverMapState createState() => _GangaRiverMapState();
}

class _GangaRiverMapState extends State<GangaRiverMap> {
  GoogleMapController? mapController;
  bool showButtons = false; // Control visibility of the buttons
  String selectedStation = ''; // Store the name of the selected station
  String searchQuery = '';
  String selectedWQICategory = '';

  final LatLng _initialPosition = LatLng(27.7, 83.0); // Center of Ganga River
  final double _initialZoom = 5.0;

  final Map<String, String> stationWQICategory = {
    
    'GANGA AT DIAMOND HARBOUR': 'Excellent',
    'GANGA AT ULUBERIA': 'Good',
    'GANGA AT GARDEN REACH': 'Average',
    'GANGA AT HOWRAH-SHIVPUR': 'Fair',
    'GANGA AT DAKSHMINESHWAR': 'Poor',
    'GANGA AT SERAMPORE': 'Excellent',
    'GANGA AT PALTA': 'Good',
    'TRIBENI ON GANGA': 'Average',
    'NABADIP ON GANGA': 'Fair',
    'GANGA AT BAHARAMPORE': 'Poor',
    'RIVER GANGA AT SANGI DALAN': 'Excellent',
    'RIVER GANGA D/S NEAR JANTA GHAT': 'Good',
    'RIVER GANGA U/S NEAR LCT GHAT': 'Average',
    'RIVER GANGA D/S NEAR CREMATION GHAT': 'Fair',
    'GANGA AT KAHALGAON': 'Poor',
    'GANGA AT U/S BHAGALPUR': 'Excellent',
    'GANGA RIVER AT WATER INTAKE POINT, BHAGALPUR': 'Good',
    'GANGA RIVER AT BHAGALPUR': 'Average',
    'RIVER GANGA AT CHAMPANAGAR, BHAGALPUR': 'Fair',
    'GANGA AT SULTANGANJ, BHAGALPUR': 'Poor',
    'GANGA AT U/S SULTANGANJ, BHAGALPUR': 'Excellent',
    'GANGA AT U/S MUNGER': 'Good',
    'GANGA RIVER AT BARAHIYA': 'Average',
    'GANGA AT MOKAMA (D/S)': 'Fair',
    'GANGA AT MOKAMA (U/S)': 'Poor',
    'RIVER GANGA AT U/S BARAHPUR BINDTOLI': 'Excellent',
    'GANGA RIVER AT BARH': 'Good',
    'BAKHTIYARPUR-TAJPUR BRIDGE ON GANGA': 'Average',
    'GANGA AT KEWALA GHAT, FATUHA': 'Fair',
    'RIVER GANGA AT TRIVENI GHAT, PATNA': 'Poor',
    'RIVER AT KACHCHI-DARGAH-BIDUPUR ROAD BRIDGE, PATNA': 'Excellent',
    'GANGA AT MALSALAMI, PATNA': 'Good',
    'GANGA AT PATNA D/S (GANGA BRIDGE)': 'Average',
    'GANGA AT GULABI GHAT, PATNA': 'Fair',
    'GANGA AT GANDHIGHAT, NIT PATNA': 'Poor',
    'GANGA NEAR DANAPUR (NEAR PIPA PUL)': 'Excellent',
    'GANGA AT MAA AMBIKA ASTHAN, AAMI, SARAN': 'Good',
    'GANGA AT THE CONFLUENCE OF SONE RIVER DORIGANJ, CHAPRA': 'Average',
    'GANGA AT ARA-CHAPRA ROAD BRIDGE': 'Fair',
    'GANGA AT D/S BUXAR NEAR ROAD BRIDGE': 'Poor',
    'GANGA AT BUXAR, RAMREKHAGHAT': 'Excellent',
    'GANGA AT BEHRAMPORE': 'Good',
    'GANGA AT U/S JAIL GHAT, BUXAR': 'Average',
    'GANGA AT MANJHIGHAT (BIHAR)': 'Fair',
    'GANGA AT TARIGHAT GHAZIPUR (U.P.)': 'Poor',
    'RIVER GANGA AT CHUNAR': 'Excellent',
    'GANGA AT D/S, MIRZAPUR': 'Good',
    'GANGA U/S, VINDHYACHAL, MIRZAPUR': 'Average',
    'RIVER GANGA A/C TAMSA RIVER, SIRSA, SON BARSA': 'Fair',
    'GANGA AT KADAGHAT, ALLAHABAD': 'Poor',
    'GANGA AT KALA KANKAR, RAEBARELI': 'Excellent',
    'GANGA AT DALMAU (RAI BAREILLY), U.P.': 'Good',
    'RIVER GANGA AT BATHING GHAT (JAJMAU BRIDGE)': 'Average',
    'GANGA AT BITHOOR (KANPUR), U.P.': 'Fair',
    'RIVER GANGA AT FARRUKABAD': 'Poor',
    'GANGA AT KACHHLA GHAT, ALIGARH': 'Excellent',
    'GANGA AT NARORA (BULANDSAHAR), U.P.': 'Good',
    'GANGA AT U/S, ANOOPSHAHAR': 'Average',
    'GANGA AT GHARMUKTESHWAR': 'Fair',
    'GANGA AT BIJNOR (U.P.)': 'Poor',
    'RIVER GANGA AT MADHYA GANGA BARRAGE, BIJNOR': 'Excellent',
    'GANGA AT SULTANPUR (UTTARAKHAND)': 'Good',
    'UPPER GANGA CANAL D/S ROORKEE, HARIDWAR': 'Average',
    'RIVER GANGA AT HAR-KI-PAURI GHAT': 'Fair',
    'GANGA RIVER AFTER CONFLUENCE OF RIVER SONG': 'Poor',
    'RIVER GANGA D/S RISHIKESH': 'Excellent',
};

  

  final List<Map<String, dynamic>> stations = [
       {'name': 'GANGA AT PATIKALI NEAR DURGA CHAK', 'position': LatLng(22.066481, 88.068869)},
    {'name': 'GANGA AT DIAMOND HARBOUR', 'position': LatLng(22.183383, 88.193783)},
    {'name': 'GANGA AT ULUBERIA', 'position': LatLng(22.453473, 88.115051)},
    {'name': 'GANGA AT GARDEN REACH', 'position': LatLng(22.549717, 88.296125)},
    {'name': 'GANGA AT HOWRAH-SHIVPUR', 'position': LatLng(22.558292, 88.324394)},
    {'name': 'GANGA AT DAKSHMINESHWAR', 'position': LatLng(22.653061, 88.357589)},
    {'name': 'GANGA AT SERAMPORE', 'position': LatLng(22.761306, 88.340319)},
    {'name': 'GANGA AT PALTA', 'position': LatLng(22.774972, 88.334278)},
    {'name': 'TRIBENI ON GANGA', 'position': LatLng(22.984402, 88.401972)},
    {'name': 'NABADIP ON GANGA', 'position': LatLng(23.386728, 88.364884)},
    {'name': 'GANGA AT BAHARAMPORE', 'position': LatLng(24.100312, 88.244054)},
    {'name': 'RIVER GANGA AT SANGI DALAN', 'position': LatLng(25.05634, 87.83515)},
    {'name': 'RIVER GANGA D/S NEAR JANTA GHAT', 'position': LatLng(25.210819, 87.769721)},
    {'name': 'RIVER GANGA U/S NEAR LCT GHAT', 'position': LatLng(25.292498, 87.63183)},
    {'name': 'RIVER GANGA D/S NEAR CREMATION GHAT', 'position': LatLng(25.31074, 83.014205)},
    {'name': 'GANGA AT KAHALGAON', 'position': LatLng(25.267334, 87.227318)},
    {'name': 'GANGA AT U/S BHAGALPUR', 'position': LatLng(25.271603, 87.025665)},
    {'name': 'GANGA RIVER AT WATER INTAKE POINT, BHAGALPUR', 'position': LatLng(25.257757, 86.978188)},
    {'name': 'GANGA RIVER AT BHAGALPUR', 'position': LatLng(25.254387, 86.948424)},
    {'name': 'RIVER GANGA AT CHAMPANAGAR, BHAGALPUR', 'position': LatLng(25.242256, 86.925987)},
    {'name': 'GANGA AT SULTANGANJ, BHAGALPUR', 'position': LatLng(25.257511, 86.747053)},
    {'name': 'GANGA AT U/S SULTANGANJ, BHAGALPUR', 'position': LatLng(25.252575, 86.725558)},
    {'name': 'GANGA AT U/S MUNGER', 'position': LatLng(25.368174, 86.464302)},
    {'name': 'GANGA RIVER AT BARAHIYA', 'position': LatLng(25.315313, 86.029821)},
    {'name': 'GANGA AT MOKAMA (D/S)', 'position': LatLng(25.381441, 85.987169)},
    {'name': 'GANGA AT MOKAMA (U/S)', 'position': LatLng(25.401104, 85.923198)},
    {'name': 'RIVER GANGA AT U/S BARAHPUR BINDTOLI', 'position': LatLng(25.586863, 84.693046)},
    {'name': 'GANGA RIVER AT BARH', 'position': LatLng(25.487275, 85.705236)},
    {'name': 'BAKHTIYARPUR-TAJPUR BRIDGE ON GANGA', 'position': LatLng(25.655635, 85.096308)},
    {'name': 'GANGA AT KEWALA GHAT, FATUHA', 'position': LatLng(25.511611, 85.307417)},
    {'name': 'RIVER GANGA AT TRIVENI GHAT, PATNA', 'position': LatLng(25.515132, 85.301372)},
    {'name': 'RIVER AT KACHCHI-DARGAH-BIDUPUR ROAD BRIDGE, PATNA', 'position': LatLng(25.548238, 85.279377)},
    {'name': 'GANGA AT MALSALAMI, PATNA', 'position': LatLng(25.557806, 85.275648)},
    {'name': 'GANGA AT PATNA D/S (GANGA BRIDGE)', 'position': LatLng(25.613753, 85.204131)},
    {'name': 'GANGA AT GULABI GHAT, PATNA', 'position': LatLng(25.620356, 85.179995)},
    {'name': 'GANGA AT GANDHIGHAT, NIT PATNA', 'position': LatLng(25.622179, 85.172816)},
    {'name': 'GANGA NEAR DANAPUR (NEAR PIPA PUL)', 'position': LatLng(25.588972, 83.985861)},
    {'name': 'GANGA AT MAA AMBIKA ASTHAN, AAMI, SARAN', 'position': LatLng(25.740235, 84.963161)},
    {'name': 'GANGA AT THE CONFLUENCE OF SONE RIVER DORIGANJ, CHAPRA', 'position': LatLng(25.708441, 84.889727)},
    {'name': 'GANGA AT ARA-CHAPRA ROAD BRIDGE', 'position': LatLng(25.68032, 84.785773)},
    {'name': 'GANGA AT D/S BUXAR NEAR ROAD BRIDGE', 'position': LatLng(25.588972, 83.985861)},
    {'name': 'GANGA AT BUXAR, RAMREKHAGHAT', 'position': LatLng(25.576142, 83.970428)},
    {'name': 'GANGA AT BEHRAMPORE', 'position': LatLng(24.100312, 88.244054)},
    {'name': 'GANGA AT U/S JAIL GHAT, BUXAR', 'position': LatLng(25.484321, 85.668239)},
    {'name': 'GANGA AT MANJHIGHAT (BIHAR)', 'position': LatLng(25.744119, 84.676765)},
    {'name': 'GANGA AT TARIGHAT GHAZIPUR (U.P.)', 'position': LatLng(25.577156, 83.584219)},
    {'name': 'RIVER GANGA AT CHUNAR', 'position': LatLng(25.129278, 82.877278)},
    {'name': 'GANGA AT D/S, MIRZAPUR', 'position': LatLng(25.177058, 82.602225)},
    {'name': 'GANGA U/S, VINDHYACHAL, MIRZAPUR', 'position': LatLng(25.244031, 82.418272)},
    {'name': 'RIVER GANGA A/C TAMSA RIVER, SIRSA, SON BARSA', 'position': LatLng(25.259363, 82.096478)},
    {'name': 'GANGA AT KADAGHAT, ALLAHABAD', 'position': LatLng(25.443124, 81.887148)},
    {'name': 'GANGA AT KALA KANKAR, RAEBARELI', 'position': LatLng(25.774293, 81.382673)},
    {'name': 'GANGA AT DALMAU (RAI BAREILLY), U.P.', 'position': LatLng(26.074386, 81.024075)},
    {'name': 'RIVER GANGA AT BATHING GHAT (JAJMAU BRIDGE)', 'position': LatLng(26.434322, 80.408587)},
    {'name': 'GANGA AT BITHOOR (KANPUR), U.P.', 'position': LatLng(26.610906, 80.275419)},
    {'name': 'RIVER GANGA AT FARRUKABAD', 'position': LatLng(27.398639, 79.627389)},
    {'name': 'GANGA AT KACHHLA GHAT, ALIGARH', 'position': LatLng(27.927803, 78.866289)},
    {'name': 'GANGA AT NARORA (BULANDSAHAR), U.P.', 'position': LatLng(28.1897, 78.395878)},
    {'name': 'GANGA AT U/S, ANOOPSHAHAR', 'position': LatLng(28.364396, 78.270269)},
    {'name': 'GANGA AT GHARMUKTESHWAR', 'position': LatLng(28.802444, 78.128722)},
    {'name': 'GANGA AT BIJNOR (U.P.)', 'position': LatLng(29.373164, 78.036474)},
    {'name': 'RIVER GANGA AT MADHYA GANGA BARRAGE, BIJNOR', 'position': LatLng(29.373468, 78.040547)},
    {'name': 'GANGA AT SULTANPUR (UTTARAKHAND)', 'position': LatLng(29.640072, 78.103486)},
    {'name': 'UPPER GANGA CANAL D/S ROORKEE, HARIDWAR', 'position': LatLng(29.851669, 77.879742)},
    {'name': 'RIVER GANGA AT HAR-KI-PAURI GHAT', 'position': LatLng(29.943552, 78.166796)},
    {'name': 'GANGA RIVER AFTER CONFLUENCE OF RIVER SONG', 'position': LatLng(30.019619, 78.22939)},
    {'name': 'RIVER GANGA D/S RISHIKESH', 'position': LatLng(30.0305, 78.245833)},
  ];

  late final List<Marker> _markers = stations.map((station) {
    return Marker(
      markerId: MarkerId(station['name']),
      position: station['position'],
      infoWindow: InfoWindow(
        title: station['name'],
        snippet: 'Lat: ${station['position'].latitude}, Lng: ${station['position'].longitude}',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(_getMarkerColor(station['name'])),
      onTap: () {
        _onMarkerTapped(station['name']);
      },
    );
  }).toList();

  void _onMarkerTapped(String stationName) {
    setState(() {
      selectedStation = stationName;
      showButtons = true; // Show buttons when a marker is tapped
    });
  }

  double _getMarkerColor(String stationName) {
    if (selectedWQICategory.isNotEmpty && stationWQICategory[stationName] == selectedWQICategory) {
      return BitmapDescriptor.hueBlue; // Highlighted color for selected category
    }
    return BitmapDescriptor.hueRed; // Default color
  }

  void _updateMarkers() {
    setState(() {
      _markers.clear();
      _markers.addAll(stations.map((station) {
        return Marker(
          markerId: MarkerId(station['name']),
          position: station['position'],
          infoWindow: InfoWindow(
            title: station['name'],
            snippet: 'Lat: ${station['position'].latitude}, Lng: ${station['position'].longitude}',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(_getMarkerColor(station['name'])),
          onTap: () {
            _onMarkerTapped(station['name']);
          },
        );
      }).toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ganga River Stations'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Station',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value.toLowerCase();
                        _updateMarkers();
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedWQICategory.isEmpty ? null : selectedWQICategory,
                  hint: Text('WQI Category'),
                  items: <String>['Excellent', 'Good', 'Average', 'Fair', 'Poor']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedWQICategory = newValue!;
                      _updateMarkers();
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: _initialZoom,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  markers: Set<Marker>.of(_markers.where((marker) {
                    return searchQuery.isEmpty ||
                        marker.markerId.value.toLowerCase().contains(searchQuery);
                  })),
                ),
                if (showButtons) ...[
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showButtons = false;
                        });
                      },
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 90),
                    child: Text(
                      selectedStation,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) =>
                                    WaterQualityPage(stationName: selectedStation),
                              ),
                            );
                          },
                          icon: Icon(Icons.water_drop_outlined, color: Colors.blueAccent),
                          label: Text(
                            'Water Quality',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffFFC700),
                            minimumSize: Size(200, 60),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) =>
                                    Weather(stationName: selectedStation),
                              ),
                            );
                          },
                          icon: Icon(Icons.cloud_outlined, color: Colors.blueAccent),
                          label: Text(
                            'Weather',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffFFC700),
                            minimumSize: Size(200, 60),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}