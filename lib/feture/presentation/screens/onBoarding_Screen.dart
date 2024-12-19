import 'package:flutter/material.dart';
import 'package:nike__project/feture/presentation/screens/login.dart';

class AdsScreen extends StatefulWidget {
  @override
  _AdsScreenState createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  int _currentAdIndex = 0;
  final List<String> _ads = [
    'assets/images/Aire Jordan Nike.png',
    'assets/images/Spring_prev_ui 1.png',
    'assets/images/image 3.png'
  ];

  void _skipAds() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Login(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // خلفية زرقاء
      body: Stack(
        children: [
          PageView.builder(
            itemCount: _ads.length,
            onPageChanged: (index) {
              setState(() {
                _currentAdIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Center(
                child: Image.asset(_ads[index]),
              );
            },
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: _skipAds,
            ),
          ),
        ],
      ),
    );
  }
}
