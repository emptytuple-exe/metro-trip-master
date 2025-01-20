import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Trip Master';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StationDistanceCalculator(), // Correct the duplicate home
    );
  }
}

class Station {
  final String lineName;
  final int stationNumber;
  final int fromKGWA;
  final String stationName;

  Station(this.lineName, this.stationNumber, this.fromKGWA, this.stationName);

  @override
  String toString() => stationName;
}

class StationDistanceCalculator extends StatefulWidget {
  const StationDistanceCalculator({super.key});

  @override
  _StationDistanceCalculatorState createState() =>
      _StationDistanceCalculatorState();
}

class _StationDistanceCalculatorState extends State<StationDistanceCalculator> {
  final Map<String, Color> lineColors = {
    'Purple': Colors.purple,
    'Green': Color(0xff009c05),
  };

  final List<Station> _stations = [
    // ... Your l Station('Purple', 1, 22, 'Whitefield (Kadugodi) (WHTM)'),
    Station('Purple', 2, 21, 'Hopefarm Channasandra (UWVL)'),
    Station('Purple', 3, 20, 'Kadugodi Tree Park (KDGD)'),
    Station('Purple', 4, 19, 'Pattandur Agrahara (ITPL)'),
    Station('Purple', 5, 18, 'Nallurhalli (VDHP)'),
    Station('Purple', 6, 17, 'Satya Sai Hospital (SSHP)'),
    Station('Purple', 7, 16, 'Kundalahalli (KDNH)'),
    Station('Purple', 8, 15, 'Seetharama Palya (VWIA)'),
    Station('Purple', 9, 14, 'Hoodi (DKIA)'),
    Station('Purple', 10, 13, 'Garudacharapalya (GDCP)'),
    Station('Purple', 11, 12, 'Singayyappanapalya (MDVP)'),
    Station('Purple', 12, 11, 'Krishnarajapura (KRAM)'),
    Station('Purple', 13, 10, 'Benniganahalli (JTPM)'),
    Station('Purple', 14, 9, 'Baiyappanahalli (BYPL)'),
    Station('Purple', 15, 8, 'Swami Vivekananda Road (SVRD)'),
    Station('Purple', 16, 7, 'Indiranagar (IDN)'),
    Station('Purple', 17, 6, 'Halasuru (HLRU)'),
    Station('Purple', 18, 5, 'Trinity (TTY)'),
    Station('Purple', 19, 4, 'Mahatma Gandhi Road (MAGR)'),
    Station('Purple', 20, 3, 'Cubbon Park (CBPK)'),
    Station(
        'Purple', 21, 2, 'Dr. B. R. Ambedkar Station, Vidhana Soudha (VDSA)'),
    Station('Purple', 22, 1,
        'Sir M. Visveshwaraya Station, Central College (VSWA)'),
    Station('Purple', 23, 0, 'Nadaprabhu Kempegowda Station, Majestic (KGWA)'),
    Station(
        'Purple', 24, 1, 'Krantivira Sangolli Rayanna Railway Station (SRCS)'),
    Station('Purple', 25, 2, 'Magadi Road (MIRD)'),
    Station('Purple', 26, 3,
        'Sri Balagangadharanatha Swamiji Station, Hosahalli (HSLI)'),
    Station('Purple', 27, 4, 'Vijayanagar (VJN)'),
    Station('Purple', 28, 5, 'Attiguppe (AGPP)'),
    Station('Purple', 29, 6, 'Deepanjali Nagar (DJNR)'),
    Station('Purple', 30, 7, 'Mysuru Road (MYRD)'),
    Station('Purple', 31, 8, 'Pantarapalya Nayandahalli (NYHM)'),
    Station('Purple', 32, 9, 'Rajarajeshwari Nagar (RRRN)'),
    Station('Purple', 33, 10, 'Jnanabharathi (BGUC)'),
    Station('Purple', 34, 11, 'Pattanagere (PATG)'),
    Station('Purple', 35, 12, 'Kengeri Bus Terminal (MLSD)'),
    Station('Purple', 36, 13, 'Kengeri (KGIT)'),
    Station('Purple', 37, 14, 'Challaghatta (CLGA)'),
    Station('Green', 1, 16, 'Madavara'),
    Station('Green', 2, 15, 'Chikkabidarakallu'),
    Station('Green', 3, 14, 'Manjunathanagara'),
    Station('Green', 4, 13, 'Nagasandra (NGSA)'),
    Station('Green', 5, 12, 'Dasarahalli (DSH)'),
    Station('Green', 6, 11, 'Jalahalli (JLHL)'),
    Station('Green', 7, 10, 'Peenya Industry (PYID)'),
    Station('Green', 8, 9, 'Peenya (PEYA)'),
    Station('Green', 9, 8, 'Goraguntepalya (YPI)'),
    Station('Green', 10, 7, 'Yeshwanthpur (YPM)'),
    Station('Green', 11, 6, 'Sandal Soap Factory (SSFY)'),
    Station('Green', 12, 5, 'Mahalakshmi (MHLI)'),
    Station('Green', 13, 4, 'Rajajinagar (RJNR)'),
    Station('Green', 14, 3, 'Mahakavi Kuvempu Road (KVPR)'),
    Station('Green', 15, 2, 'Srirampura (SPRU)'),
    Station('Green', 16, 1, 'Mantri Square Sampige Road (SPGD)'),
    Station('Green', 17, 0, 'Nadaprabhu Kempegowda Station, Majestic (KGWA)'),
    Station('Green', 18, 1, 'Chickpete (CKPE)'),
    Station('Green', 19, 2, 'Krishna Rajendra Market (KRMT)'),
    Station('Green', 20, 3, 'National College (NLC)'),
    Station('Green', 21, 4, 'Lalbagh (LBGH)'),
    Station('Green', 22, 5, 'South End Circle (SECE)'),
    Station('Green', 23, 6, 'Jayanagar (JYN)'),
    Station('Green', 24, 7, 'Rashtreeya Vidyalaya Road (RVR)'),
    Station('Green', 25, 8, 'Banashankari (BSNK)'),
    Station('Green', 26, 9, 'Jaya Prakash Nagar (JPN)'),
    Station('Green', 27, 10, 'Yelachenahalli (PUTH)'),
    Station('Green', 28, 11, 'Konankunte Cross (APRC)'),
    Station('Green', 29, 12, 'Doddakallasandra (KLPK)'),
    Station('Green', 30, 13, 'Vajarahalli (VJRH)'),
    Station('Green', 31, 14, 'Thalaghattapura (TGTP)'),
    Station('Green', 32, 15, 'Silk Institute (APTS)'),

    // Add the rest of your stations here...ist of stations
  ];

