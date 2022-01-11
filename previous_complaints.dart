import 'package:flutter/material.dart';

class PrevComplaints extends StatefulWidget {
  const PrevComplaints({ Key? key }) : super(key: key);

  @override
  _PrevComplaintsState createState() => _PrevComplaintsState();
}

class _PrevComplaintsState extends State<PrevComplaints> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('all previous complaints of user here'),
    );
  }
}