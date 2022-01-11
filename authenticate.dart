import 'package:flutter/material.dart';
import 'package:hostelmaintenance/login_option_screen.dart';
import 'package:hostelmaintenance/student_login_screen.dart';
import 'package:hostelmaintenance/register_department_head.dart';
import 'package:hostelmaintenance/register_student.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text(
            'HOSTEL MAINTENANCE SYSTEM',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StudentRegisterationScreen()));
                  },
                  color: Colors.amberAccent,
                  textColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('SIGN UP AS A STUDENT'),
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
                        builder: (context) => DeptHeadRegisterationScreen()));
                  },
                  child: Text(
                    'SIGN UP AS A DEPARTMENT HEAD',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already Have An Account?',
                      style: TextStyle(color: Colors.amberAccent[100]),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LogInOptionScreen()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.amberAccent[200],
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
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
