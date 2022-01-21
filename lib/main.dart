// Copyright (c) 2019-present,  SurfStudio LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:flutter_application_1/flutter_layout_page.dart';
import 'package:flutter_application_1/gesture_page.dart';
import 'package:flutter_application_1/launch_page.dart';
import 'package:flutter_application_1/less_group_page.dart';
import 'package:flutter_application_1/plugin_use.dart';
import 'package:flutter_application_1/res_page.dart';
import 'package:flutter_application_1/statefull_group_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何创建和使用'),
        ),
        body: RouteNavigator(),
      ),
      routes: <String, WidgetBuilder>{
        'plugin': (BuildContext context) => PluginUse(),
        'less': (BuildContext context) => LessGroupPage(),
        'ful': (BuildContext context) => StatefulGroup(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'gensture': (BuildContext context) => GesturePage(),
        'res': (BuildContext context) => ResPage(),
        'launch': (BuildContext context) => LaunchPage(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
              // title: Text('${byName?'':'不'),
              title: Text('${byName ? '' : '不'}通过路由跳转'),
              value: byName,
              onChanged: (value) {
                setState(() {
                  byName = value;
                });
              }),
          _item('titlStatelessWidget与基础组件', LessGroupPage(), 'less'),
          _item('StatefulWidget与基础组件', StatefulGroup(), 'ful'),
          _item('如何进行布局开发', FlutterLayoutPage(), 'layout'),
          _item('如何使用插件', PluginUse(), 'plugin'),
          _item('gensture', GesturePage(), 'gensture'),
          _item("使用本地资源", ResPage(), 'res'),
          _item("打开第三方", LaunchPage(), 'launch'),
        ],
        // 'gensture': (BuildContext context) => GesturePage(),
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
        child: RaisedButton(
      onPressed: () {
        if (byName) {
          Navigator.pushNamed(context, routeName);
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        }
      },
      child: Text(title),
    ));
  }
}
