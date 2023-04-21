import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

import '../MainPage.dart';

class RegisterAsPartnerPage extends StatefulWidget {
  @override
  _RegisterAsPartnerPageState createState() => _RegisterAsPartnerPageState();
}

class _RegisterAsPartnerPageState extends State<RegisterAsPartnerPage> {
  String? _selectedService;
  String? _selectedSubService;
  String? _selectedExperience;
  String? _selectedCity;
  String _address = '';
  String _pincode = '';
  String? _selectedIdProof;
  String _idProofOther = '';
  String _idProofPhoto = '';
  String? _textFieldValue;
  final _services = ['Plumbing', 'Electrician', 'Gardening', 'Food'];
  final _subServicesMap = {
    'Plumbing': ['Tap Fitting', 'Bath Fitting', 'Toilet Fitting'],
    'Electrician': ['Wiring', 'Switches', 'Lighting'],
    'Gardening': ['Lawn Care', 'Tree Trimming', 'Landscaping'],
    'Food': ['Cooking', 'Baking', 'Catering']
  };
  final _experiences = ['1', '3', '5', '10', '>10'];
  final _cities = ['Belagavi', 'Bangalore'];
  final _idProofs = ['Aadhar Card', 'Pan Card', 'Passport', 'Others'];
  final _formKey = GlobalKey<FormState>();
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
              "Partner",
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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select a service:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 8.0),
              Column(
                children: _services.map((service) {
                  return RadioListTile(
                    activeColor: Color(0xffC576F6),
                    title: Text(service),
                    value: service,
                    groupValue: _selectedService,
                    onChanged: (value) {
                      setState(() {
                        _selectedService = value;
                        _selectedSubService = null;
                      });
                    },
                  );
                }).toList(),
              ),
              if (_selectedService != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.0),
                    Text(
                      'Select a sub-service:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 8.0),
                    Column(
                      children:
                          _subServicesMap[_selectedService]!.map((subService) {
                        return RadioListTile(
                          title: Text(subService),
                          value: subService,
                          activeColor: Color(0xffC576F6),
                          groupValue: _selectedSubService,
                          onChanged: (value) {
                            setState(() {
                              _selectedSubService = value;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _navigateToNextPage,
                  child: Icon(Icons.arrow_forward),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                      backgroundColor: Color(0xffC576F6)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToNextPage() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => _buildNextPage(),
        ),
      );
    }
  }

  Widget _buildNextPage() {
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
                "Partner",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 23, 41), fontSize: 20),
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
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 251, 243, 245),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select years of experience:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 8.0),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Experience',
                        border: OutlineInputBorder(),
                      ),
                      value: _selectedExperience,
                      onChanged: (value) {
                        setState(() {
                          _selectedExperience = value;
                        });
                      },
                      items: _experiences.map((experience) {
                        return DropdownMenuItem<String>(
                          value: experience,
                          child: Text(
                              '$experience year${experience == ">10" ? "s" : ""}'),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Select a city:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 8.0),
                    DropdownButtonFormField(
                      value: _selectedCity,
                      items: _cities.map((city) {
                        return DropdownMenuItem(
                          value: city,
                          child: Text(city),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCity = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'City',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      initialValue: _address,
                      onSaved: (value) {
                        _address = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Address',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6),
                      ],
                      initialValue: _pincode,
                      onSaved: (value) {
                        _pincode = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your pincode';
                        } else if (value.length != 6 ||
                            int.tryParse(value) == null) {
                          return 'Please enter a valid 6-digit pincode';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Pincode',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Select an ID proof:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 8.0),
                    Column(children: [
                      DropdownButtonFormField(
                        value: _selectedIdProof,
                        onChanged: (value) {
                          setState(() {
                            _selectedIdProof = value.toString();
                          });
                        },
                        items: _idProofs.map((idProof) {
                          return DropdownMenuItem(
                            value: idProof,
                            child: Text(idProof),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: 'ID proof',
                        ),
                      ),
                      if (_selectedIdProof == 'Others')
                        StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return TextFormField(
                              initialValue: _idProofOther,
                              onSaved: (value) {
                                _idProofOther = value!;
                              },
                              validator: (value) {
                                if (_selectedIdProof == 'Others' &&
                                    value!.isEmpty) {
                                  return 'Please enter your ID proof';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'ID proof (others)',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _idProofOther = value;
                                });
                              },
                            );
                          },
                        ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        initialValue: _textFieldValue,
                        onChanged: (value) {
                          setState(() {
                            _textFieldValue = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'ID number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          labelText: 'ID Number ',
                          labelStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.arrow_back),
                            label: Text('Previous'),
                          ),
                          Container(
                            width: 150,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, '/PartnerOtp');
                              },
                              icon: Icon(Icons.save),
                              label: Text('Submit',
                                  style: TextStyle(fontSize: 18)),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffC576F6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 15),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                  ],
                ),
              ),
            )));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Selected service: $_selectedService');
      print('Selected sub-service: $_selectedSubService');
      print('Selected experience: $_selectedExperience');
      print('Selected city: $_selectedCity');
      print('Address: $_address');
      print('Pincode: $_pincode');
      print('Selected ID proof: $_selectedIdProof');
      if (_selectedIdProof == 'Others') {
        print('ID proof (others): $_idProofOther');
      }
      print('ID proof photo: $_idProofPhoto');
      print('Text field value: $_textFieldValue');
// TODO: Submit the form data to the server or database
    }
  }
}

//////////////////////////////////////////
/////////////////////////////////////////
////////////////////////////////////////////
////////////////////////////////////////////
////////////////////////////////////////////
////////////////////////////////////////////
///
///
///

// import 'package:flutter/material.dart';

class PartnerOtp extends StatefulWidget {
  @override
  _PartnerOtpState createState() => _PartnerOtpState();
}

class _PartnerOtpState extends State<PartnerOtp> {
  final _formKey = GlobalKey<FormState>();
  final _otpController =
      List<TextEditingController>.generate(4, (i) => TextEditingController());
  bool _isSubmitting = false;
  final String _otp = '2123';

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
              "Partner",
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Enter the OTP sent to your phone',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) => SizedBox(
                        width: 50,
                        child: TextFormField(
                          controller: _otpController[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a number';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  _isSubmitting
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isSubmitting = true;
                              });
                              String enteredOtp = '';
                              for (final controller in _otpController) {
                                enteredOtp += controller.text;
                              }
                              if (enteredOtp == _otp) {
                                await Future.delayed(Duration(seconds: 2));
                                setState(() {
                                  _isSubmitting = false;
                                });
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      // title: Text('OTP Verified2'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Lottie.asset(
                                            'assets/animation/tick.json',
                                            height: 150,
                                          ),
                                          SizedBox(height: 16),
                                          Text('Your OTP has been verified.'),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        MyHomePage(),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                setState(() {
                                  _isSubmitting = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Wrong OTP entered.'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            minimumSize: Size(200, 48),
                            backgroundColor: Color(0xffC576F6),
                          ),
                          child: Text(
                            'Verify OTP',
                            style: TextStyle(fontSize: 18),
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


//Color(0xffC576F6)