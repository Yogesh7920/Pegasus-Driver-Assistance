import 'package:PotholeDetector/shared_preference.dart';
import 'package:PotholeDetector/widgets/auth/login.dart';
import 'package:PotholeDetector/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<bool> firstInfo() async {
    bool first = await SharedPreference.first;
    // return first;
    // return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: firstInfo(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data ? Intro() : Home();
          } else {
            return Text("Loading ...");
          }
        },
      ),
    );
  }
}

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final introKey = GlobalKey<IntroductionScreenState>();
  static const bodyStyle = TextStyle(fontSize: 19.0);

  static const pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: bodyStyle,
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );

  void _onIntroEnd(context) {
    SharedPreference.setFirst();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Welcome to Pegasus",
          body: "Fly with Safety",
          decoration: pageDecoration,
          image: SizedBox(
            height: 80.0,
            child: Image.asset(
              "assets/images/loc.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
        PageViewModel(
          title: "About",
          decoration: pageDecoration,
          bodyWidget: Center(
            child: Text(
                "Pegasus, the driver assistance, is a cross-platform mobile application "
                    "to ensure the safety of passengers during a journey. Pegasus provides a "
                    "simple, intuitive and robust user interface powered by a durable and scalable backend. \n\n"
                "Pegasus keeps track of the obstacles faced by the clients while travelling, such "
                    "as potholes, speed-breakers, etc. It uses this information gained to facilitate"
                    "safe travel for all other clients. Pegasus constantly monitors the mobile"
                    "sensors and efficiently detects the obstacles using the same. Then the detected "
                    "coordinates are marks and sent to the database, where all the clients travelling"
                    "coordinates are marks and sent to the database, where all the clients travelling"
                    " along the path of the detected obstacle will be informed about the obstacle. \n\n"
            "The real-time updates and efficient marking of "
                    "obstacles make Pegasus a superior choice for drivers as it "
                    "gives warning of the hidden obstacles ahead.",
              style: TextStyle(
                fontSize: 17.0
              ),
            ),
          )
        ),
        PageViewModel(
          title: "Login/Register.",
          bodyWidget: Login(),
          useScrollView: true,
        )
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      showDoneButton: false,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
