/*
 * @Author: jack ning github@bytedesk.com
 * @Date: 2024-09-13 11:23:38
 * @LastEditors: jack ning github@bytedesk.com
 * @LastEditTime: 2024-09-13 12:17:19
 * @FilePath: /azlistview/example/lib/main.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/index.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AzListView Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        // accentColor: Colors.grey,
        //primarySwatch: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'AzListView',
          ),
        ),
        body: ListPage([
          // PageInfo("GitHub Languages", (ctx) => GitHubLanguagePage(), false),
          PageInfo("Contacts", (ctx) => ContactsPage(), false),
          PageInfo("Contacts List", (ctx) => ContactListPage()),
          PageInfo("City List", (ctx) => CityListPage(), false),
          PageInfo(
              "City List(Custom header)", (ctx) => CityListCustomHeaderPage()),
          PageInfo("Car models", (ctx) => CarModelsPage(), false),
          PageInfo("10000 data", (ctx) => LargeDataPage(), false),
        ]),
      ),
    );
  }
}
