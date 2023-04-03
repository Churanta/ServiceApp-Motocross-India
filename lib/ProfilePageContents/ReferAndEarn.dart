import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ReferAndEarnPage extends StatelessWidget {
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
              "Refer and Earn",
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
        color:
            Color.fromARGB(255, 251, 243, 245), // set the background color here
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Share the App with Friends!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 30),
              Image.asset(
                'assets/images/logo.jpg',
                width: 350,
                height: 120,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.network(
                        'https://www.pngitem.com/pimgs/m/40-404856_transparent-whatsapp-icon-transparent-png-circle-logo-whatsapp.png'),
                    onPressed: () {
                      Share.share(
                        'Download the app at https://motocrossindia.in/',
                        subject: 'Download my app',
                        sharePositionOrigin: Rect.fromCenter(
                            center: Offset.zero, width: 0, height: 0),
                      );
                    },
                  ),
                  IconButton(
                    icon: Image.network(
                        'https://cdn4.iconfinder.com/data/icons/social-media-icons-the-circle-set/48/facebook_circle-512.png'),
                    onPressed: () {
                      Share.share(
                        'Download the app at https://motocrossindia.in/',
                        subject: 'Download my app',
                        sharePositionOrigin: Rect.fromCenter(
                            center: Offset.zero, width: 0, height: 0),
                      );
                    },
                  ),
                  IconButton(
                    icon: Image.network(
                        'https://cdn4.iconfinder.com/data/icons/social-media-icons-the-circle-set/48/twitter_circle-512.png'),
                    onPressed: () {
                      Share.share(
                        'Download the app at https://motocrossindia.in/',
                        subject: 'Download my app',
                        sharePositionOrigin: Rect.fromCenter(
                            center: Offset.zero, width: 0, height: 0),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                child: Text('Share App Link'),
                onPressed: () {
                  Share.share(
                    'Download the app at https://motocrossindia.in/',
                    subject: 'Download my app',
                    sharePositionOrigin: Rect.fromCenter(
                        center: Offset.zero, width: 0, height: 0),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
