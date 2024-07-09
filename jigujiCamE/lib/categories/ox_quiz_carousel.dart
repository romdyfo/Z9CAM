import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OXQuizCarousel extends StatefulWidget {
  @override
  _OXQuizCarouselState createState() => _OXQuizCarouselState();
}

class _OXQuizCarouselState extends State<OXQuizCarousel> {
  int _currentIndex = 0;
  List<String> quizQuestions = [
    'Paris is the capital of France.',
    'Jupiter is the largest planet in our solar system.',
    'William Shakespeare wrote the play "Hamlet".',
  ];
  List<bool?> userAnswers = [
    null,
    null,
    null
  ]; // true: O, false: X, null: not answered
  List<bool> correctAnswers = [
    true,
    true,
    true
  ]; // Correct answers for each quiz

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 200,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
          ),
          itemCount: quizQuestions.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              child: userAnswers[index] == null
                  ? _buildQuizItem(index)
                  : _buildResultItem(index),
            );
          },
        ),
        SizedBox(height: 20),
        Text(
          'Question ${_currentIndex + 1} of ${quizQuestions.length}',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildQuizItem(int index) {
    return ConstrainedBox(
      key: ValueKey<int>(index),
      constraints: BoxConstraints(minHeight: 300),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/etc.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              quizQuestions[index],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userAnswers[index] = true; // O 선택
                    });
                  },
                  child: Text('O'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        userAnswers[index] == true ? Colors.green : null,
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userAnswers[index] = false; // X 선택
                    });
                  },
                  child: Text('X'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        userAnswers[index] == false ? Colors.red : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultItem(int index) {
    bool isCorrect = userAnswers[index] == correctAnswers[index];
    return ConstrainedBox(
      key: ValueKey<int>(index),
      constraints: BoxConstraints(maxHeight: 200, minWidth: 300),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isCorrect ? Colors.green : Colors.red,
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isCorrect ? 'Correct!' : 'Wrong!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
