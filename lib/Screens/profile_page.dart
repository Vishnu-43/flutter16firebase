import 'package:flutter/material.dart';
import 'package:flutter16firebase/Screens/login_page.dart';
import 'package:flutter16firebase/authentication/google_signin_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile page"),
      ),
      drawer: Drawer(
        child: Column(children: [
          DrawerHeader(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  '$imageUrl',
                ),
                radius: 100,
                backgroundColor: Colors.transparent,
              )),
          ListTile(
            title: Text(
              'Name',
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),
            subtitle: Text(
              "$name!",
              style: TextStyle(color: Colors.deepPurple),
            ),
          ),
          ListTile(
            subtitle: Text(
              "$email!",
              style: TextStyle(
                color: Colors.deepPurple,
              ),
            ),
            title: Text(
              'EMAIL',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          ListTile(
            onTap: () {
    signOutGoogle();
    Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) {
    return LoginGoogle();
    }), ModalRoute.withName('/'));
    },

            title: Text(
              'Sign Out',
              style: TextStyle(color: Colors.black),
            ),
          )
        ]),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue, Colors.grey],
          ),
        ),
        child: Center(child: Text("Home")),
      ),
    );
  }
}
