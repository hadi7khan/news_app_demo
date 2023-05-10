import 'package:assignment/drawer.dart';
import 'package:assignment/src/features/authentication/presentation/view/login_screen.dart';
import 'package:assignment/src/features/authentication/presentation/view_model/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  final String? name;
  const HomeScreen({Key? key, this.name})
      : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     
      body: SafeArea(child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name == null ? "Greetings!" : widget.name!,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 34.sp),
                  ),
                  Icon(Icons.width_normal_rounded,
                      color: Color.fromRGBO(235, 87, 87, 1), size: 24),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Welcome back",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(36, 36, 36, 0.5)),
              ),
            ],),
        ),),)
    );
  }
}
