import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 251, 243, 245),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 3, color: Colors.purple),
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://karnatakastateopenuniversity.in/wp-content/uploads/2022/11/Robert-Downey-Wiki.jpg'),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/edituser');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Robert Downie Jr',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.edit),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              '+91 7986542265',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 40),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    buildOptionRow(context, 'My Rewards', '/my_rewards'),
                    buildOptionRow(
                        context, 'Refer and Earn', '/refer_and_earn'),
                    buildOptionRow(
                        context, 'Register as Partner', '/RegisterAsPartner'),
                    buildOptionRow(context, 'My Bookings', '/bookings'),
                    buildOptionRow(context, 'Wishlist', '/wishlist'),
                    buildOptionRow(context, 'Contact Us', '/contact_us'),
                    Spacer(),
                    Container(
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text('Logout', style: TextStyle(fontSize: 18)),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOptionRow(BuildContext context, String title, String routeName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Row(
          children: [
            Text(title, style: TextStyle(fontSize: 18)),
            Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
