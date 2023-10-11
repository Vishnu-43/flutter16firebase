import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RealtimeSample extends StatefulWidget {
  const RealtimeSample({super.key});

  @override
  State<RealtimeSample> createState() => _RealtimeSampleState();
}

class _RealtimeSampleState extends State<RealtimeSample> {
  final _form=GlobalKey<FormState>();
  String? title,note;


  void writeData() async{
    _form.currentState?.save();
    var url ="https://flutter16firebase-28adf-default-rtdb.firebaseio.com/" + "data.json";
    try{
      final response= await http.post(
        Uri.parse(url),
        body:json.encode({'title':title,"note":note}),
      );
    }
    catch(error){
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Realtime firebase"),
      ),
      body: Form(
         key: _form,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter title"),
                  onSaved: (value){
                    title =value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter note"),
                  onSaved: (value) {
                    note = value!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: writeData, child: Text("submit"))
              ],
            ),
          )),
    );
  }
}
