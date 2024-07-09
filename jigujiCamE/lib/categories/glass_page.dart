import 'package:flutter/material.dart';

class GlassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('유리병'),
        backgroundColor: const Color(0xff6AC99F),
      ),
      body: const Center(
        child: Text('유리병 페이지'),
      ),
    );
  }
}
