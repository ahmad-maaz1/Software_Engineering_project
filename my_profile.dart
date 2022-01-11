import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelmaintenance/student_login_screen.dart';
import 'package:hostelmaintenance/student_model.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
                        ),),
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
                    Text("EMAIL: ${loggedInUser.email}",
                        style: TextStyle(
                          color: Colors.amberAccent[200],
                          fontWeight: FontWeight.w500,
                        )),
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
                      Icons.bed,
                      color: Colors.amberAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("ROOM NUMBER: ${loggedInUser.roomNum}",
                        style: TextStyle(
                          color: Colors.amberAccent[200],
                          fontWeight: FontWeight.w500,
                        )),
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
                      Icons.house,
                      color: Colors.amberAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("HOSTEL NUMBER: ${loggedInUser.hostelNum}",
                        style: TextStyle(
                          color: Colors.amberAccent[200],
                          fontWeight: FontWeight.w500,
                        )),
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
                      Icons.how_to_reg_outlined,
                      color: Colors.amberAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("REGISTERATION NUMBER: ${loggedInUser.regNum}",
                        style: TextStyle(
                          color: Colors.amberAccent[200],
                          fontWeight: FontWeight.w500,
                        )),
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
                      Icons.phone,
                      color: Colors.amberAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("PHONE NUMBER: ${loggedInUser.phoneNum}",
                        style: TextStyle(
                          color: Colors.amberAccent[200],
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ActionChip(
                  label: Text("Logout"),
                  onPressed: () {
                    logout(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LogInScreen()));
  }
}
