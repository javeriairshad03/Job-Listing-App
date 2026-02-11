import 'package:flutter/material.dart';
import 'package:my_first_app/screens/job_listing.dart';
import 'package:my_first_app/screens/job_post.dart';
import 'package:my_first_app/screens/sign_up.dart';
import 'package:my_first_app/screens/sign_in.dart';

void main() => runApp(const JobApp());

class JobApp extends StatelessWidget {
  const JobApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job App',
      initialRoute: '/signup',
      routes: {
        '/signup' : (context) => const SignUp(),
        '/signin' : (context) => const SignIn(),
        '/home' : (context) => const JobListing(),
        '/jobpost' : (context) => const JobPost(),
      },
    );
  }
}