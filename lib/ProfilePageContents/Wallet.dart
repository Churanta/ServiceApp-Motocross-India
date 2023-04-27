import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/UPI-Logo-vector.svg/1280px-UPI-Logo-vector.svg.png',
                height: 32.0,
              ),
            ),
            Text('      '),
            Text(
              'My Wallet',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 251, 243, 245),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 4.0,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.deepPurple,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Balance',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      '\₹3,500.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('Debit Card'),
                subtitle: Text('**** **** **** 1234'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.money),
                title: Text('Transactions'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Text('Add Money'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
