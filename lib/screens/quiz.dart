import 'package:flutter/material.dart';
import 'package:quiz_app/constants/constants.dart';
import 'package:quiz_app/screens/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int shownQIndex = 0;
  int correctAnswer = 0;
  bool isFinalAnswerSubmited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEE022C),
      appBar: getAppBar(),
      body: SafeArea(
        child: Column(
          children: [getQBox()],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color(0xFFEE022C),
      title: Container(
        width: 135,
        height: 32,
        child: Center(
          child: Text(
            '${getQList().length} سوال ${shownQIndex + 1} از',
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xFFFCA82F),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /* return main body  */
  Widget getQBox() {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            width: 250,
            height: 640,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFFF13556),
            ),
          ),
          Container(
            width: 290,
            height: 620,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFFF78096),
            ),
          ),
          Container(
            width: 330,
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFFFFFFFF),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getQImage(),
                getBottomSection(),
              ],
            ),
          )
        ],
      ),
    );
  }

  /* return Quiz Images */
  Widget getQImage() {
    String getQImageIndex = getQList()[shownQIndex].image!;
    return Padding(
      padding: EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: FractionalOffset.center,
                image: AssetImage('images/$getQImageIndex.jpeg'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /* return Quiz Titles */
  Widget getQTitle() {
    return Text(
      getQList()[shownQIndex].title!,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  /* return Quiz Options */
  Widget getOptionsItem(int index) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          primary: Color(0xFFFCA82F),
          shape: StadiumBorder(),
          minimumSize: Size(300, 40),
          side: BorderSide(color: Color(0xFFFCA82F), width: 0.5)),
      child: Text(
        '${getQList()[shownQIndex].answers![index]}',
        textDirection: TextDirection.rtl,
        style: TextStyle(fontSize: 16, color: Colors.black),
        textAlign: TextAlign.center,
      ),
      onPressed: () {
        if (getQList()[shownQIndex].correctAnswer == index) {
          correctAnswer++;
        }
        if (shownQIndex == getQList().length - 1) {
          isFinalAnswerSubmited = true;
        }
        setState(() {
          if (shownQIndex < getQList().length - 1) {
            shownQIndex++;
          }
        });
      },
    );
  }

  /* Quiz Title and Options */
  Widget getBottomSection() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
        child: ClipRRect(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 20,
                  child: getQTitle(),
                ),
                Expanded(
                  flex: 60,
                  child: Column(
                    children: [
                      ...List.generate(4, (index) => getOptionsItem(index))
                    ],
                  ),
                ),
                if (isFinalAnswerSubmited)
                  Expanded(
                    flex: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xFFFCA82F),
                              primary: Colors.white,
                              minimumSize: Size(200, 40),
                              shape: StadiumBorder()),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => Result(
                                  correctAnswer: correctAnswer,
                                ),
                              ),
                            );
                          },
                          child: Text('مشاهده نتیجه'),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
