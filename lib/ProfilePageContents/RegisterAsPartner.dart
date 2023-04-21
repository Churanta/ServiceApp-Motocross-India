import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      appBar: AppBar(
        title: Text('Select Services'),
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
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Column(
                children: _services.map((service) {
                  return RadioListTile(
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Column(
                      children:
                          _subServicesMap[_selectedService]!.map((subService) {
                        return RadioListTile(
                          title: Text(subService),
                          value: subService,
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
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _navigateToNextPage();
                  });
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToNextPage() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _formKey.currentState!.save();
      });
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => _buildNextPage(),
        ),
      );
    }
  }

  Widget _buildNextPage() {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Year of Experience'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select years of experience:',
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                      builder: (BuildContext context, StateSetter setState) {
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
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                  ),
                ]),
              ],
            ),
          ),
        ));
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
// TODO: Submit the form data to the server or database
    }
  }
}
