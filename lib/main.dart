import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:dropdown_search/dropdown_search.dart';
=======
>>>>>>> 651a9e80e72e9ca95e36ae3af24c8f2fb3dc6ba1

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
<<<<<<< HEAD
  static const String _title = 'Trip Master';

=======
  static const String _title = 'Flutter Stateful Clicker Counter';
  // This widget is the root of your application.
>>>>>>> 651a9e80e72e9ca95e36ae3af24c8f2fb3dc6ba1
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
<<<<<<< HEAD
        primarySwatch: Colors.blue,
      ),
      home: const StationDistanceCalculator(),
=======
        // useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
>>>>>>> 651a9e80e72e9ca95e36ae3af24c8f2fb3dc6ba1
    );
  }
}

<<<<<<< HEAD
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
  // Color map for line names
  final Map<String, Color> lineColors = {
    'Purple': Colors.purple,
    'Green': Color(0xff009c05),
  };

  final List<Station> _stations = [
    Station('Purple', 1, 22, 'Whitefield (Kadugodi) (WHTM)'),
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

    // Add the rest of your stations here...
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
    _updateResult(); // Call this method to initialize the results
  }

  void _updateResult() {
    setState(() {
      int distance = 0;
      int travelTime = 0;

      // Reset directions
      _directionA = '';
      _directionB = '';
      _waitingTime = '';

      if (_selectedStation1.lineName == _selectedStation2.lineName) {
        // Same Line Travel
        distance =
            (_selectedStation1.stationNumber - _selectedStation2.stationNumber)
                .abs();
        travelTime = distance * 2;

        // Determine direction
        if (_selectedStation1.stationNumber < _selectedStation2.stationNumber) {
          _directionA = (_selectedStation1.lineName == 'Purple')
              ? 'Towards Challaghatta (Platform 2)'
              : 'Towards Silk Institute (Platform 2)';
        } else {
          _directionA = (_selectedStation1.lineName == 'Purple')
              ? 'Towards Whitefield Kadugodi (Platform 1)'
              : 'Towards Madavara (Platform 1)';
        }

        // Waiting time
        _waitingTime = '^+ waiting time at ${_selectedStation1.stationName}';
      } else {
        // Different Line Travel (Via Majestic)
        distance = _selectedStation1.fromKGWA + _selectedStation2.fromKGWA;
        travelTime = distance * 2;

        // Directions for first part (to Majestic)
        if (_selectedStation1.lineName == 'Purple') {
          _directionA = (_selectedStation1.stationNumber < 23)
              ? 'Towards Challaghatta (Platform 2) till Majestic'
              : 'Towards Whitefield Kadugodi (Platform 1) till Majestic';
        } else {
          _directionA = (_selectedStation1.stationNumber < 17)
              ? 'Towards Silk Institute (Platform 2) till Majestic'
              : 'Towards Madavara (Platform 1) till Majestic';
        }

        // Directions for second part (from Majestic)
        if (_selectedStation2.lineName == 'Purple') {
          _directionB = (_selectedStation2.stationNumber > 23)
              ? 'Towards Challaghatta (Platform 2) from Majestic'
              : 'Towards Whitefield Kadugodi (Platform 1) from Majestic';
        } else {
          _directionB = (_selectedStation2.stationNumber > 17)
              ? 'Towards Silk Institute (Platform 4) from Majestic'
              : 'Towards Madavara (Platform 3) from Majestic';
        }

        // Waiting time
        _waitingTime =
            '^ + waiting time at ${_selectedStation1.stationName} and at Majestic';
      }

      // Time formatting
      _time = travelTime > 60
          ? 'Time: ${(travelTime ~/ 60)}h ${(travelTime % 60)}m'
          : 'Time: $travelTime minutes^';

      // Distance formatting
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
=======
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state.
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Flutter Demo Click Counter'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
>>>>>>> 651a9e80e72e9ca95e36ae3af24c8f2fb3dc6ba1
    );
  }
}
