import 'package:flutter/material.dart';
import 'package:flutter16firebase/Screens/profile_page.dart';

import '../authentication/google_signin_page.dart';

class LoginGoogle extends StatefulWidget {
  const LoginGoogle({super.key});

  @override
  State<LoginGoogle> createState() => _LoginGoogleState();
}

class _LoginGoogleState extends State<LoginGoogle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google login"),
      ),
        body: Container(
        color: Colors.white,
      child:  Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 150),
            SizedBox(height: 150),
            OutlinedButton(onPressed:() {
              signInWithGoogle().then((result) {
                if (result != null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ProfilePage();
                      },
                    ),
                  );
                }
              });

            }, child: const Padding(child:
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image:AssetImage("assets/images/googlelogo.png"),height: 35.0),
                  Padding(padding: EdgeInsets.only(left: 10),
                  child: Text("Sign in with google",style: TextStyle(fontSize: 20,color: Colors.grey),),),

                ],
              ),
            padding: EdgeInsets.all(10),)
            )
          ],
        ),

      )

    ),
    );
  }
}
