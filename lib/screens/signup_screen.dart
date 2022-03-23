import 'package:expense_manager/screens/home_screen.dart';
import 'package:expense_manager/screens/signin_screen.dart';
import 'package:expense_manager/utils/buildInputDeco.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String name, email, phone;

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<String> images = ["google.png", "facebook.png", "twitter.jpg"];
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
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.person, "First Name"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter First Name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person, "Last Name"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Last Name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.email, "Email Address"),
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
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: buildInputDecoration(Icons.phone, "Phone No"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter phone no ';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      phone = value!;
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
                        return;
                      } else {
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue, width: 2)),
                    textColor: Colors.white,
                    child: Text("SignUp"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                      text: "I am old user ",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                            text: 'SignIn',
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn())),
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
