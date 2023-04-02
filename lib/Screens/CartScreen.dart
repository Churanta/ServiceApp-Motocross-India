import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 241, 244),
      child: Center(
        child: Text(
          'Cart Screen',
          style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 120, 0, 0)),
        ),
      ),
    );
  }
}
