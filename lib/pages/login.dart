import 'package:rismelku/theme.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(
            fontFamily: 'OkineSans',
            fontSize: 22,
            color: backgroundColor,
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "RiceMillKu",
              style: TextStyle(
                fontFamily: 'Danila',
                fontSize: 50,
                color: thirdColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Your Username',
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Username *',
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Your Password',
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password *',
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 45,
                  width: 130,
                  margin: EdgeInsets.only(
                    top: 40,
                  ),
                  child: TextButton(
                    child: Text(
                      "Sign  Up",
                      style: TextStyle(
                        fontFamily: 'OkineSans',
                        fontSize: 20,
                        color: backgroundColor,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 45,
                  width: 130,
                  margin: EdgeInsets.only(
                    top: 40,
                    right: 20,
                  ),
                  child: TextButton(
                    child: Text(
                      "Sign  In",
                      style: TextStyle(
                        fontFamily: 'OkineSans',
                        fontSize: 20,
                        color: backgroundColor,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: thirdColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
