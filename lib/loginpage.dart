import 'package:flutter/material.dart';
import 'package:flutter_application_2/email_pass.dart';
import 'package:flutter_application_2/homepage.dart';
import 'package:flutter_application_2/signupPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  final Function toplist;
  final Function sizedBox;
  final Function txfield;
  final Function button;

  final List<StoreAccount> users;

  LoginPage(
      {required this.users,
      required this.toplist,
      required this.sizedBox,
      required this.txfield,
      required this.button});
  final email = TextEditingController();
  final password = TextEditingController();

  void checkaccount(ctx) {
    if (email.text.isEmpty || password.text.isEmpty) {
      return;
    } else {
      for (var i = 0; i < users.length; i++) {
        if (email.text == users[0].email &&
            password.text == users[0].password) {
          // Navigator.of(context, rootNavigator: true).pushNamed('/homepage');      doesn't work
          Navigator.push(
              ctx,
              new MaterialPageRoute(
                  builder: (_) => new HomePage(
                      email: email.text,
                      users: users,
                      toplist: toplist,
                      sizedBox: sizedBox,
                      txfield: txfield,
                      button: button)));
        } else {
          showDialog(
            context: ctx,
            builder: (_) => AlertDialog(
              content: Text("Email and Password don't match!"),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 712),
      builder: (context, child) => MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              Container(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 230.h
                        : 130,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  // padding: const EdgeInsets.only(left: 90, top: 70, right: 90),
                  padding:
                      EdgeInsets.symmetric(horizontal: 90.w, vertical: 70.h),
                  child: Text(
                    "Meet",
                    style: TextStyle(
                        fontSize: 40.sm,
                        fontFamily: 'OpenSans',
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Color.fromARGB(255, 107, 15, 26).withOpacity(0.65),
                      Color.fromARGB(255, 107, 15, 26).withOpacity(0.7),
                      Color.fromARGB(255, 107, 15, 26).withOpacity(0.9),
                      Colors.white.withOpacity(1),
                    ],
                    center: Alignment(0.18, -1.5),
                    // radius: MediaQuery.of(context).size.width * 1.2,
                    radius: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.003
                        : 3,
                    stops: [0.4, 0.6, 1, 1],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    toplist('Log In'),
                    sizedBox('Email'),
                    txfield(email, 'Email', Icons.mail, false, checkaccount),
                    sizedBox('Password'),
                    txfield(
                        password, 'Password', Icons.lock, true, checkaccount),
                    SizedBox(height: 45),
                    button('Log In', checkaccount),
                    SizedBox(height: 40),
                    Container(
                      width: 220,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have account yet?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 107, 15, 26),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
