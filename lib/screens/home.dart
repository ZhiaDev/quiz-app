import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCA82F),
      appBar: getAppBar(),
      body: SafeArea(
        child: getStartBox(context),
      ),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color(0xFFFCA82F),
      title: Container(
        width: 135,
        height: 32,
        child: Center(
          child: Text('کوییز کویین'),
        ),
        decoration: BoxDecoration(
          color: Color(0xFFEE022C),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget getStartBox(context) {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  width: 300,
                  image: AssetImage('images/Illustration.png'),
                ),
                getInputAndPlayButton(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getInputAndPlayButton(context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(7.5),
              hintText: 'اسم شما',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Color(0xFFEE022C)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Color(0xFFEE022C)),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Quiz()),
            );
          },
          child: Text('شروع بازی'),
          style: TextButton.styleFrom(
            shape: StadiumBorder(),
            primary: Colors.white,
            minimumSize: Size(200, 40),
            backgroundColor: Color(0xFFEE022C),
          ),
        )
      ],
    );
  }
}
