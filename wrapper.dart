import 'package:flutter/material.dart';
import 'package:hostelmaintenance/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //either return home or authenticate
    return Authenticate();
  }
}
