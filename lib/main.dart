import 'package:f_logs/model/flog/flog.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:core';
import 'package:synchronized/synchronized.dart';
import 'package:path_provider/path_provider.dart';
import 'package:logging_poc_v1/LoggerImpl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var docsDir = await _getDocsDir();
  String canonFilename = '$docsDir/$_logFileName';
  await Logger.initializeLogging(canonFilename);
  await Logger.log('Entered main().....method');

  runApp(new MyApp());
}

Future<String> _getDocsDir() async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

var _logFileName = 'log.txt';

checkAcivity(int i, int z) async {

  return i + z;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Button1'),
                onPressed: () async {
                  await Logger.log('This is a raised button1');
                  print(checkAcivity(1, 2));
                },
              ),
              RaisedButton(
                child: Text('Button2'),
                onPressed: () async {
                  await Logger.log('This is a raised button2');
                  print(checkAcivity(1, 2));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
