import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  final String email;
  drawer(this.email);
  @override
  Widget build(BuildContext context) {
    Row row(IconData icon, String label) {
      return Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(icon),
            color: Colors.white,
            iconSize: 30,
            splashColor: Color.fromARGB(255, 107, 15, 26),
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17),
          ),
        ],
      );
    }

    List<IconData> icon = [
      Icons.account_box_outlined,
      Icons.image_outlined,
      Icons.favorite_border_outlined,
      Icons.done_outline,
      Icons.settings_outlined,
      Icons.person_outline,
      Icons.mail_outline,
      Icons.share_outlined,
      Icons.star_border_outlined,
      Icons.adb_outlined,
      Icons.help_outline
    ];
    List<String> label = [
      'Account',
      'Images',
      'Favourite',
      'Visited',
      'Settings',
      'Contact Us',
      'Email Us',
      'Share',
      'Rate Us',
      'Bug Report',
      'Help'
    ];
    return SafeArea(
      child: Drawer(
        width: 250,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 130,
              width: 250,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Color.fromARGB(255, 107, 15, 26).withOpacity(0.65),
                        Color.fromARGB(255, 107, 15, 26).withOpacity(0.75),
                        Color.fromARGB(255, 107, 15, 26).withOpacity(0.85),
                        Color.fromARGB(255, 107, 15, 26).withOpacity(0.9),
                      ],
                      stops: [0.35, 0.55, 0.7, 1],
                      radius: 1.7,
                    ),
                  ),
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(25),
                        splashColor: Colors.black,
                        onTap: () => print('hello'),
                        child: Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile.png'),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Saad Zarif',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            email,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Divider(
                height: 10,
              ),
            ),
            Container(
              height: 540,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 107, 15, 26).withOpacity(0.65),
                    Color.fromARGB(255, 107, 15, 26).withOpacity(0.75),
                    Color.fromARGB(255, 107, 15, 26).withOpacity(0.85),
                    Color.fromARGB(255, 107, 15, 26).withOpacity(0.9),
                  ],
                  stops: [0.3, 0.6, 0.8, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      row(icon[index], label[index]),
                    ],
                  );
                },
                itemCount: icon.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
