import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RealtimeRead extends StatefulWidget {
  const RealtimeRead({super.key});

  @override
  State<RealtimeRead> createState() => _RealtimeReadState();
}

class _RealtimeReadState extends State<RealtimeRead> {
  void initState(){
    super.initState();
    readData();
  }
  bool isLoading = true;
  List<String> titlelist=[];
  List<String> notelist=[];

  Future <void> readData() async{
    var url="https://flutter16firebase-28adf-default-rtdb.firebaseio.com/"+"data.json";

    try{
      final response= await http.get(Uri.parse(url));
      final extractedData= json.decode(response.body)as Map<String,dynamic>;
      if(extractedData==null){
        return;
      }
      extractedData.forEach((blogId,blogData) {
        titlelist.add(blogData["title"]);
        notelist.add(blogData["note"]);
      });
      setState(() {
        isLoading=false;
      });
    }
    catch(error){
      throw error;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Read Realtime firebase")),
      body: isLoading?CircularProgressIndicator():ListView.builder(itemCount: titlelist.length,
          itemBuilder: (BuildContext context,int index){
        return Card(
          child: Center(
            child: ListTile(
              title: Text(titlelist[index]),
              subtitle: Text(notelist[index]),
            ),
          ),
        );
          }),
    );
  }
}
