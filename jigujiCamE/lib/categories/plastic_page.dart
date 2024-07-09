import 'package:flutter/material.dart';

class PlasticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('플라스틱류'),
        backgroundColor: const Color(0xff6AC99F),
      ),
      body: Center(
        child: Text('플라스틱류 페이지'),
      ),
    );
  }
}
