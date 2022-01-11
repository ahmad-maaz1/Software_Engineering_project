import 'package:flutter/material.dart';
import 'package:hostelmaintenance/authenticate.dart';
import 'package:hostelmaintenance/department_login_screen.dart';
import 'package:hostelmaintenance/student_login_screen.dart';

class LogInOptionScreen extends StatefulWidget {
  const LogInOptionScreen({Key? key}) : super(key: key);

  @override
  _LogInOptionScreenState createState() => _LogInOptionScreenState();
}

class _LogInOptionScreenState extends State<LogInOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.amberAccent[200],
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Authenticate()));
            },
          ),
        ),
        body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(
          //         'assets/Pics/greg-rosenke-xoxnfVIE7Qw-unsplash.jpg'),
          //   ),
          // ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LogInScreen()));
                  },
                  color: Colors.amberAccent,
                  textColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('SIGN IN AS A STUDENT'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'OR',
                  style: TextStyle(
                    color: Colors.amberAccent[100],
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DepartmentLogInScreen()));
                  },
                  child: Text(
                    'SIGN IN AS A DEPARTMENT HEAD',
                  ),
                  color: Colors.amberAccent[200],
                  textColor: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(200, 8, 200, 8),
                  child: Divider(
                    height: 30.0,
                    color: Colors.green[900],
                  ),
                ),

                //Image.asset('assets/Pics/greg-rosenke-xoxnfVIE7Qw-unsplash.jpg')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
