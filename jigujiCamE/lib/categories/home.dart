import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/main.dart';
import 'vinyl_page.dart';
import 'plastic_page.dart';
import 'paper_page.dart';
import 'glass_page.dart';
import 'can_page.dart';
import 'styrofoam_page.dart';
import 'food_page.dart';
import 'etc_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> oxQuestions = [
    {
      'question': '보조배터리,\n일반쓰레기에 버린다?',
      'answer': true,
    },
    {
      'question': '플라스틱 재활용은 환경에 해를 끼친다.',
      'answer': false,
    },
    {
      'question': '종이 재활용은 무조건 환경에 이로운 방법이다.',
      'answer': true,
    },
  ];

  final List<String> gridImages = [
    'assets/images/vinyl.jpg',
    'assets/images/plastic.jpg',
    'assets/images/paper.png',
    'assets/images/glass.jpg',
    'assets/images/can.jpg',
    'assets/images/styrofoam.jpg',
    'assets/images/food.png',
    'assets/images/etc.png',
  ];

  final List<String> buttonTexts = [
    '비닐류',
    '플라스틱류',
    '종이류',
    '유리병',
    '캔류',
    '스티로폼류',
    '음식물류',
    '기타',
  ];

  int currentQuestionIndex = 0;

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = oxQuestions[currentQuestionIndex]['answer'];

    // 결과 팝업 표시
    _showResultDialog(userAnswer == correctAnswer);
  }

  void _showResultDialog(bool answeredCorrectly) {
    String resultText = answeredCorrectly ? '맞았습니다!' : '틀렸습니다!';
    Color resultColor = answeredCorrectly ? Colors.green : Colors.red;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('결과'),
          content: Text(
            resultText,
            style: TextStyle(
              color: resultColor,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<Widget> buildIndicator() {
    return List<Widget>.generate(oxQuestions.length, (index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        width: 8.0,
        height: 8.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentQuestionIndex == index
              ? Color.fromARGB(255, 65, 255, 87)
              : Colors.white,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JigujiCamE'),
        backgroundColor: const Color(0xff6AC99F),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentQuestionIndex = index;
                      });
                    },
                  ),
                  items: oxQuestions.map((questionData) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 7.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/OX퀴즈 배경.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    20.0, 60.0, 20.0, 10.0),
                                child: Text(
                                  questionData['question'],
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 20.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      checkAnswer(true);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white, // 글자색
                                      backgroundColor:
                                          const Color(0xff6AC99F), // 배경색
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // 둥글기 조절
                                      ),
                                    ),
                                    child: Text('O'),
                                  ),
                                  SizedBox(width: 20.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      checkAnswer(false);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white, // 글자색
                                      backgroundColor:
                                          const Color(0xff6AC99F), // 배경색
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // 둥글기 조절
                                      ),
                                    ),
                                    child: Text('X'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Positioned(
                  bottom: 10.0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buildIndicator(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  Widget destinationPage;
                  switch (index) {
                    case 0:
                      destinationPage = VinylPage();
                      break;
                    case 1:
                      destinationPage = PlasticPage();
                      break;
                    case 2:
                      destinationPage = PaperPage();
                      break;
                    case 3:
                      destinationPage = GlassPage();
                      break;
                    case 4:
                      destinationPage = CanPage();
                      break;
                    case 5:
                      destinationPage = StyrofoamPage();
                      break;
                    case 6:
                      destinationPage = FoodPage();
                      break;
                    case 7:
                      destinationPage = EtcPage();
                      break;
                    default:
                      destinationPage = EtcPage();
                  }

                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => destinationPage),
                          );
                        },
                        child: Material(
                          elevation: 8.0,
                          shadowColor: Color(0xFF6AC99F),
                          borderRadius: BorderRadius.circular(15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                              width: 170.0,
                              height: 110.0,
                              child: Image.asset(
                                gridImages[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          switch (index) {
                            case 0:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VinylPage()),
                              );
                              break;
                            case 1:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlasticPage()),
                              );
                              break;
                            case 2:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaperPage()),
                              );
                              break;
                            case 3:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GlassPage()),
                              );
                              break;
                            case 4:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CanPage()),
                              );
                              break;
                            case 5:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StyrofoamPage()),
                              );
                              break;
                            case 6:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodPage()),
                              );
                              break;
                            case 7:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EtcPage()),
                              );
                              break;
                            default:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EtcPage()),
                              );
                          }
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        child: Text(buttonTexts[index]),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
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
        currentIndex: 0, // 현재 선택된 인덱스 (홈 버튼)
        onTap: (index) {
          if (index == 0) {
            // 이미 홈 화면에 있으므로 아무 동작도 하지 않음
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CameraScreen(),
              ),
            );
          } else if (index == 2) {
            // 설정 화면으로 이동하는 기능 추가
            // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
          }
        },
      ),
    );
  }
}