  Station _selectedStation1 = Station('Purple', 27, 4, 'Vijayanagar (VJN)');
  Station _selectedStation2 = Station('Green', 27, 10, 'Yelachenahalli (PUTH)');
  String _result = '';
  String _time = '';
  String _waitingTime = '';
  String _directionA = '';
  String _directionB = '';

  @override
  void initState() {
    super.initState();
    _updateResult();
  }

  void _updateResult() {
    setState(() {
      int distance = 0;
      int travelTime = 0;

      _directionA = '';
      _directionB = '';
      _waitingTime = '';

      if (_selectedStation1.lineName == _selectedStation2.lineName) {
        distance =
            (_selectedStation1.stationNumber - _selectedStation2.stationNumber)
                .abs();
        travelTime = distance * 2;

        if (_selectedStation1.stationNumber < _selectedStation2.stationNumber) {
          _directionA = (_selectedStation1.lineName == 'Purple')
              ? 'Towards Challaghatta (Platform 2)'
              : 'Towards Silk Institute (Platform 2)';
        } else {
          _directionA = (_selectedStation1.lineName == 'Purple')
              ? 'Towards Whitefield Kadugodi (Platform 1)'
              : 'Towards Madavara (Platform 1)';
        }

        _waitingTime = '^+ waiting time at ${_selectedStation1.stationName}';
      } else {
        distance = _selectedStation1.fromKGWA + _selectedStation2.fromKGWA;
        travelTime = distance * 2;

        if (_selectedStation1.lineName == 'Purple') {
          _directionA = (_selectedStation1.stationNumber < 23)
              ? 'Towards Challaghatta (Platform 2) till Majestic'
              : 'Towards Whitefield Kadugodi (Platform 1) till Majestic';
        } else {
          _directionA = (_selectedStation1.stationNumber < 17)
              ? 'Towards Silk Institute (Platform 2) till Majestic'
              : 'Towards Madavara (Platform 1) till Majestic';
        }

        if (_selectedStation2.lineName == 'Purple') {
          _directionB = (_selectedStation2.stationNumber > 23)
              ? 'Towards Challaghatta (Platform 2) from Majestic'
              : 'Towards Whitefield Kadugodi (Platform 1) from Majestic';
        } else {
          _directionB = (_selectedStation2.stationNumber > 17)
              ? 'Towards Silk Institute (Platform 4) from Majestic'
              : 'Towards Madavara (Platform 3) from Majestic';
        }

        _waitingTime =
            '^ + waiting time at ${_selectedStation1.stationName} and at Majestic';
      }

      _time = travelTime > 60
          ? 'Time: ${(travelTime ~/ 60)}h ${(travelTime % 60)}m'
          : 'Time: $travelTime minutes^';

      _result = (distance > 1)
          ? 'Distance: $distance stations'
          : 'Distance: $distance station';
    });
  }

  void _switchStations() {
    setState(() {
      final temp = _selectedStation1;
      _selectedStation1 = _selectedStation2;
      _selectedStation2 = temp;
      _updateResult();
    });
  }

  Widget _styledStationText(String lineName, String stationName) {
    return Text(
      stationName,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: lineColors[lineName] ?? Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Master'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownSearch<Station>(
                items: _stations,
                selectedItem: _selectedStation1,
                onChanged: (Station? station) {
                  setState(() {
                    _selectedStation1 = station!;
                    _updateResult();
                  });
                },
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: 'Starting Station',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      color: _selectedStation1.lineName == 'Purple'
                          ? Colors.purple
                          : Color(0xff009c05),
                    ),
                  ),
                ),
                popupProps: PopupProps.menu(
                  showSearchBox: true,
                  itemBuilder: (context, station, isSelected) {
                    return ListTile(
                      title: _styledStationText(
                          station.lineName, station.stationName),
                    );
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.swap_vert, size: 30),
                onPressed: _switchStations,
                tooltip: 'Switch Stations',
              ),
              DropdownSearch<Station>(
                items: _stations,
                selectedItem: _selectedStation2,
                onChanged: (Station? station) {
                  setState(() {
                    _selectedStation2 = station!;
                    _updateResult();
                  });
                },
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: 'Destination Station',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      color: _selectedStation2.lineName == 'Purple'
                          ? Colors.purple
                          : Color(0xff009c05),
                    ),
                  ),
                ),
                popupProps: PopupProps.menu(
                  showSearchBox: true,
                  itemBuilder: (context, station, isSelected) {
                    return ListTile(
                      title: _styledStationText(
                          station.lineName, station.stationName),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                _result,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _time,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (_directionA.isNotEmpty)
                Text(
                  _directionA,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              if (_directionB.isNotEmpty)
                Text(
                  _directionB,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              Text(
                _waitingTime,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff898989),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

