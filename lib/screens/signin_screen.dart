import 'package:expense_manager/screens/home_screen.dart';
import 'package:expense_manager/screens/signup_screen.dart';
import 'package:expense_manager/utils/buildInputDeco.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late String email, pass;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  child: Image.asset('images/pic3.jpeg'),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.email, 'Email Address'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter EmailId';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value!;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.lock, 'Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please a Enter Password';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                        email = emailController.text;
                        pass = passwordController.text;
                        return;
                      } else {
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.blue, width: 2),
                    ),
                    textColor: Colors.white,
                    child: Text('SignIn'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                      text: "I am new user ",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                            text: 'SignUp',
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp())),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
