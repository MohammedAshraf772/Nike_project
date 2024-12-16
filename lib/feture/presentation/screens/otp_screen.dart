import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  final String email;

  OTPScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter the OTP sent to $email'),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter OTP',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
