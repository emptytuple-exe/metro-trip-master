//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const MyApp(),
      ),
    );

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  ThemeData get themeData => _isDarkMode
      ? ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.grey[900],
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blueGrey,
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
            bodyLarge: TextStyle(color: Colors.white),
            labelLarge: TextStyle(color: Colors.white),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[700]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[700]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[300]!),
            ),
            labelStyle: TextStyle(color: Colors.grey[400]),
          ),
        )
      : ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.black),
            bodyLarge: TextStyle(color: Colors.black),
            labelLarge: TextStyle(color: Colors.black),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        );

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Trip Master';

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: _title,
          theme: themeProvider.themeData,
          home: const StationDistanceCalculator(),
        );
      },
    );
  }
}

class Station {
  final String lineName;
  final int stationNumber;
  final int
      fromKGWA; // For Purple/Green this is distance from KGWA; for Yellow this stores distance from RVR
  final String stationName;
  final int fromRVR;

  Station(this.lineName, this.stationNumber, this.fromKGWA, this.fromRVR,
      this.stationName);

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
    'Green': const Color(0xff009c05),
    'Yellow': const Color(0xffb49900), // Yellow as requested (#f2f23f)
  };

  final List<Station> _stations = [
    // Purple (full list from your reference)
    Station('Purple', 1, 22, 30, 'Whitefield (Kadugodi) (WHTM)'),
    Station('Purple', 2, 21, 29, 'Hopefarm Channasandra (UWVL)'),
    Station('Purple', 3, 20, 28, 'Kadugodi Tree Park (KDGD)'),
    Station('Purple', 4, 19, 26, 'Pattandur Agrahara (ITPL)'),
    Station('Purple', 5, 18, 25, 'Nallurhalli (VDHP)'),
    Station('Purple', 6, 17, 24, 'Satya Sai Hospital (SSHP)'),
    Station('Purple', 7, 16, 23, 'Kundalahalli (KDNH)'),
    Station('Purple', 8, 15, 22, 'Seetharama Palya (VWIA)'),
    Station('Purple', 9, 14, 21, 'Hoodi (DKIA)'),
    Station('Purple', 10, 13, 20, 'Garudacharapalya (GDCP)'),
    Station('Purple', 11, 12, 19, 'Singayyappanapalya (MDVP)'),
    Station('Purple', 12, 11, 18, 'Krishnarajapura (KRAM)'),
    Station('Purple', 13, 10, 17, 'Benniganahalli (JTPM)'),
    Station('Purple', 14, 9, 16, 'Baiyappanahalli (BYPL)'),
    Station('Purple', 15, 8, 15, 'Swami Vivekananda Road (SVRD)'),
    Station('Purple', 16, 7, 14, 'Indiranagar (IDN)'),
    Station('Purple', 17, 6, 13, 'Halasuru (HLRU)'),
    Station('Purple', 18, 5, 12, 'Trinity (TTY)'),
    Station('Purple', 19, 4, 11, 'Mahatma Gandhi Road (MAGR)'),
    Station('Purple', 20, 3, 10, 'Cubbon Park (CBPK)'),
    Station('Purple', 21, 2, 9,
        'Dr. B. R. Ambedkar Station, Vidhana Soudha (VDSA)'),
    Station('Purple', 22, 1, 8,
        'Sir M. Visveshwaraya Station, Central College (VSWA)'),
    Station(
        'Purple', 23, 0, 7, 'Nadaprabhu Kempegowda Station, Majestic (KGWA)'),
    Station('Purple', 24, 1, 8,
        'Krantivira Sangolli Rayanna Railway Station (SRCS)'),
    Station('Purple', 25, 2, 9, 'Magadi Road (MIRD)'),
    Station('Purple', 26, 3, 10,
        'Sri Balagangadharanatha Swamiji Station, Hosahalli (HSLI)'),
    Station('Purple', 27, 4, 11, 'Vijayanagar (VJN)'),
    Station('Purple', 28, 5, 12, 'Attiguppe (AGPP)'),
    Station('Purple', 29, 6, 13, 'Deepanjali Nagar (DJNR)'),
    Station('Purple', 30, 7, 14, 'Mysuru Road (MYRD)'),
    Station('Purple', 31, 8, 15, 'Pantarapalya Nayandahalli (NYHM)'),
    Station('Purple', 32, 9, 16, 'Rajarajeshwari Nagar (RRRN)'),
    Station('Purple', 33, 10, 17, 'Jnanabharathi (BGUC)'),
    Station('Purple', 34, 11, 18, 'Pattanagere (PATG)'),
    Station('Purple', 35, 12, 19, 'Kengeri Bus Terminal (MLSD)'),
    Station('Purple', 36, 13, 20, 'Kengeri (KGIT)'),
    Station('Purple', 37, 14, 21, 'Challaghatta (CLGA)'),

    // Green (full list)
    Station('Green', 1, 16, 23, 'Madavara (BIEC)'),
    Station('Green', 2, 15, 22, 'Chikkabidarakallu(JIDL)'),
    Station('Green', 3, 14, 21, 'Manjunathanagara (MNJN)'),
    Station('Green', 4, 13, 20, 'Nagasandra (NGSA)'),
    Station('Green', 5, 12, 19, 'Dasarahalli (DSH)'),
    Station('Green', 6, 11, 18, 'Jalahalli (JLHL)'),
    Station('Green', 7, 10, 17, 'Peenya Industry (PYID)'),
    Station('Green', 8, 9, 16, 'Peenya (PEYA)'),
    Station('Green', 9, 8, 15, 'Goraguntepalya (YPI)'),
    Station('Green', 10, 7, 14, 'Yeshwanthpur (YPM)'),
    Station('Green', 11, 6, 13, 'Sandal Soap Factory (SSFY)'),
    Station('Green', 12, 5, 12, 'Mahalakshmi (MHLI)'),
    Station('Green', 13, 4, 11, 'Rajajinagar (RJNR)'),
    Station('Green', 14, 3, 10, 'Mahakavi Kuvempu Road (KVPR)'),
    Station('Green', 15, 2, 9, 'Srirampura (SPRU)'),
    Station('Green', 16, 1, 8, 'Mantri Square Sampige Road (SPGD)'),
    Station(
        'Green', 17, 0, 7, 'Nadaprabhu Kempegowda Station, Majestic (KGWA)'),
    Station('Green', 18, 1, 6, 'Chickpete (CKPE)'),
    Station('Green', 19, 2, 5, 'Krishna Rajendra Market (KRMT)'),
    Station('Green', 20, 3, 4, 'National College (NLC)'),
    Station('Green', 21, 4, 3, 'Lalbagh (LBGH)'),
    Station('Green', 22, 5, 2, 'South End Circle (SECE)'),
    Station('Green', 23, 6, 1, 'Jayanagar (JYN)'),
    Station('Green', 24, 7, 0, 'Rashtreeya Vidyalaya Road (RVR)'),
    Station('Green', 25, 8, 1, 'Banashankari (BSNK)'),
    Station('Green', 26, 9, 2, 'Jaya Prakash Nagar (JPN)'),
    Station('Green', 27, 10, 3, 'Yelachenahalli (PUTH)'),
    Station('Green', 28, 11, 4, 'Konankunte Cross (APRC)'),
    Station('Green', 29, 12, 5, 'Doddakallasandra (KLPK)'),
    Station('Green', 30, 13, 6, 'Vajarahalli (VJRH)'),
    Station('Green', 31, 14, 7, 'Thalaghattapura (TGTP)'),
    Station('Green', 32, 15, 8, 'Silk Institute (APTS)'),

    // Yellow Line (distances stored as fromRVR in the fromKGWA field)
    Station('Yellow', 1, 7, 0,
        'Rashtreeya Vidyalaya Road (RVR)'), // RVR = 0 (anchor)
    Station('Yellow', 2, 8, 1, 'Ragigudda (RG'),
    Station('Yellow', 3, 9, 2, 'Jayadeva Hospital'),
    Station('Yellow', 4, 10, 3, 'BTM Layout'),
    Station('Yellow', 5, 11, 4, 'Central Silk Board'),
    Station('Yellow', 6, 12, 5, 'Bommanahalli'),
    Station('Yellow', 7, 13, 6, 'Hongasandra'),
    Station('Yellow', 8, 14, 7, 'Kudlu Gate'),
    Station('Yellow', 9, 15, 8, 'Singasandra'),
    Station('Yellow', 10, 16, 9, 'Hosa Road'),
    Station('Yellow', 11, 17, 10, 'Beratena Agrahara'),
    Station('Yellow', 12, 18, 11, 'Electronic City'),
    Station('Yellow', 13, 19, 12, 'Infosys Foundation Konappana Agrahara'),
    Station('Yellow', 14, 20, 13, 'Huskur Road'),
    Station('Yellow', 15, 21, 14, 'Biocon Hebbagodi'),
    Station('Yellow', 16, 22, 15, 'Delta Electronics Bommasandra'),
  ];

  Station _selectedStation1 = Station('Purple', 27, 4, 11, 'Vijayanagar (VJN)');
  Station _selectedStation2 =
      Station('Green', 27, 10, 3, 'Yelachenahalli (PUTH)');
  String _result = '';
  String _time = '';
  String _waitingTime = '';
  String _directionA = '';
  String _directionB = '';
  String _printMainFare = '';
  String _printSideFare = '';
  String _nextPeak = '';
  String _nextNonPeak = '';

  @override
  void initState() {
    super.initState();
    _updateResult();
  }

  String _shortName(String fullName) {
    if (fullName.contains('Vidhana Soudha'))
      return 'Vidhana Soudha';
    else if (fullName.contains('Hosahalli'))
      return 'Hosahalli';
    else if (fullName.contains('Central College'))
      return 'Central College';
    else if (fullName.contains('Rashtreeya Vidyalaya Road') ||
        fullName.contains('(RVR)'))
      return 'RV Road';
    else if (fullName.contains('Majestic'))
      return 'Majestic';
    else if (fullName.contains('Whitefield'))
      return 'Whitefield';
    else if (fullName.contains('Bommasandra'))
      return 'Bommasandra';
    else if (fullName.contains('Konappana Agrahara'))
      return 'Konappana Agrahara';
    else if (fullName.contains('Krantivira Sangolli Rayanna Railway Station'))
      return 'KSR Railway Station';
    else if (fullName.contains('Krishna Rajendra Market'))
      return 'KR Market';
    else if (fullName.contains('Swami Vivekananda Road'))
      return 'SV Road';
    else if (fullName.contains('Hebbagodi')) return 'Hebbagodi';

    return fullName;
  }

  int _distanceBetweenOnSameLine(Station a, Station b) {
    return (a.stationNumber - b.stationNumber).abs();
  }

  int isNonPeakNow() {
    final now = DateTime.now();
    final minutes = now.hour * 60 + now.minute;

    if (minutes < 8 * 60) {
      _nextPeak = '08:00';
      _nextNonPeak = '12:00';
      return 1;
    } else if (minutes >= 12 * 60 && minutes < 16 * 60) {
      _nextPeak = '16:00';
      _nextNonPeak = '21:00';
      return 1;
    } else if (minutes >= 21 * 60) {
      _nextPeak = '08:00';
      _nextNonPeak = '12:00';
      return 1;
    } else if (minutes >= 8 * 60 && minutes < 12 * 60) {
      _nextPeak = '12:00';
      _nextNonPeak = '12:00';
      return 0;
    } else if (minutes >= 16 * 60 && minutes < 21 * 60) {
      _nextPeak = '21:00';
      _nextNonPeak = '21:00';
      return 0;
    }

    return 0;
  }

  void _updateResult() {
    setState(() {
      int distance = 0;
      int travelTime = 0;
      bool useRVR = false;
      int fare;
      int majes = 0;
      int nonPeak = isNonPeakNow();
      _directionA = '';
      _directionB = '';
      _waitingTime = '';
      _printMainFare = '';
      _printSideFare = '';

      if (_selectedStation1.stationName == _selectedStation2.stationName) {
        _result = 'Same stations';
        _time = '';
        _directionA = '';
        _directionB = '';
        _waitingTime = '';
        fare = 10;
        majes = 0;
        return;
      }
      if (_selectedStation1.lineName == _selectedStation2.lineName) {
        distance =
            _distanceBetweenOnSameLine(_selectedStation1, _selectedStation2);
        travelTime = distance * 2;

        if (_selectedStation1.stationNumber < _selectedStation2.stationNumber) {
          if (_selectedStation1.lineName == 'Purple') {
            _directionA =
                '\nTowards Challaghatta (Platform 2) [${distance} station(s)]';
          } else if (_selectedStation1.lineName == 'Green') {
            _directionA =
                '\nTowards Silk Institute (Platform 2) [${distance} station(s)]';
          } else if (_selectedStation1.lineName == 'Yellow') {
            _directionA = (_selectedStation1.stationName.contains('RVR'))
                ? '\nTowards Bommasandra (Platform 3) [${distance} station(s)]'
                : '\nTowards Bommasandra (Platform 2) [${distance} station(s)]';
          } else {
            _directionA =
                '\nTowards ${_selectedStation2.stationName} [${distance} station(s)]';
          }
        } else {
          if (_selectedStation1.lineName == 'Purple') {
            _directionA =
                '\nTowards Whitefield (Platform 1) [${distance} station(s)]';
          } else if (_selectedStation1.lineName == 'Green') {
            _directionA =
                '\nTowards Madavara (Platform 1) [${distance} station(s)]';
          } else if (_selectedStation1.lineName == 'Yellow') {
            _directionA =
                '\nTowards RV Road (Platform 1) [${distance} station(s)]';
          } else {
            _directionA =
                '\nTowards ${_selectedStation2.stationName} [${distance} station(s)]';
          }
        }
        _waitingTime =
            '^+ waiting time at ${_shortName(_selectedStation1.stationName)}';
      } else {
        if ((_selectedStation1.lineName == "Yellow" &&
                _selectedStation2.lineName == "Green") ||
            (_selectedStation2.lineName == "Yellow" &&
                _selectedStation1.lineName == "Green")) {
          distance = _selectedStation1.fromRVR + _selectedStation2.fromRVR;
          useRVR = true;
        } else if (_selectedStation1.lineName == "Yellow" &&
            _selectedStation2.lineName == "Purple") {
          distance = _selectedStation1.fromRVR + 7 + _selectedStation2.fromKGWA;
          useRVR = true;
        } else if (_selectedStation1.lineName == "Purple" &&
            _selectedStation2.lineName == "Yellow") {
          distance = _selectedStation2.fromRVR + 7 + _selectedStation1.fromKGWA;
          useRVR = true;
        } else if (_selectedStation1.lineName == "Yellow" &&
            _selectedStation2.lineName == "Purple") {
          distance = _selectedStation1.fromRVR + 7 + _selectedStation2.fromKGWA;
          useRVR = true;
        } else if ((_selectedStation1.lineName == "Green" &&
                _selectedStation2.lineName == "Purple") ||
            _selectedStation1.lineName == "Purple" &&
                _selectedStation2.lineName == "Green") {
          distance = _selectedStation1.fromKGWA + _selectedStation2.fromKGWA;
          useRVR = false;
        }
        if (useRVR) {
          if (_selectedStation1.lineName == 'Purple') {
            _directionA = (_selectedStation1.stationNumber < 23)
                ? '\nTowards Challaghatta (Platform 2) till Majestic [${_selectedStation1.fromKGWA} station(s)] then towards Silk Institute (Platform 4) till RV Road [7 stations]'
                : '\nTowards Whitefield (Platform 1) till Majestic [${_selectedStation1.fromKGWA} station(s)] then towards Silk Institute (Platform 4) till RV Road [7 stations]';
            majes = 1;
          } else if (_selectedStation1.lineName == 'Green') {
            _directionA = (_selectedStation1.stationNumber < 24)
                ? '\nTowards Silk Institute (Platform 2) till RV Road [${_selectedStation1.fromRVR} station(s)'
                : '\nTowards Madavara (Platform 1) till RV Road [${_selectedStation1.fromRVR} station(s)]';
          } else {
            _directionA = (_selectedStation1.stationNumber == 1)
                ? '\nTowards Bommasandra (Platform 2) [${_selectedStation1.fromRVR} station(s)]'
                : (_selectedStation2.lineName == 'Green')
                    ? '\nTowards RV Road (Platform 1) till RV Road [${_selectedStation1.fromRVR} station(s)]'
                    : '\nTowards RV Road (Platform 1) till RV Road [${_selectedStation1.fromRVR} station(s)] then towards Madavara (Platform 1) till Majestic [7 stations]';
          }

          if (_selectedStation2.lineName == 'Purple') {
            _directionB = (_selectedStation2.stationNumber > 23)
                ? '\nTowards Challaghatta (Platform 2) from Majestic [${_selectedStation2.fromKGWA} station(s)]'
                : '\nTowards Whitefield Kadugodi (Platform 1) from Majestic [${_selectedStation2.fromKGWA} station(s)]';
            majes = 1;
          } else if (_selectedStation2.lineName == 'Green') {
            _directionB = (_selectedStation2.stationNumber > 24)
                ? '\nTowards Silk Institute (Platform 2) from RV Road [${_selectedStation2.fromRVR} station(s)]'
                : '\nTowards Madavara (Platform 1) from RV Road [${_selectedStation2.fromRVR} station(s)]';
          } else {
            if (_selectedStation2.stationNumber == 1) {
              _directionB = '';
            } else {
              _directionB =
                  '\nTowards Bommasandra (Platform 3) from RV Road [${_selectedStation2.fromRVR} station(s)]';
            }
          }

          _waitingTime = (majes == 1)
              ? '^ + waiting time at ${_shortName(_selectedStation1.stationName)}, Majestic and RV Road}'
              : '^ + waiting time at ${_shortName(_selectedStation1.stationName)} and RV Road';
        } else {
          if (_selectedStation1.lineName == 'Purple') {
            _directionA = (_selectedStation1.stationNumber < 23)
                ? '\nTowards Challaghatta (Platform 2) till Majestic [${_selectedStation1.fromKGWA} station(s)]'
                : '\nTowards Whitefield (Platform 1) till Majestic [${_selectedStation1.fromKGWA} station(s)]';
            majes = 1;
          } else if (_selectedStation1.lineName == 'Green') {
            _directionA = (_selectedStation1.stationNumber < 17)
                ? '\nTowards Silk Institute (Platform 2) till Majestic [${_selectedStation1.fromKGWA} station(s)]'
                : '\nTowards Madavara (Platform 1) till Majestic [${_selectedStation1.fromKGWA} station(s)]';
            majes = 1;
          } else {
            _directionA =
                '\nTowards RV Road till RV Road [${_selectedStation1.fromRVR} station(s)] then towards Madavara (Platform 1) till Majesti [7 stations]';
            majes = 1;
          }

          if (_selectedStation2.lineName == 'Purple') {
            _directionB = (_selectedStation2.stationNumber > 23)
                ? '\nTowards Challaghatta (Platform 2) from Majestic [${_selectedStation2.fromKGWA} station(s)]'
                : '\nTowards Whitefield (Platform 1) from Majestic [${_selectedStation2.fromKGWA} station(s)]';
            majes = 1;
          } else if (_selectedStation2.lineName == 'Green') {
            _directionB = (_selectedStation2.stationNumber > 17)
                ? '\nTowards Silk Institute (Platform 4) from Majestic [${_selectedStation2.fromKGWA} station(s)]'
                : '\nTowards Madavara (Platform 3) from Majestic [${_selectedStation2.fromKGWA} station(s)]';
            majes = 1;
          } else {
            _directionB =
                '\nTowards Silk Institute till RV Road then towards Bommasandra (Platform 4)';
          }

          _waitingTime = (majes == 1)
              ? '^ + waiting time at ${_shortName(_selectedStation1.stationName)} and at Majestic'
              : '^ + waiting time at ${_shortName(_selectedStation1.stationName)} and at RV Road';
        }
        travelTime = distance * 2;
      }

      _time = travelTime > 60
          ? 'Time: ${(travelTime ~/ 60)}h ${(travelTime % 60)}m'
          : 'Time: $travelTime minutes^';

      _result = (distance > 1)
          ? 'Distance: $distance stations'
          : 'Distance: $distance station';

      fare = switch (distance) {
        0 => 10,
        >= 1 && <= 2 => 10,
        >= 3 && <= 4 => 20,
        >= 5 && <= 6 => 30,
        >= 7 && <= 8 => 40,
        >= 9 && <= 10 => 50,
        >= 11 && <= 15 => 60,
        >= 16 && <= 20 => 70,
        >= 21 && <= 25 => 80,
        >= 26 && <= 30 => 90,
        _ => 90,
      };
      if (nonPeak == 1) {
        _printMainFare =
            'QR Ticket/Token Fare: ₹${fare}\nSmart card/NCMC Fare at ${DateTime.now().hour.toString().padLeft(2,'0')}:${DateTime.now().minute.toString().padLeft(2,'0')} (till ${_nextPeak}): ₹${fare * 0.9}';
        _printSideFare =
            'Smart cards/NCMC Fare: ₹${fare * 0.95} during peak hours (from ${_nextPeak})';
      } else {
        _printMainFare =
            'QR Ticket/Token Fare: ₹${fare}\nSmart card/NCMC Fare at ${DateTime.now().hour.toString().padLeft(2,'0')}:${DateTime.now().minute.toString().padLeft(2,'0')} (till ${_nextNonPeak}): ₹${fare * 0.95}';
        _printSideFare =
            'Smart cards/NCMC Fare: ₹${fare * 0.9} during non-peak hours (from ${_nextNonPeak})';
      }
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Master'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Text('Dark Mode'),
                Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ===== Select Stations Card =====
                  Card(
                    color: themeProvider.isDarkMode
                        ? const Color(0xff1e1e1e)
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: themeProvider.isDarkMode
                            ? ((_selectedStation1.lineName == 'Purple') &&
                                    (_selectedStation2.lineName == "Purple"))
                                ? Colors.purple[300]!
                                : ((_selectedStation1.lineName == 'Yellow') &&
                                        (_selectedStation2.lineName ==
                                            "Yellow"))
                                    ? const Color(0xffffd700)
                                    : ((_selectedStation1.lineName ==
                                                'Green') &&
                                            (_selectedStation2.lineName ==
                                                "Green"))
                                        ? const Color(0xff33cc33)
                                        : const Color(0xff06aee1)
                            : Colors.transparent,
                        width: themeProvider.isDarkMode ? 1.5 : 0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
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
                                border: const OutlineInputBorder(),
                                labelStyle: TextStyle(
                                  fontSize: 20.0,
                                  color: themeProvider.isDarkMode
                                      ? (_selectedStation1.lineName == 'Purple'
                                          ? Colors.purple[300]
                                          : (_selectedStation1.lineName ==
                                                  'Yellow'
                                              ? const Color(0xffffd700)
                                              : const Color(0xff33cc33)))
                                      : (_selectedStation1.lineName == 'Purple'
                                          ? Colors.purple
                                          : (_selectedStation1.lineName ==
                                                  'Yellow'
                                              ? const Color(0xffb49900)
                                              : const Color(0xff009c05))),
                                ),
                              ),
                            ),
                            popupProps: PopupProps.menu(
                              showSearchBox: true,
                              searchFieldProps: const TextFieldProps(
                                decoration: InputDecoration(
                                  hintText: "Search Starting Station",
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                ),
                              ),
                              itemBuilder: (context, station, isSelected) {
                                return ListTile(
                                  title: _styledStationText(
                                    station.lineName,
                                    station.stationName,
                                  ),
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
                                border: const OutlineInputBorder(),
                                labelStyle: TextStyle(
                                  fontSize: 20.0,
                                  color: themeProvider.isDarkMode
                                      ? (_selectedStation2.lineName == 'Purple'
                                          ? Colors.purple[300]
                                          : (_selectedStation2.lineName ==
                                                  'Yellow'
                                              ? const Color(0xffffd700)
                                              : const Color(0xff33cc33)))
                                      : (_selectedStation2.lineName == 'Purple'
                                          ? Colors.purple
                                          : (_selectedStation2.lineName ==
                                                  'Yellow'
                                              ? const Color(0xffb49900)
                                              : const Color(0xff009c05))),
                                ),
                              ),
                            ),
                            popupProps: PopupProps.menu(
                              showSearchBox: true,
                              searchFieldProps: const TextFieldProps(
                                decoration: InputDecoration(
                                  hintText: "Search Destination Station",
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                ),
                              ),
                              itemBuilder: (context, station, isSelected) {
                                return ListTile(
                                  title: _styledStationText(
                                    station.lineName,
                                    station.stationName,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
// ===== Station Details Card (Always Open) =====
                  Card(
                    color: themeProvider.isDarkMode
                        ? const Color(0xff1e1e1e)
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: themeProvider.isDarkMode
                            ? ((_selectedStation1.lineName == 'Purple') &&
                                    (_selectedStation2.lineName == "Purple"))
                                ? Colors.purple[300]!
                                : ((_selectedStation1.lineName == 'Yellow') &&
                                        (_selectedStation2.lineName ==
                                            "Yellow"))
                                    ? const Color(0xffffd700)
                                    : ((_selectedStation1.lineName ==
                                                'Green') &&
                                            (_selectedStation2.lineName ==
                                                "Green"))
                                        ? const Color(0xff33cc33)
                                        : const Color(0xff06aee1)
                            : Colors.transparent,
                        width: themeProvider.isDarkMode ? 1.5 : 0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Station Details",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
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
                              style: const TextStyle(fontSize: 16),
                            ),
                          if (_directionB.isNotEmpty)
                            Text(
                              _directionB,
                              style: const TextStyle(fontSize: 16),
                            ),
                          Text(
                            _waitingTime,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff898989),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

// ===== Fare Info Card (Collapsible) =====
                  Card(
                    color: themeProvider.isDarkMode
                        ? const Color(0xff1e1e1e)
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: themeProvider.isDarkMode
                            ? ((_selectedStation1.lineName == 'Purple') &&
                                    (_selectedStation2.lineName == "Purple"))
                                ? Colors.purple[300]!
                                : ((_selectedStation1.lineName == 'Yellow') &&
                                        (_selectedStation2.lineName ==
                                            "Yellow"))
                                    ? const Color(0xffffd700)
                                    : ((_selectedStation1.lineName ==
                                                'Green') &&
                                            (_selectedStation2.lineName ==
                                                "Green"))
                                        ? const Color(0xff33cc33)
                                        : const Color(0xff06aee1)
                            : Colors.transparent,
                        width: themeProvider.isDarkMode ? 1.5 : 0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: ExpansionTile(
                      title: const Text(
                        "Fare Details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_printMainFare.isNotEmpty)
                                Text(
                                  _printMainFare,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (_printSideFare.isNotEmpty)
                                const SizedBox(height: 8),
                              if (_printSideFare.isNotEmpty)
                                Text(
                                  _printSideFare,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

