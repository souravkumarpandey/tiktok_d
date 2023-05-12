import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/user.dart' as model;
import 'package:tiktok_clone/views/screens/auth/login_screen.dart';
import 'package:tiktok_clone/views/screens/auth/signup_screen.dart';
import 'package:tiktok_clone/views/screens/home_screen.dart';

class AuthController extends GetxController {

  static AuthController instance= Get.find();
  late Rx<User?> _user;
late Rx<File?> _pickImage;

File? get profilePhoto=> _pickImage.value;
User get user=> _user.value!;

@override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user=Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user,_setIntialScreen);
  }
  _setIntialScreen(User? user){
    if(user ==null){
      Get.offAll(()=>SignupScreen());

    }else{
      Get.offAll(()=> const HomeScreen());
    }
  }

  void pickImage()async{
final  pickImage = await ImagePicker().pickImage(source: ImageSource.gallery);
if(pickImage!=null){
  Get.snackbar('Profile picture', 'you have sucessfully selected iamge');

}
_pickImage=Rx<File?>(File(pickImage!.path));

  }

  //upload to firebase Storage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // create a method for registing the user
  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        // saving user to authincation and to firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uploadToStorage(image);
        model.User user = model.User(
          name: username,
          email: email,
          profilePhoto: downloadUrl,
          uid: cred.user!.uid,
        );
       await firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
      }else{
        Get.snackbar('Error in creating an account','Please enter all the field');
      }
    } catch (e) {
      Get.snackbar('Error in creating  account', e.toString());
    }
  }
  void loginUser(String email, String password)async{
    try{
        if (
          email.isNotEmpty &&
          password.isNotEmpty ){
     await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
     print('log success');
          }else{
             Get.snackbar('Error Logging Account', 'Please enter all the field');
          }
        
    }
    catch(e){
      print(e.toString());
    Get.snackbar('Error in creating an account', e.toString());
    }
  }
}
