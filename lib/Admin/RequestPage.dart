import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  List<Request> requests = [
    Request(
        name: 'John Doe',
        address: '123 Main St, Anytown USA',
        professional: 'Developer'),
    Request(
        name: 'Jane Smith',
        address: '456 Elm St, Anytown USA',
        professional: 'Designer'),
    Request(
        name: 'Bob Johnson',
        address: '789 Oak St, Anytown USA',
        professional: 'Engineer'),
    Request(
        name: 'Alice Williams',
        address: '101 Maple St, Anytown USA',
        professional: 'Programmer'),
  ];

  TextEditingController searchController = TextEditingController();
  String filterQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 251, 243, 245),
        automaticallyImplyLeading: false, // add this line
        elevation: 0, // add this line to remove the shadow
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              setState(() {
                filterQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search by name, address or profession',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 251, 243, 245),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: requests.length,
          itemBuilder: (BuildContext context, int index) {
            if (filterQuery.isNotEmpty &&
                !requests[index]
                    .name
                    .toLowerCase()
                    .contains(filterQuery.toLowerCase()) &&
                !requests[index]
                    .address
                    .toLowerCase()
                    .contains(filterQuery.toLowerCase()) &&
                !requests[index]
                    .professional
                    .toLowerCase()
                    .contains(filterQuery.toLowerCase())) {
              return Container();
            }

            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(requests[index].name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Text(requests[index].address,
                              style: TextStyle(fontSize: 14)),
                          SizedBox(height: 5),
                          Text(requests[index].professional,
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.cancel, color: Colors.red),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.check_circle, color: Colors.green),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Request {
  final String name;
  final String address;
  final String professional;

  Request(
      {required this.name, required this.address, required this.professional});
}
