import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تسجيل الدخول')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'البريد الإلكتروني'),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'كلمة المرور'),
            ),
            ElevatedButton(
              onPressed: () {
                // هنا يمكنك إضافة منطق تسجيل الدخول
              },
              child: Text('تسجيل الدخول'),
            ),
          ],
        ),
      ),
    );
  }
}
