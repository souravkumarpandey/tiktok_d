import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/controllers/auth_controller.dart';
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;



//Firebae
var firebaseAuth= FirebaseAuth.instance;
var firebaseStorage= FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;


//Controller

var authController= AuthController.instance;

//const Pages
const pages=[
  Text('Home Screen'),
   Text('Search Screen'),
    Text('add photo Screen'),
     Text('messages Screen'),
   Text('Prohile Screen'),  

];