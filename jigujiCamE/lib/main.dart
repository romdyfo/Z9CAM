import 'package:flutter/material.dart';
import 'categories/home.dart';
import 'package:image_picker/image_picker.dart';
import 'camera_result.dart'; // CameraResultPage를 임포트

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class CameraScreen extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePicture(BuildContext context) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CameraResultPage(imagePath: pickedFile.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메인 홈화면'),
      ),
      body: Center(
        child: Text('여긴 아마도 메인.'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.teal,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: '이미지 검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정',
          ),
        ],
        currentIndex: 1, // 현재 선택된 인덱스 (카메라 버튼)
        onTap: (index) {
          if (index == 0) {
            // 홈으로 이동하는 기능 추가
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          } else if (index == 1) {
            _takePicture(context); // 카메라 열기
          } else if (index == 2) {
            // 설정 화면으로 이동하는 기능 추가
            // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
          }
        },
      ),
    );
  }
}
