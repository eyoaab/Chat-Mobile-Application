import 'dart:developer';
import 'package:chat_mobile_application/feutures/authentication/auth-entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> signUpUser(String name, String email, String password,) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

      UserModel newUser = UserModel(
        uid: uid,
        name: name, 
        email: email,
        imageUrl: '',
        isOnline: true,
        bio:'',
        chatWith: []
      );

      await FirebaseFirestore.instance.collection('users').doc(uid).set(newUser.toJson());

    } catch (e) {
      log('Error signing up: $e');
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      String uid = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'isOnline': true,
      });

    } catch (e) {
      log('Error logging in: $e');
    }
  }

  Future<void> logoutUser() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'isOnline': false,
      });

      await FirebaseAuth.instance.signOut();

    } catch (e) {
      log('Error logging out: $e');
    }
  }

  Future<void> updateProfile(UserModel user) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      Map<String, dynamic> updatedData = user.toJson();
      await _firestore.collection('users').doc(uid).update(updatedData);

      log('User profile updated successfully');
    } catch (e) {
      log('Error updating profile: $e');
    }
  }

  Future<List<UserModel>> fetchUsersByIds(List<String> userIds) async {

    try {
      List<UserModel> users = [];

      for (String userId in userIds) {
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();

        if (userDoc.exists) {
          UserModel user = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
          users.add(user);
        }
      }

      return users;
    } catch (e) {
      log("Error fetching users: $e");
      return [];
    }
  }

  Future<UserModel?> getSingleUser(String userId) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();

      if (userDoc.exists) {
        return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
      } else {
        log("User not found for ID: $userId");
        return null;
      }
    } catch (e) {
      log("Error fetching user: $e");
      return null; 
    }
  }

}