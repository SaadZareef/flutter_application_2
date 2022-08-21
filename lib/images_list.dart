import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class ImagesList extends StatelessWidget {
  List images;
  ImagesList(this.images);

  @override
  Widget build(BuildContext context) {
    List<List> location = [
      ['USA', 'Alaska'],
      ['India', 'Haidarabad'],
      ['Pakistan', 'Karachi'],
      ['Pakistan', 'Islamabad'],
      ['London', 'Bridge'],
      ['USA', 'New York'],
      ['France', 'Italy'],
      ['UAE', 'Dubai']
    ];
    Row imagedetails(String country, String province) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            country,
            style: TextStyle(
                color: Color.fromARGB(255, 107, 15, 26),
                fontSize: 13,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            province,
            style: TextStyle(
                color: Color.fromARGB(255, 107, 15, 26), fontSize: 10),
          )
        ],
      );
    }

    return Container(
      height: 460,
      child: GridView.builder(
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color.fromARGB(255, 250, 201, 243),
                ),
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffFFE2E6)),
            margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
            padding: EdgeInsets.only(top: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(images[index]), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15)),
                  height: 128,
                  width: 155,
                ),
                imagedetails(location[index][0], location[index][1]),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    lorem(words: 12, paragraphs: 1),
                    style: TextStyle(
                      fontSize: 6,
                      color: Color.fromARGB(255, 107, 15, 26),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: images.length,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
