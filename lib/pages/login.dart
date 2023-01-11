import 'dart:convert';

import 'package:rismelku/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void login(String username, String password) async {
    final hasil = await http.post(
      Uri.parse("https://rismelku.000webhostapp.com/login.php"),
      body: {
        'username': username,
        'password': password,
      },
    );
    // print(hasil.body['user'][index]['bagian']);
    Map<String, dynamic> map = json.decode(hasil.body);
    List<dynamic> data = map["user"];
    // print(map["user"]);
    if (map['user'].isEmpty == true) {
      print("Tidak Ada Data");
      notif(context, 'Gagal Login !', Colors.redAccent);
    } else {
      print(data[0]);
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
    }
  }

  void signup(String username, String password) async {
    final hasil = await http.post(
      Uri.parse("https://rismelku.000webhostapp.com/signup.php"),
      body: {
        'username': username,
        'password': password,
      },
    );
    // print(hasil.body['user'][index]['bagian']);
    Map<String, dynamic> map = json.decode(hasil.body);
    // print(map["user"]);
    if (map['user'].isEmpty == false) {
      print("Tidak Ada Data");
      notif(context, 'Gagal Sign Up !', Colors.redAccent);
    } else {
      print(hasil.body);
      notif(context, 'Berhasil Sign Up !', Colors.blue[800]);
    }
  }

  bool _passwordVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                obscureText:
                    !_passwordVisible, //This will obscure text dynamically
                decoration: InputDecoration(
                  hintText: 'Your Password',
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password *',
                  fillColor: Colors.white,
                  // Here is key idea
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),
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
                      signup(
                        usernameController.text,
                        passwordController.text,
                      );
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
                      login(
                        usernameController.text,
                        passwordController.text,
                      );
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
