import 'package:final_exam_adv/srceens/auth_page.dart';
import 'package:final_exam_adv/srceens/auth_page2.dart';
import 'package:final_exam_adv/srceens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        // GetPage(name: '/', page: () => const SignIn()),
        // GetPage(name: '/signUp', page: () => const SingUp()),
        GetPage(name: '/', page: () => const HomePage()),
      ],
    );
  }
}
