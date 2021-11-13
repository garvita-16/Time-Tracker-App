import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/services/auth.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/custom_widgets/custom_raised_widget.dart';
import 'email_sign_in_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key,@required this.auth}) : super(key: key);
  final AuthBase auth;
  //const SignInPage({Key? key}) : super(key: key);
Future<void> _signInAnonymously() async {
  try {
    await auth.signInAnonymously();
  } catch(e){
    print(e.toString());
  }
}
  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch(e){
      print(e.toString());
    }
  }
  void _signInWithEmail(BuildContext context){
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      fullscreenDialog: true,
      builder: (context) => EmailSignInPage(),
    )
  );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
      ),
      backgroundColor: Colors.grey[200],
      body: _buildContainer(context),
    );
  }

  Widget _buildContainer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Sign in',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w600,
              )),
          SizedBox(height: 48.0),
          SocialSignInButton(
            text:'Sign in with Google',
            assetName: 'images/google-logo.png',
            color: Colors.white,
            onPressed: _signInWithGoogle,
          ),
          // RaisedButton(
          //   child: Text(
          //     'Sign in with Google',
          //     style: TextStyle(
          //       color: Colors.black87,
          //       fontSize: 15.0,
          //     ),
          //   ),
          //   color: Colors.white,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(4.0),
          //     ),
          //   ),
          //   onPressed: () {},
          // ),
          // CustomRaisedButton(child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Image.asset('images/google-logo.png'),
          //     Text('Sign in with Google'),
          //     Opacity(
          //       opacity: 0.0,
          //         child: Image.asset('images/google-logo.png')
          //     ),
          //   ],
          // ),
          //   color: Colors.white,
          //   onPressed: (){},
          // ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            text:'Sign in with Facebook',
            assetName: 'images/facebook-logo.png',
            color: Color(0xFF334D92),
            onPressed: (){},
          ),
          // SignInButton(
          //     text: 'Sign in with Google',
          //      textColor: Colors.black87,
          //      color: Colors.white,
          //      onPressed: () {},
          //      ),
          // SizedBox(height: 8.0),

          // CustomRaisedButton(
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Image.asset('images/facebook-logo.png'),
          //         Text('Sign in with Facebook'),
          //         Opacity(
          //           opacity: 0.0,
          //             child: Image.asset('images/facebook-logo.png'),
          //         ),
          //       ],
          //     ),
          //   color: Color(0xFF334D92),
          //   onPressed: (){},
          // ),
          //SizedBox(height: 8.0),
          // SignInButton(
          //   text: 'Sign in with Facebook',
          //   color: Color(0xFF334D92),
          //   textColor: Colors.white,
          //   onPressed: () {},
          // ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in with Email',
            color: Colors.teal[700],
            textColor: Colors.white,
            onPressed: ()=> _signInWithEmail(context),
          ),
          SizedBox(height: 8.0),
          Text('or',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Go anonymous',
            color: Colors.lime[300],
            textColor: Colors.black87,
            onPressed: _signInAnonymously,
          ),
        ],

      ),
    );
  }
}
