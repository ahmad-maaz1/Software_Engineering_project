import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hostelmaintenance/authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hostelmaintenance/student_login_screen.dart';
import 'package:hostelmaintenance/student_model.dart';

class StudentRegisterationScreen extends StatefulWidget {
  const StudentRegisterationScreen({Key? key}) : super(key: key);

  @override
  _StudentRegisterationScreenState createState() =>
      _StudentRegisterationScreenState();
}

class _StudentRegisterationScreenState
    extends State<StudentRegisterationScreen> {
  //firebase
  //FirebaseAuth auth = FirebaseAuth.instance;

  //form key
  //final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  //editing controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final hostelNumEditingController = new TextEditingController();
  final roomNumEditingController = new TextEditingController();
  final regNumEditingController = new TextEditingController();
  final phoneNumEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      style: TextStyle(color: Colors.amberAccent[200]),
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.account_circle,
          color: Colors.amberAccent[200],
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'First Name',
        hintStyle: TextStyle(color: Colors.amberAccent[200]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //second name field
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      style: TextStyle(color: Colors.amberAccent[200]),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Second Name cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.account_circle,
          color: Colors.amberAccent[200],
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Second Name',
        hintStyle: TextStyle(color: Colors.amberAccent[200]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //email name field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.amberAccent[200]),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.amberAccent[200],
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        hintStyle: TextStyle(color: Colors.amberAccent[200]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //reg num field
    final regNumField = TextFormField(
      autofocus: false,
      controller: regNumEditingController,
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.amberAccent[200]),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Reg Number cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        regNumEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.how_to_reg_outlined,
          color: Colors.amberAccent[200],
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Registeration Number',
        hintStyle: TextStyle(color: Colors.amberAccent[200]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //hostel num field
    final hostelNumField = TextFormField(
      autofocus: false,
      controller: hostelNumEditingController,
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.amberAccent[200]),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Hostel Number cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        hostelNumEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.house,
          color: Colors.amberAccent[200],
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Hostel Number',
        hintStyle: TextStyle(color: Colors.amberAccent[200]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //room num field
    final roomNumField = TextFormField(
      autofocus: false,
      controller: roomNumEditingController,
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.amberAccent[200]),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Room Number cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        roomNumEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.bed,
          color: Colors.amberAccent[200],
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Room Number',
        hintStyle: TextStyle(color: Colors.amberAccent[200]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //phone num field
    final phoneNumField = TextFormField(
      autofocus: false,
      controller: phoneNumEditingController,
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.amberAccent[200]),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Phone Number cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        phoneNumEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.amberAccent[200],
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Phone Number',
        hintStyle: TextStyle(color: Colors.amberAccent[200]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      style: TextStyle(color: Colors.amberAccent[200]),
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Colors.amberAccent[200],
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        hintStyle: TextStyle(color: Colors.amberAccent[200]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //confirm password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      style: TextStyle(color: Colors.amberAccent[200]),
      validator: (value) {
        if (confirmPasswordEditingController.text !=
            passwordEditingController.text) {
          return "Password don't match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Colors.amberAccent[200],
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Confirm Password',
        hintStyle: TextStyle(color: Colors.amberAccent[200]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //signup button
    final SignupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.amberAccent[200],
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: Text(
          'SignUp',
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.amberAccent[200],
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Authenticate()));
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        'assets/greg-rosenke-xoxnfVIE7Qw-unsplash.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 15),
                    firstNameField,
                    SizedBox(height: 15),
                    secondNameField,
                    SizedBox(height: 15),
                    emailField,
                    SizedBox(height: 15),
                    regNumField,
                    SizedBox(height: 15),
                    hostelNumField,
                    SizedBox(height: 15),
                    roomNumField,
                    SizedBox(height: 15),
                    phoneNumField,
                    SizedBox(height: 15),
                    passwordField,
                    SizedBox(height: 15),
                    confirmPasswordField,
                    SizedBox(height: 15),
                    SignupButton,
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? student = _auth.currentUser;

    StudentModel studentModel = StudentModel();

    // writing all the values
    studentModel.email = student!.email;
    studentModel.sid = student.uid;
    studentModel.firstName = firstNameEditingController.text;
    studentModel.secondName = secondNameEditingController.text;
    studentModel.hostelNum = hostelNumEditingController.text;
    studentModel.phoneNum = phoneNumEditingController.text;
    studentModel.regNum = regNumEditingController.text;
    studentModel.roomNum = roomNumEditingController.text;

    await firebaseFirestore
        .collection("Students")
        .doc(student.uid)
        .set(studentModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => LogInScreen()),
        (route) => false);
  }
}
