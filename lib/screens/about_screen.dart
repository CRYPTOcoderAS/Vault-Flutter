import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:passvault/main.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff151922),
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0.0,
        backgroundColor: Color(0xff151922),
        title: Text(
          'About',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: accent,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 67,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey[500],
                        radius: 64,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/1.jpg'),
                          radius: 63,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _launchURL();
                          },
                          child: Image(
                            height: 25,
                            image: AssetImage('assets/git1.png'),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            _launchURL1();
                          },
                          child: Image(
                            height: 22,
                            image: AssetImage('assets/web1.png'),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Akshat Sachan',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'GochiHand',
                          fontSize: 20),
                    ),
                    SizedBox(height: 3),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'THANKS FOR USING THE APP',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.tealAccent,
                  fontFamily: 'GochiHand'),
            ),
          )
        ],
      ),
    );
  }
}

void _launchURL() async {
  const url = 'https://getsachan.co';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchURL1() async {
  const url = 'https://getsachan.co/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
