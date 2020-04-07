import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List arr;
  String edit(String Edit){
    Edit=Edit.replaceAll('"', '');
    return Edit.substring(Edit.indexOf(':')+1);
  }
  String editImg(String Edit){
    Edit=Edit.replaceAll('"', '');
    Edit=Edit.replaceAll('[', '');
    Edit=Edit.replaceAll(']', '');
    Edit=Edit.replaceFirst('s', '');
    return Edit;
  }
  Future<void> getdata() async {
    var response = await get(
        'http://skillzycp.com/api/UserApi/getOneOccasion/389/0?fbclid=IwAR3tNZ4EE_Un9QxzT6PTqNWSa7KM0CezYvQhU0W7ZKUBVS2y8spRN3Pbtt0');
    var data = json.decode(response.body);
    String str=data;
    arr=str.split(',');
    Navigator.pushReplacementNamed(context, '/event',arguments: {
      'id' :edit(arr[0]),
      'title' :edit(arr[1]),
      'img0' :edit(editImg(arr[2])),
      'img1' :editImg(arr[3]),
      'img2' :editImg(arr[4]),
      'img3' :editImg(arr[5]),
      'interest' :edit(arr[6]),
      'price' :edit(arr[7]),
      'date' :edit(arr[8]),
      'address' :edit(arr[9]),
      'trainerName' :edit(arr[10]),
      'trainerImg' :edit(editImg(arr[11])),
      'trainerInfo' :edit(arr[12]),
      'occasionDetail' :edit(arr[13]),
    });
  }
  @override
  void initState() {
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child:SpinKitFadingCube(
          color:Colors.white,
          size:50.0,
        )
      ),
    );
  }
}
