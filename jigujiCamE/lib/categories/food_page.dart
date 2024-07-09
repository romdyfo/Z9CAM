import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('음식물류'),
        backgroundColor: const Color(0xff6AC99F),
      ),
      body: Center(
        child: Text('음식물류 페이지'),
      ),
    );
  }
}
