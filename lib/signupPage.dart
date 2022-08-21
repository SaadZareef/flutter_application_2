import 'package:flutter/material.dart';

import 'email_pass.dart';
import 'loginpage.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email = TextEditingController();
  final password = TextEditingController();
  final List<StoreAccount> users = [];
  void store_account(ctx) {
    if (email.text.isEmpty || password.text.isEmpty) {
      return;
    } else {
      final new_user = StoreAccount(email.text, password.text);
      setState(() {
        users.add(new_user);
        Navigator.push(
            ctx,
            MaterialPageRoute(
                builder: (_) => LoginPage(
                    users: users,
                    toplist: toplist,
                    sizedBox: sizedBox,
                    txfield: txfield,
                    button: button)));
      });
    }
  }

  ListTile toplist(String page) {
    return ListTile(
      leading: Text(
        page,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'OpenSans'),
      ),
      trailing: Wrap(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: Colors.black, width: 1)),
            child: Icon(
              Icons.facebook,
              color: Colors.black,
              size: 35,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 37,
            width: 37,
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: Colors.black, width: 1)),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: null,
              icon: Image.asset(
                'assets/images/google.png',
                height: 29,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox sizedBox(String txfield) {
    return SizedBox(
      height: 40,
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(bottom: 8.0, left: 8),
        child: Text(txfield,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
      ),
    );
  }

  TextField txfield(TextEditingController email, String txfield, IconData icon,
      bool obscure, Function acc) {
    return TextField(
      controller: email,
      onSubmitted: (_) => acc(context),
      obscureText: obscure,
      decoration: InputDecoration(
        label: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            txfield,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
        prefixIcon: Container(
          width: 0,
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              Icon(
                size: 25,
                icon,
                color: Colors.grey,
              ),
              Text(
                '|',
                style: TextStyle(fontSize: 30, color: Colors.grey),
              )
            ],
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Container button(String page, Function acc) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: [
            Colors.pink.withOpacity(0.5),
            Colors.pink.withOpacity(0.6),
            Colors.pink.withOpacity(0.65),
            Color.fromARGB(255, 107, 15, 26).withOpacity(0.7),
          ],
        ),
      ),
      child: ElevatedButton(
        onPressed: () => acc(context),
        child: Text(
          page,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: StadiumBorder(),
            fixedSize: Size(250, 50),
            onSurface: Colors.transparent,
            primary: Colors.transparent),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            height: 230,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color.fromARGB(255, 107, 15, 26).withOpacity(0.68),
                  Color.fromARGB(255, 107, 15, 26).withOpacity(0.72),
                  Color.fromARGB(255, 107, 15, 26).withOpacity(0.75),
                  Colors.white.withOpacity(1),
                ],
                center: Alignment(0.5, 0),
                radius: 0.55,
                stops: [0.25, 0.6, 1, 1],
              ),
            ),
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                toplist('Sign Up'),
                sizedBox('Email'),
                txfield(email, 'Email', Icons.mail, false, store_account),
                sizedBox('Password'),
                txfield(password, 'Password', Icons.lock, true, store_account),
                SizedBox(height: 45),
                button('Sign Up', store_account),
                SizedBox(height: 40),
                Container(
                  width: 226,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LoginPage(
                                    users: users,
                                    toplist: toplist,
                                    sizedBox: sizedBox,
                                    txfield: txfield,
                                    button: button)),
                          );
                        },
                        child: Text(
                          "Log In",
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
    );
  }
}
