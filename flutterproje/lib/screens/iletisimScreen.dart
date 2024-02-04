import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class iletisimScreen extends StatelessWidget {
  const iletisimScreen({super.key});
  final String instagramProfile = 'https://www.instagram.com/fateyavuzturk/';
  final String githubProfile = 'https://github.com/FatihYavuzturk';
  final String phoneNumber = 'tel:5416511851';
  final String email = 'lütfen@epostanızıgiriniz.com';
  void _launchInstagram() async {
    await launch(instagramProfile);
  }

  void _launchGitHub() async {
    await launch(githubProfile);
  }
  void _launchPhoneCall() async {
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Telefon araması başlatılamıyor';
    }
  }
  void _launchEmail() async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'yavuzturkbom@gmail.com',
    );

    try {
      await launch(_emailLaunchUri.toString());
    } catch (e) {
      print('E-posta başlatılamıyor: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800], // AppBar rengi gri
        title: Text(
          'İletişim',
          style: TextStyle(color: Colors.grey[900]), // Yazı rengi gri
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/main');
          },
        ),
      ),
      body: Container(
        color: Colors.black, // Sayfa arkaplan rengi gri
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _launchInstagram,
                icon: Icon(Icons.camera_alt),
                label: Text('Instagram'),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _launchGitHub,
                icon: Icon(Icons.link),
                label: Text('GitHub'),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _launchPhoneCall,
                icon: Icon(Icons.phone),
                label: Text('Telefon'),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _launchEmail,
                icon: Icon(Icons.email),
                label: Text('E-posta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

