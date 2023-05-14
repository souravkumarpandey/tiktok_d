
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/user.dart';

class SearchController extends GetxController{
 final Rx<List<User>> _searchedUsers= Rx<List<User>>([]);

 List<User> get searchedUser => _searchedUsers.value;

 searchUser(String typeUser){
  _searchedUsers.bindStream(firestore.collection('users').where('name',isGreaterThanOrEqualTo: typeUser).snapshots().map((QuerySnapshot query){
  List<User> retVal=[];
  for(var elem in query.docs){
    retVal.add(User.fromSnap(elem));
  }
  print("log ${retVal.length}");
return retVal;
  
  }));
 }
  
}