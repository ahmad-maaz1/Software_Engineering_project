import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelmaintenance/student_current_complaint_screen.dart';
import 'package:hostelmaintenance/new_complaint.dart';
import 'package:hostelmaintenance/popup-menu-std_home_screen/my_profile.dart';
import 'package:hostelmaintenance/popup-menu-std_home_screen/previous_complaints.dart';
import 'package:hostelmaintenance/popup-menu-std_home_screen/settings.dart';
import 'package:hostelmaintenance/student_login_screen.dart';
import 'package:hostelmaintenance/student_model.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  StudentModel loggedInUser = StudentModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("Students")
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedInUser = StudentModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final FileAcomplaintButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.amberAccent[200],
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NewComplaintScreen()));
        },
        child: Text(
          'File a New Complaint',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey[900],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    final currentComplaintButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.amberAccent[200],
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CurrentComplaintScreen()));
        },
        child: Text(
          'View your current Complaints',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey[900],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome ' "${loggedInUser.firstName} ${loggedInUser.secondName}",
          style: TextStyle(color: Colors.amberAccent[200]),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          //list if widget in appbar actions
          PopupMenuButton(
            icon: Icon(
                Icons.more_vert), //don't specify icon if you want 3 dot menu
            color: Colors.black,
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Text(
                  "My Profile",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text(
                  "Previous Complaints",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Text(
                  "Settings",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              PopupMenuItem<int>(
                  value: 3,
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )),
            ],
            onSelected: (item) => selectedItem(context, item),
          ),
        ],
      ),
      backgroundColor: Colors.grey[900],
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(children: <Widget>[
              SizedBox(
                height: 20,
              ),
              FileAcomplaintButton,
              SizedBox(
                height: 20,
              ),
              currentComplaintButton,
            ]),
          ),
        ),
      )),
    );
  }

  void selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyProfile()));
        break;

      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PrevComplaints()));
        break;

      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SettingPage()));
        break;

      case 3:
        logout(context);

        break;
    }
  }

  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LogInScreen()));
  }
}
