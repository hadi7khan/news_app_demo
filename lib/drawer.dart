import 'package:assignment/src/features/authentication/presentation/view/login_screen.dart';
import 'package:flutter/material.dart';

import 'src/features/authentication/presentation/view_model/sign_in.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        UserAccountsDrawerHeader(
          accountName: Text(
            "Hello User",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                letterSpacing: 1),
          ),
          accountEmail: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hope you are doing well",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Text(
            "Logout",
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.w600, fontSize: 18),
          ),
          trailing: const Icon(
            Icons.exit_to_app,
            color: Colors.red,
          ),
          onTap: () {
            signOutGoogle().then((value) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false);
            });
          },
        ),
      ]),
    );
  }
}
