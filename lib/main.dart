import 'package:assignment/src/features/news/presentation/view/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'src/features/authentication/presentation/view/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
        title: 'Bashkortostan',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Rubik',
        ),
        home: const SplashScreen(),
      );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateInitialRoute();
  }

  navigateInitialRoute() async {
    Future.delayed(const Duration(milliseconds: 5000), () async {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: const TabsScreen(),
                type: PageTransitionType.rightToLeft));
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECEB),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [
              Center(
                  child: Text(
                "Mobile First",
                style: TextStyle(
                  color: Color.fromARGB(255, 38, 33, 33),
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                ),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
