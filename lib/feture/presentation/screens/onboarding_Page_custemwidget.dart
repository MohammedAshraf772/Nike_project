import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final VoidCallback onNext;

  const OnboardingPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(description),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onNext,
          child: const Text('التالي'),
        ),
      ],
    );
  }
}
