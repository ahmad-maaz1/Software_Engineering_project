// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hostelmaintenance/new_complaint_model.dart';
import 'package:hostelmaintenance/student_home_screen.dart';
import 'package:hostelmaintenance/student_model.dart';

class NewComplaintScreen extends StatefulWidget {
  const NewComplaintScreen({Key? key}) : super(key: key);

  @override
  _NewComplaintScreenState createState() => _NewComplaintScreenState();
}

class _NewComplaintScreenState extends State<NewComplaintScreen> {
  final items = [
    'Electrical',
    'Plumbing',
    'Carpenting',
    'Painting',
    'Sanitary'
  ];
  String? value;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  //editing controllers
  final titleEditingController = new TextEditingController();
  final descriptionEditingController = new TextEditingController();
  String? roomNum;
  String? hostelNum;
  String? phoneNum;
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

  //hostelNumEditingController="${loggedInUser.hostelNum}";
  @override
  Widget build(BuildContext context) {
    //form fields
    //hostelNum field
    roomNum = "${loggedInUser.roomNum}";
    hostelNum = "${loggedInUser.hostelNum}";
    phoneNum = "${loggedInUser.phoneNum}";
    final titleField = TextFormField(
      autofocus: false,
      controller: titleEditingController,
      keyboardType: TextInputType.name,
      style: TextStyle(color: Colors.amberAccent[200]),
      // validator: (value) {
      //   RegExp regex = new RegExp(r'^.{3,}$');
      //   if (value!.isEmpty) {
      //     return ("First Name cannot be Empty");
      //   }
      //   if (!regex.hasMatch(value)) {
      //     return ("Enter Valid name(Min. 3 Character)");
      //   }
      //   return null;
      // },
      onSaved: (value) {
        titleEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.title,
          color: Colors.amberAccent[200],
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Complaint Category',
        hintStyle: TextStyle(color: Colors.amberAccent[200]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    //form fields
    //
    final descriptionField = TextFormField(
      autofocus: false,
      controller: descriptionEditingController,
      keyboardType: TextInputType.name,
      style: TextStyle(
        color: Colors.amberAccent[200],
      ),
      maxLength: 200,
      maxLines: 5,
      // validator: (value) {
      //   RegExp regex = new RegExp(r'^.{3,}$');
      //   if (value!.isEmpty) {
      //     return ("First Name cannot be Empty");
      //   }
      //   if (!regex.hasMatch(value)) {
      //     return ("Enter Valid name(Min. 3 Character)");
      //   }
      //   return null;
      // },
      onSaved: (value) {
        descriptionEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        // prefixIcon: Icon(
        //   Ico,
        //   color: Colors.amberAccent[200],
        // ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Description',
        hintStyle: TextStyle(color: Colors.amberAccent[200]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    // final DropdownButtonFormField=TextFormField()
    // submit button
    final submitButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.amberAccent[200],
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          postDetailsToFirestore();
        },
        child: Text(
          'Submit Complaint',
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
          'File complaint here',
          style: TextStyle(color: Colors.amberAccent[200]),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.amberAccent[200],
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => StudentHomeScreen()));
          },
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          color: Colors.grey[900],
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                    // child: Image.asset(
                    //   'assets/greg-rosenke-xoxnfVIE7Qw-unsplash.jpg',
                    //   fit: BoxFit.contain,
                    // ),
                  ),
                  SizedBox(height: 15),
                  titleField,
                  SizedBox(height: 15),
                  descriptionField,
                  SizedBox(height: 15),
                  submitButton,
                  SizedBox(height: 15),
                  Container(
                      //   width: 300,
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal: 12,
                      //     vertical: 4,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     border: Border.all(
                      //         color: Colors.amberAccent, width: 4),
                      //     borderRadius: BorderRadius.circular(12),
                      //   ),
                      //   child: DropdownButtonHideUnderline(
                      //     child: DropdownButton<String>(
                      //       value: titleEditingController.text,
                      //       items:
                      //           items.map(buildMenuItem).toList(),
                      //       isExpanded: true,
                      //       iconSize: 36,
                      //       icon: Icon(
                      //         Icons.arrow_drop_down,
                      //         color: Colors.amberAccent[200],
                      //       ),
                      //       onChanged: (value) =>
                      //           setState(() => this.value = value),
                      //     ),
                      //   ),
                      // ),
                      )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  //dropdownmenu
  DropdownMenuItem<String> buildMenuItem(String items) => DropdownMenuItem(
      value: items,
      child: Text(
        items,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          backgroundColor: Colors.grey[900],
          color: Colors.amberAccent[200],
          decorationColor: Colors.grey[900],
        ),
      ));

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? complaint = _auth.currentUser;
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Complaints').doc();
    NewComplaintModel newComplaintModel = NewComplaintModel();
    //studentModel.sid = student.uid;
    // writing all the values

    //newComplaintModel.cid = documentReference.documentID;
    newComplaintModel.studentId = loggedInUser.sid;
    print(loggedInUser.sid);
    // newComplaintModel.complaintId = user.uid;
    newComplaintModel.title = titleEditingController.text;
    newComplaintModel.description = descriptionEditingController.text;
    newComplaintModel.hostelNum = hostelNum;
    newComplaintModel.roomNum = roomNum;
    newComplaintModel.phoneNum = phoneNum;
    await firebaseFirestore
        .collection("Complaints")
        .doc()
        .set(newComplaintModel.toMap());
    Fluttertoast.showToast(msg: "Complaint registered successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => StudentHomeScreen()),
        (route) => false);
  }
}
