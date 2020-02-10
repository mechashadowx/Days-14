import 'package:days/helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String year, soFar, left;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    year = today.year.toString();
    final newYear = DateTime(today.year, 1, 1);
    var difference = today.difference(newYear).inDays;
    soFar = difference.toString();
    final nextNewYear = DateTime((today.year + 1), 1, 1);
    difference = nextNewYear.difference(today).inDays;
    left = difference.toString();
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: blackBlue,
      body: Container(
        margin: EdgeInsets.only(
          top: data.size.height * 0.08,
          bottom: data.size.height * 0.2,
        ),
        alignment: Alignment.topCenter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Center(
                  child: Text(
                    year,
                    style: TextStyle(
                      color: cyan,
                      fontSize: data.size.width * 0.25,
                    ),
                  ),
                ),
              ),
              CustomText(
                topText: soFar + ' days',
                bottomText: 'so far',
                color: cyan,
              ),
              CustomText(
                topText: left + ' days',
                bottomText: 'left',
                color: purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String topText, bottomText;
  final Color color;

  CustomText({
    this.topText,
    this.bottomText,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              topText,
              style: TextStyle(
                color: color,
                fontSize: data.size.width * 0.15,
              ),
            ),
            Text(
              bottomText,
              style: TextStyle(
                color: color,
                fontSize: data.size.width * 0.08,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
