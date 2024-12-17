import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  final picker = ImagePicker();
  final imageKey = UniqueKey(); // Key for Image widget to maintain state

  @override
  void initState() {
    super.initState();
    _loadImageFromSharedPrefs();
  }

  Future<void> _loadImageFromSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profileImage');
    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  Future<void> _saveImageToSharedPrefs(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImage', imagePath);
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _saveImageToSharedPrefs(
            pickedFile.path); // Save image path to SharedPreferences
      });
    }
  }

  void _showImagePreview(BuildContext context) {
    if (_image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text('Image'),
            ),
            body: Center(
              child: InteractiveViewer(
                child: Image.file(_image!),
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _image != null ? () => _showImagePreview(context) : null,
              child: Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          key: imageKey,
                          radius: 50,
                          backgroundImage: FileImage(_image!),
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("assets/images/download (1).png"),
                        ),
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: FloatingActionButton(
                      onPressed: () => _showImagePickerDialog(context),
                      child: Icon(Icons.camera_alt),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text("EraaSoft"),
            SizedBox(height: 15),
            Text("eraasoft@gamil.com"),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Profile Name"),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(labelText: "Profile Name"),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Done"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showImagePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Choose Image'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              title: Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }
}
