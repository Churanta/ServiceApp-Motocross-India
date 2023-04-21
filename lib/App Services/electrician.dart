import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ElectricianBooking {
  String? service;
  String? customService = '';
  DateTime? dateTime;
}

class Electrician extends StatefulWidget {
  @override
  _ElectricianState createState() => _ElectricianState();
}

class _ElectricianState extends State<Electrician> {
  final _formKey = GlobalKey<FormState>();
  final _booking = ElectricianBooking();
  final TextEditingController _textFieldController = TextEditingController();
  String _textFieldValue = '';

  final customServiceController = TextEditingController();
  String customServiceValue = '';

  // final customServiceController = TextEditingController();
  @override
  void initState() {
    super.initState();

    customServiceController.text = _booking.customService ?? '';
    customServiceController.addListener(() {
      if (_showCustomService != null && _showCustomService) {
        _booking.customService = customServiceController.text;
      }
    });
  }

  @override
  void dispose() {
    customServiceController.dispose();
    super.dispose();
  }

  final List<String> _ElectricianServices = [
    'Tap Fittings',
    'Water Tank Installation',
    'Plumbing Contractor',
    'Toilet Fitting',
    'Others'
  ];

  bool _showCustomService = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 251, 243, 245),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/images/logo1.jpg',
                height: 40,
              ),
              // SizedBox(width: 10),
              Text(
                "|",
                style: new TextStyle(
                    fontSize: 50.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w200),
              ),
              // SizedBox(width: 10),
              Text(
                "Electrician Service",
                style: TextStyle(color: Color.fromARGB(255, 0, 23, 41)),
              )
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  key: _formKey,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Select Electrician Service',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            DropdownButtonFormField<String>(
                              value: _booking.service,
                              onChanged: (value) {
                                setState(() {
                                  _booking.service = value;
                                  if (value == 'Others') {
                                    _showCustomService = true;
                                  } else {
                                    _showCustomService = false;
                                    _booking.customService =
                                        null; // reset customService
                                  }
                                });
                              },
                              items: _ElectricianServices.map((service) {
                                return DropdownMenuItem<String>(
                                  value: service,
                                  child: Text(service),
                                );
                              }).toList(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.purple)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select a service';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.0),
                            if (_showCustomService)
                              TextFormField(
                                controller: customServiceController,
                                decoration: InputDecoration(
                                  labelText: 'Custom Electrician Service',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                ),
                                validator: (value) {
                                  if (_showCustomService != null &&
                                      _showCustomService &&
                                      (value == null || value.isEmpty)) {
                                    return 'Please enter a service';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    customServiceValue = value;
                                  });
                                },
                              ),
                            SizedBox(height: 16.0),
                            GestureDetector(
                              onTap: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate:
                                      _booking.dateTime ?? DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100),
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        primaryColor:
                                            Theme.of(context).primaryColor,
                                        accentColor:
                                            Theme.of(context).accentColor,
                                        colorScheme: ColorScheme.light(
                                          primary:
                                              Theme.of(context).primaryColor,
                                          onPrimary: Colors.white,
                                          surface: Colors.white,
                                          onSurface: Colors.black,
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (date != null) {
                                  final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (time != null) {
                                    setState(() {
                                      _booking.dateTime = DateTime(
                                        date.year,
                                        date.month,
                                        date.day,
                                        time.hour,
                                        time.minute,
                                      );
                                    });
                                  }
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(color: Colors.grey[500]!),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: Colors.grey[500],
                                    ),
                                    SizedBox(width: 8.0),
                                    Expanded(
                                      child: Text(
                                        _booking.dateTime != null
                                            ? DateFormat('MMMM d, yyyy')
                                                .format(_booking.dateTime!)
                                            : 'Select a date',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: _booking.dateTime != null
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .color
                                              : Colors.grey[500],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              'Date and time set to : ' +
                                  (_booking.dateTime == null
                                      ? ''
                                      : DateFormat.yMd()
                                          .add_jm()
                                          .format(_booking.dateTime!)),
                              style: TextStyle(
                                fontSize: 16.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(height: 36.0),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                      'Provide more information',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  CupertinoFormSection(
                                    children: [
                                      CupertinoTextFormFieldRow(
                                        expands: true,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        placeholder: 'Type information here...',
                                        controller: _textFieldController,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 36.0),
                            Center(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    _textFieldValue = _textFieldController.text;
                                  });
                                  print('///////////////////////');
                                  print(_textFieldValue);
                                  print('/////////////////////////');
                                  print(
                                      'Selected Service: ${_booking.service}');
                                  if (_showCustomService) {
                                    print(
                                        'Custom Service: $customServiceValue');
                                  }
                                  print(
                                      'Date and Time: ${DateFormat.yMd().add_jm().format(_booking.dateTime!)}');
                                  // _printTextFieldValue,
                                  Navigator.pushNamed(
                                      context, '/ElectricianService');
                                },
                                icon: Icon(Icons.save_as),
                                label: Text('Submit'),
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xffC576F6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 45)),
                              ),
                            )
                          ]))),
            )
          ],
        ));
  }
}

