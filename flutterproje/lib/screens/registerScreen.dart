import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text('Register'),
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
                buildTextField("Username", Icons.email, _emailController),
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
              onChanged: (value) {
                // Kullanıcı adı veya şifre değiştiğinde burada güvenli saklama yapabilirsiniz.
                // Örneğin:
                // _secureStorage.write(key: 'email', value: value);
              },
              obscureText: isPassword, // Bu özelliği ekleyerek şifreyi gizleyebilirsiniz
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
                // SharedPreferences kullanarak verileri saklama
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('email', _emailController.text);
                prefs.setString('password', _passwordController.text);

                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (Route<dynamic> route) => false);
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
                "Register",
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

