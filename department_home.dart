import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelmaintenance/department_complaint_screen.dart';
import 'package:hostelmaintenance/department_model.dart';
import 'package:hostelmaintenance/department_login_screen.dart';
import 'package:hostelmaintenance/popup-menu-dpt_home_screen.dart/department_profile.dart';
import 'package:hostelmaintenance/popup-menu-dpt_home_screen.dart/dep_setting.dart';

class DepartmentHomeScreen extends StatefulWidget {
  const DepartmentHomeScreen({Key? key}) : super(key: key);

  @override
  _DepartmentHomeScreenState createState() => _DepartmentHomeScreenState();
}

class _DepartmentHomeScreenState extends State<DepartmentHomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  DepartmentModel loggedInUser = DepartmentModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("Department")
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedInUser = DepartmentModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final ComplaintButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.amberAccent[200],
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DepartmentComplaintScreen()));
        },
        child: Text(
          'View Student Complaints',
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
                  "Settings",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              PopupMenuItem<int>(
                  value: 2,
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
              ComplaintButton,
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
            .push(MaterialPageRoute(builder: (context) => HeadProfile()));
        break;

      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HeadSetting()));
        break;

      case 2:
        logout(context);

        break;
    }
  }

  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => DepartmentLogInScreen()));
  }
}
