import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Auth {
  Auth._();

  static Auth auth = Auth._();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> singUp({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      return e.toString();
    }
    return "";
  }

  Future<String> singIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      return e.toString();
    }
    return "";
  }
}

var authController = Get.put(AuthController());

class AuthController extends GetxController {
  var tetEmail = TextEditingController();
  var tetPassword = TextEditingController();
}
