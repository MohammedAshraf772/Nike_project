import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'onboarding_Page_custemwidget.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: PageView(
        controller: _controller,
        children: [
          OnboardingPage(
            image: 'assets/images/Wellcome To Nike.png',
            title: '',
            description: '  ',
            onNext: () => _controller.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.easeIn),
          ),
          OnboardingPage(
            image: 'assets/images/image 3.png',
            title: 'ابدأ رحلتك',
            description: 'وصف الصفحة الأخيرة',
            onNext: () {
              // الانتقال إلى صفحة تسجيل الدخول
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
