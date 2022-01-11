import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelmaintenance/department_model.dart';

class HeadProfile extends StatefulWidget {
  const HeadProfile({Key? key}) : super(key: key);

  @override
  _HeadProfileState createState() => _HeadProfileState();
}

class _HeadProfileState extends State<HeadProfile> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: TextStyle(
            color: Colors.amberAccent[200],
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
                // child: Image.asset("assets/logo.png", fit: BoxFit.contain),
              ),
              // Container(
              //   width: 300,
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 12,
              //     vertical: 4,
              //   ),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.amberAccent, width: 4),
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              //   child: Text(
              //     "My Profile",
              //     style: TextStyle(
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.amberAccent[200],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amberAccent, width: 4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Colors.amberAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "NAME : ${loggedInUser.firstName} ${loggedInUser.secondName}",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.amberAccent[200],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 300,
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amberAccent, width: 4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.amberAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "EMAIL : ${loggedInUser.email} ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.amberAccent[200],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 300,
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amberAccent, width: 4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.work,
                      color: Colors.amberAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "DEPARTMENT NAME : ${loggedInUser.departmentName} ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.amberAccent[200],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
