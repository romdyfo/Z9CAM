import 'package:flutter/material.dart';

class CameraResultPage extends StatefulWidget {
  final String imagePath;

  CameraResultPage({required this.imagePath});

  @override
  _CameraResultPageState createState() => _CameraResultPageState();
}

class _CameraResultPageState extends State<CameraResultPage> {
  bool _showDetails = false; // 정보 보기 상태 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('카메라 결과'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // imagePath가 비어 있지 않은 경우에만 이미지를 표시
            if (widget.imagePath.isNotEmpty)
              Image.network(widget.imagePath), // 네트워크 URL에서 이미지를 로드하여 표시

            SizedBox(height: 20),
            Text(
              '⊙ 플라스틱 빨대는 부피가 작아서 분리수거가 불가능합니다. 일반쓰레기에 버려주세요.\n\n'
              '⊙ 플라스틱 컵은 깨끗하게 세척 후  플라스틱에 버려주세요.\n\n'
              '⊙ 종이 컵홀더는 종이에 버려주세요.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showDetails = !_showDetails; // 정보 보기 상태를 토글
                });
              },
              child: Container(
                color: Colors.grey[300],
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _showDetails ? '정보 접기 ' : '정보 보기 ',
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(
                      _showDetails
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
            if (_showDetails) ...[
              SizedBox(height: 10),
              Text(
                '인식된 물건',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text('빨대'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('플라스틱 컵'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('컵홀더'),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
