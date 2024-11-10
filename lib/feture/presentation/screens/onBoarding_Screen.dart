import 'package:flutter/material.dart';
import 'package:nike__project/feture/presentation/screens/login.dart';

import 'onboarding_Page_custemwidget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  final int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: PageView(
        controller: _controller,
        children: [
          OnboardingPage(
            image: 'assets/images/image 3.png',
            title: 'Wellcome To Nike',
            description: '  ',
            onNext: () => _controller.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.easeIn),
          ),
          OnboardingPage(
            image: 'assets/images/Spring_prev_ui 1.png',
            title: "Let's Start Journey with Nike",
            description: 'Smart,Gorgeous&Fashionable Collection Explor Now ',
            onNext: () => _controller.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.easeIn),
          ),
          OnboardingPage(
            image: 'assets/images/Aire Jordan Nike.png',
            title: ' You Have the power to',
            description:
                'There Are Many Beautful And Attractive Plan to your Room',
            onNext: () {
              // الانتقال إلى صفحة تسجيل الدخول
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
        ],
      ),
    );
  }
}
