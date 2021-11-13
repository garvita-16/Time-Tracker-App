
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailSignInPage extends StatelessWidget {
  //const EmailSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 2.0,
      ),
      backgroundColor: Colors.grey[200],
      body: _buildContainer(),
    );
  }

  _buildContainer() {
    return Container();
  }
}
