import 'package:flutter/material.dart';
import 'package:flutter_adaptive_dialog/flutter_adaptive_dialog.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    _showAlert() {
      showAlertDialog(
          context: context,
          title: 'Delete',
          content: 'Successfully Deleted',
          defaultActionText: 'Close');
    }

    _showOptionAlert() async {
      bool flag = await showOptionAlertDialog(
          context: context,
          title: 'Delete Confirm',
          content: 'Are you sure?',
          negativeText: 'Cancel',
          positiveText: 'Delete');

      if (flag) {
        _showAlert();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
                onPressed: _showOptionAlert,
                icon: Icon(Icons.delete),
                label: Text('Delete Something')),
            RaisedButton.icon(
                onPressed: _showAlert,
                icon: Icon(Icons.delete),
                label: Text('Show Delete Success'))
          ],
        ),
      ),
    );
  }
}
