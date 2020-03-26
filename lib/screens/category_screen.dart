import 'package:daily_meals/model/dummy_data.dart';
import 'package:daily_meals/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                height: 250.0,
                width: double.infinity,
                color: Color(getColorHexFromStr('#FDD148')),
              ),
              Positioned(
                bottom: 50.0,
                right: 100.0,
                child: Container(
                  height: 400.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200.0),
                      color: Color(getColorHexFromStr('#CAA739'))
                          .withOpacity(0.4)),
                ),
              ),
              Positioned(
                bottom: 100.0,
                left: 150.0,
                child: Container(
                    height: 300.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150.0),
                        color: Color(getColorHexFromStr('#DA962C'))
                            .withOpacity(0.5))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 15.0),
                      Container(
                        alignment: Alignment.topLeft,
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 2.0),
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/ic_empty.png'))),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width - 120.0),
                    /*  Container(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {},
                          color: Colors.white,
                          iconSize: 30.0,
                        ),
                      ),
                      SizedBox(height: 15.0),*/
                    ],
                  ),
                  SizedBox(height: 50.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Hello , David',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      'What do you like to cook?',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(5.0),
                      child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search,
                                  color: Color(getColorHexFromStr('#FEDF62')),
                                  size: 30.0),
                              contentPadding:
                                  EdgeInsets.only(left: 15.0, top: 15.0),
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Raleway'))),
                    ),
                  ),
                  SizedBox(height: 10.0)
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: GridView(
            padding: EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            children: DUMMY_CATEGORIES
                .map((cat) => CategoryItem(cat.title, cat.id, cat.color))
                .toList(),
          ),
        ),
      ],
    );
  }
}
