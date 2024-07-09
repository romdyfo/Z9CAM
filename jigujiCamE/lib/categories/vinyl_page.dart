import 'package:flutter/material.dart';

class VinylPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비닐류'),
        backgroundColor: const Color(0xff6AC99F),
      ),
      body: Center(
        child: Text('비닐류 페이지'),
      ),
    );
  }
}
