import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  Result({Key? key, this.correctAnswer = 0}) : super(key: key);
  int correctAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCA82F),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('نتیجه آزمون'),
        backgroundColor: Color(0xFFFCA82F),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Expanded(child: getResultBox(context))],
        ),
      ),
    );
  }

  Widget getResultBox(context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            width: 250,
            height: 640,
            decoration: BoxDecoration(
              color: Color(0xFFFDB959),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Container(
            width: 290,
            height: 620,
            decoration: BoxDecoration(
              color: Color(0xFFFED397),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Container(
            width: 330,
            height: 600,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  width: 200,
                  image: AssetImage('images/end.png'),
                ),
                Text(
                  ': تعداد جواب درست شما',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '$correctAnswer',
                  style: TextStyle(
                    fontSize: 128,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 57),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Colors.white,
                    minimumSize: Size(200, 40),
                    backgroundColor: Color(0xFFFCA82F),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => Home(),
                      ),
                    );
                  },
                  child: Text('بازی مجدد'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