//
//
//
//
//
//
//------------------------------------------------------------------------

// Code for choose Electrician page no. 18 in wireframe
//
//
//

class ElectricianService extends StatefulWidget {
  @override
  _ElectricianServiceState createState() => _ElectricianServiceState();
}

class _ElectricianServiceState extends State<ElectricianService> {
  final List<String> ElectricianNames = [
    'John Smith',
    'Jane Doe',
    'Bob Johnson',
    'Sara Williams'
  ];

  final List<String> ElectricianPhotos = [
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300'
  ];

  final List<double> ElectricianRatings = [4.5, 3.8, 4.2, 4.9];

  TextEditingController searchController = TextEditingController();
  List<String> filteredElectricianNames = [];

  @override
  void initState() {
    super.initState();
    filteredElectricianNames = ElectricianNames;
    searchController.addListener(() {
      setState(() {
        String query = searchController.text;
        filteredElectricianNames = ElectricianNames.where((ElectricianName) =>
                ElectricianName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    });
  }

  Future<void> _bookNow(BuildContext context, String ElectricianName) async {
    // TODO: Implement the "Book Now" functionality
    await Future.delayed(Duration(seconds: 2)); // Simulate a delay
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Your booking is successfully $ElectricianName'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/images/logo1.jpg',
                height: 40,
              ),
              // SizedBox(width: 10),
              Text(
                "|",
                style: new TextStyle(
                    fontSize: 50.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w200),
              ),
              // SizedBox(width: 10),
              Text(
                "Electrician Service",
                style: TextStyle(color: Color.fromARGB(255, 0, 23, 41)),
              )
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          color: Color.fromARGB(255, 251, 243, 245),
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search by name',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                // Simulate a network request
                future: Future.delayed(Duration(seconds: 2), () => true),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // two cards in a row
                      childAspectRatio:
                          1.0, // width to height ratio of each card
                    ),
                    itemCount: filteredElectricianNames.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 2.0,
                        margin: EdgeInsets.all(8.0),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ClipOval(
                                  child: Image.network(
                                    ElectricianPhotos[index],
                                    height: 50.0,
                                    width: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  ElectricianNames[index],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                RatingBar.builder(
                                  initialRating: ElectricianRatings[index],
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {},
                                  ignoreGestures: true, // disable rating
                                  itemSize: 16.0, // adjust size
                                ),
                                SizedBox(height: 8.0),
                                ElevatedButton(
                                  onPressed: () {
                                    _bookNow(context, ElectricianNames[index]);
                                    Navigator.pushNamed(context, '/home');
                                  },
                                  child: Text('Book Now'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ]),
        ));
  }
}
