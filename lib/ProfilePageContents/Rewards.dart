import 'package:flutter/material.dart';

class Reward {
  final String title;
  final String description;
  final int pointsRequired;
  final String imageUrl;

  Reward({
    required this.title,
    required this.description,
    required this.pointsRequired,
    required this.imageUrl,
  });
}

class MyRewardsPage extends StatelessWidget {
  final List<Reward> rewards = [
    Reward(
      title: 'Free Checkup',
      description: 'Have a free checkup of your house !',
      pointsRequired: 50,
      imageUrl:
          'https://blog.vantagecircle.com/content/images/2022/11/extrinsic-rewards-for-employees.png',
    ),
    Reward(
      title: '50% Off on your next service',
      description: 'Get 50% off on your service from our App.',
      pointsRequired: 100,
      imageUrl:
          'https://blog.vantagecircle.com/content/images/2022/11/extrinsic-rewards-for-employees.png',
    ),
    Reward(
      title: 'Free Doarstep Assistent',
      description: 'Treat yourself with a free doar step service!',
      pointsRequired: 75,
      imageUrl:
          'https://blog.vantagecircle.com/content/images/2022/11/extrinsic-rewards-for-employees.png',
    ),
  ];

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
                "Rewards",
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
          child: ListView.builder(
            itemCount: rewards.length,
            itemBuilder: (context, index) {
              return RewardCard(reward: rewards[index]);
            },
          ),
        ));
  }
}

class RewardCard extends StatelessWidget {
  final Reward reward;

  const RewardCard({required this.reward});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              image: DecorationImage(
                image: NetworkImage(reward.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reward.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  reward.description,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 8),
                    Text(
                      reward.pointsRequired.toString() + ' points',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
