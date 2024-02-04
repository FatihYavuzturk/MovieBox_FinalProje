import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text('Login'),
      ),
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextField("Email", Icons.email, _emailController),
                SizedBox(height: 25),
                buildTextField("Password", Icons.lock, _passwordController, isPassword: true),
                SizedBox(height: 15),
                buildRegisterButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, IconData icon, TextEditingController controller, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Text(
            hintText,
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              controller: controller,
              onChanged: (value) {},
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: "Enter your $hintText...",
                prefixIcon: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRegisterButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          child: ElevatedButton.icon(
            onPressed: () async {
              if (_formKey.currentState?.validate() ?? false) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                final email = _emailController.text;
                final password = _passwordController.text;

                // Kayıtlı şifreyi al
                final savedPassword = prefs.getString('password');

                if (savedPassword != null && savedPassword.isNotEmpty) {
                  if (password == savedPassword) {
                    // Şifre doğruysa giriş yap
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/main', (Route<dynamic> route) => false);
                  } else {
                    // Şifre yanlışsa hata mesajı göster
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Wrong password. Please try again.'),
                    ));
                  }
                } else {
                  // Kayıtlı şifre yoksa, ilk defa giriş yapılıyor demektir.
                  // Şifreyi kaydet ve giriş yap
                  prefs.setString('email', email);
                  prefs.setString('password', password);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (Route<dynamic> route) => false);
                }
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            icon: Icon(
              Icons.login_rounded,
              color: Colors.white,
            ),
            label: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}




