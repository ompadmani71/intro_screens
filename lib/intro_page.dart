import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPages extends StatefulWidget {
  const IntroPages({Key? key}) : super(key: key);

  @override
  State<IntroPages> createState() => _IntroPagesState();
}

class _IntroPagesState extends State<IntroPages> {

  int initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: IndexedStack(
            index: initialIndex,
            children: [
              page("assets/images/1.png", "Intro 1"),
              page("assets/images/2.png", "Intro 2"),
              page("assets/images/3.png", "Intro 3"),
              page("assets/images/4.png", "Intro 4"),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black45
            ),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              setState(() {
                Navigator.of(context).pushReplacementNamed("/");

                prefs.setBool("isIntroShow", false);
              });
            },
            child: const Text("Skip"),
          ),
          Row(
            children: [
              showCurrentIntro(index: 0),
              showCurrentIntro(index: 1),
              showCurrentIntro(index: 2),
              showCurrentIntro(index: 3),
            ],
          ),
          TextButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor
            ),


            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              setState(() {
                if (initialIndex < 3) {
                  initialIndex++;
                } else {
                  Navigator.of(context).pushReplacementNamed("/");

                  prefs.setBool("isIntroShow", false);
                }
              });
            },
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }

  Column page(String image, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        const SizedBox(height: 60),
        Text(
          text,
          style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).primaryColor),
        )
      ],
    );
  }


  Padding showCurrentIntro({required int index}){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 3,
        backgroundColor: (initialIndex == index)
            ? Theme.of(context).primaryColor
        : Theme.of(context).primaryColor.withOpacity(0.3),
      ),
    );
  }
}
