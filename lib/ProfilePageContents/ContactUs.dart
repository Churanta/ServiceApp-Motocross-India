import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final List<Contact> contacts = [
    Contact(
        name: 'Ram',
        phoneNumber: '6235457889',
        address: 'Rajainagar, Bangalore, Karnataka'),
    Contact(
        name: 'Ghnshyam',
        phoneNumber: '9687412558',
        address: 'KR puram , Bangalore , Karnataka'),
    Contact(
        name: 'Narayan',
        phoneNumber: '7893468254',
        address: 'Yelhanka, Bangalore, Karnataka'),
  ];
  final TextEditingController searchController = TextEditingController();
  List<Contact> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    filteredContacts = contacts;
  }

  void filterContacts(String query) {
    List<Contact> temp = [];
    contacts.forEach((contact) {
      if (contact.address.toLowerCase().contains(query.toLowerCase())) {
        temp.add(contact);
      }
    });
    setState(() {
      filteredContacts = temp;
    });
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
              'assets/images/logo.jpg',
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
              "Contact Us",
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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                onChanged: filterContacts,
                decoration: InputDecoration(
                  hintText: 'Search by address',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: searchController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            searchController.clear();
                            filterContacts('');
                          },
                          icon: Icon(Icons.clear),
                        )
                      : null,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredContacts.length,
                itemBuilder: (context, index) {
                  return ContactCard(
                    contact: filteredContacts[index],
                    onCallPressed: () {
                      FlutterPhoneDirectCaller.callNumber(
                          filteredContacts[index].phoneNumber);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Contact {
  final String name;
  final String phoneNumber;
  final String address;

  Contact(
      {required this.name, required this.phoneNumber, required this.address});
}

class ContactCard extends StatelessWidget {
  final Contact contact;
  final Function onCallPressed;

  const ContactCard(
      {Key? key, required this.contact, required this.onCallPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
              title: Text(contact.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(contact.phoneNumber),
                  Text(contact.address),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      final String message = 'Hey, what are you looking for?';
                      launch('sms:${contact.phoneNumber}?body=$message');
                    },
                    icon: Icon(Icons.message),
                    label: Text('Message'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 234, 118, 254)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onCallPressed as void Function()?,
                    child: Text('Call'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
