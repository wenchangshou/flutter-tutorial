import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

///如何使用Flutter包和插件？
class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  String _url = "http://www.baidu.com";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何打开第三方'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _launchURL();
              },
              child: Text('打开浏览器'),
            ),
            RaisedButton(
              onPressed: () {
                _openMap();
              },
              child: Text('打开地图'),
            )
          ],
        ),
      ),
    );
  }

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  _openMap() async {
    String latitude = '39.916527';
    String longitude = '116.397128';
    const url = 'androidamap://viewMap';
    await launch(url);

    return true;
  }
}
