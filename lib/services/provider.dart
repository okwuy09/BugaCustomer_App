import 'dart:io';
import 'package:buga_customer/component/alert.dart';
import 'package:buga_customer/homepage/bottomnarvbar.dart';
import 'package:buga_customer/model/users.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Authentication with ChangeNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseStorage = FirebaseStorage.instance;
  // final _firebaseStore = FirebaseFirestore.instance;
  // final User _user = FirebaseAuth.instance.currentUser!;
  // Users userData = Users();

  // /// fetch user current profile
  // Future<Users> fetchUserProfile() async {
  //   var userDoc = await _firebaseStore.collection('users').doc(_user.uid).get();
  //   _firebaseStore
  //       .collection('users')
  //       .doc(_user.uid)
  //       .snapshots()
  //       .listen((event) => userData = Users.fromJson(event.data()!));
  //   notifyListeners();
  //   return Users.fromJson(userDoc.data()!);
  // }

  // signIn function with firebase
  bool isSignIn = false;
  Future<String?> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      isSignIn = true;
      notifyListeners();
      await _firebaseAuth
          .signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      )
          .then(
        (value) {
          if (value.user != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const BottomNavBar(),
              ),
            );
          }
        },
      );
      isSignIn = false;
      notifyListeners();

      return 'Success';
    } on FirebaseAuthException catch (e) {
      isSignIn = false;
      notifyListeners();
      return handleFireBaseAlert(
        context: context,
        message: e.message!,
      );
    }
  }

  // signUp function with firebase
  bool isSignUp = false;
  Future signUp({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
    required String gender,
    required XFile? profileImage,
    required String age,
    required String location,
    required BuildContext context,
  }) async {
    try {
      isSignUp = true;
      notifyListeners();

      /// upload the user profile image to database
      var file = File(profileImage!.path);
      var snapshot = await _firebaseStorage
          .ref()
          .child('images/${profileImage.name}')
          .putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      var userdata = await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      )
          .then((value) {
        if (value.user != null) {
          /// create profile on signup using Email and password
          final docUser = FirebaseFirestore.instance
              .collection('users')
              .doc(value.user!.uid);
          final user = Users(
            location: location,
            phoneNumber: phoneNumber,
            age: age,
            gender: gender,
            email: email.trim(),
            fullName: fullName.trim(),
            id: docUser.id,
            avarter: downloadUrl,
          );
          final json = user.toJson();
          // create document and write data to firebase
          docUser.set(json);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const BottomNavBar(),
            ),
          );
        }
      });

      isSignUp = false;
      notifyListeners();
      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(userdata.credential!);
    } on FirebaseAuthException catch (e) {
      isSignUp = false;
      notifyListeners();
      return handleFireBaseAlert(
        context: context,
        message: e.message!,
      );
    }
  }
}
