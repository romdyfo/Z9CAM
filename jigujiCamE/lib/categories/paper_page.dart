import 'package:flutter/material.dart';

class PaperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('종이류'),
        backgroundColor: const Color(0xff6AC99F),
      ),
      body: Center(
        child: Text('종이류 페이지'),
      ),
    );
  }
}
