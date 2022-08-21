import 'package:flutter/material.dart';
import 'package:flutter_application_2/drawer.dart';
import 'package:flutter_application_2/email_pass.dart';
import 'package:flutter_application_2/iconbuttons.dart';
import 'package:flutter_application_2/loginpage.dart';

import 'images_list.dart';

class HomePage extends StatelessWidget {
  final String email;
  final List<StoreAccount> users;
  final Function toplist;
  final Function sizedBox;
  final Function txfield;
  final Function button;
  HomePage(
      {required this.email,
      required this.users,
      required this.toplist,
      required this.sizedBox,
      required this.txfield,
      required this.button});
  @override
  Widget build(BuildContext context) {
    SizedBox sizedbox = SizedBox(
      width: 10,
    );

    CircleAvatar circleavatar(String img_source) {
      return CircleAvatar(
        radius: 32,
        backgroundColor: Color.fromARGB(255, 250, 192, 200),
        child: CircleAvatar(
          radius: 29,
          backgroundImage: AssetImage(
            img_source,
          ),
        ),
      );
    }

    ;
    List images = [
      'assets/images/alaska.png',
      'assets/images/india.png',
      'assets/images/pakistan.png',
      'assets/images/pakistan2.png',
      'assets/images/london.png',
      'assets/images/usa.png',
      'assets/images/france.png',
      'assets/images/dubai.png',
    ];

    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 107, 15, 26),
        width: 2,
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Meet",
          style: TextStyle(fontFamily: 'OpenSans', fontSize: 30),
          textAlign: TextAlign.center,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LoginPage(
                      users: users,
                      toplist: toplist,
                      sizedBox: sizedBox,
                      txfield: txfield,
                      button: button),
                ),
              ),
              child: Icon(
                Icons.logout,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      drawer: drawer(email),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 110,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color.fromARGB(255, 107, 15, 26).withOpacity(0.63),
                    Color.fromARGB(255, 107, 15, 26).withOpacity(0.8),
                    Colors.white.withOpacity(1),
                  ],
                  center: Alignment(0, -9),
                  stops: [0.7, 1, 1],
                  radius: 5,
                ),
              ),
            ),
            Container(
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 10),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Container(
                          padding: EdgeInsets.only(left: 15, right: 8),
                          child: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 107, 15, 26),
                            size: 30,
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.filter_alt_outlined,
                          color: Color.fromARGB(255, 107, 15, 26),
                        ),
                        label: Text(
                          'Search',
                          style: TextStyle(
                              color: Color.fromARGB(255, 107, 15, 26)
                                  .withOpacity(0.6),
                              fontFamily: 'OpenSans',
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        constraints: BoxConstraints(maxHeight: 50),
                        enabledBorder: border,
                        focusedBorder: border,
                        errorBorder: border,
                        focusedErrorBorder: border,
                      ),
                    ),
                  ),
                  Container(
                    height: 90,
                    child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: circleavatar(images[index]),
                        );
                      }),
                      itemCount: images.length,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 1, left: 15),
                    ),
                  ),
                ],
              ),
            ),
            ImagesList(images),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 15, right: 10, left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [
              Colors.pink.withOpacity(0.8),
              Colors.pink.withOpacity(0.85),
              Colors.pink.withOpacity(0.9),
              Color.fromARGB(255, 107, 15, 26).withOpacity(0.7),
            ],
          ),
        ),
        child: IconsButtons(),
      ),
    );
  }
}
