import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Super secure account balance",
            style: TextStyle(
              fontSize: 32.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            "0 €",
            style: TextStyle(
              fontSize: 32.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
