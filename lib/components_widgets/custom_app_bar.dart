import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}
class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<ThemeSettings>(context,listen: false);
    ThemeSettings themeSettings = Provider.of<ThemeSettings>(context);
    ThemeData currentTheme = themeSettings.currentTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 50,),
      child: AppBar(
        toolbarHeight: 80,
        leadingWidth: 160,
        leading: themeSettings.currentTheme == AppTheme.lightTheme ?Padding(padding: const EdgeInsets.only(left: 35,top: 15,bottom: 0),
        child: Image.asset("assets/images/route_light.png",fit: BoxFit.fill,)):
        Padding(padding: const EdgeInsets.only(left: 35,top: 15,bottom: 0),
            child: Image.asset("assets/images/route_dark.png",fit: BoxFit.fill,)),
        actions: [themeSettings.currentTheme == AppTheme.lightTheme ?
        Padding(padding: const EdgeInsets.only(right: 35,top: 15,bottom: 0),
            child: InkWell(
                onTap: ()async{
                  settings.toggleTheme();
                },
                child: Image.asset("assets/images/moon.png"))):
        Padding(padding: const EdgeInsets.only(right: 35,top: 15,bottom: 0),
            child: InkWell(
                       onTap: ()async{
                         settings.toggleTheme();
                       },
            child: Image.asset("assets/images/sun.png")),
                   )],
      ),
    );
  }
}


class HomeScreenAppBar extends StatefulWidget {
  const HomeScreenAppBar({super.key});

  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();
}
class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<ThemeSettings>(context,listen: false);
    ThemeSettings themeSettings = Provider.of<ThemeSettings>(context);
    ThemeData currentTheme = themeSettings.currentTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 50,),
      child: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Welcome To Route",style: TextStyle(fontSize: 10),),
            ),
            Text("Enjoy Our Courses",style: TextStyle(fontSize: 15),),
          ],
        ),
        toolbarHeight: 80,
        leadingWidth: 90,
        leading: themeSettings.currentTheme == AppTheme.lightTheme ?
        Padding(padding: const EdgeInsets.only(left: 35,top: 15,bottom: 0),
            child: Image.asset("assets/images/route_light.png",fit: BoxFit.fill,)):
        Padding(padding: const EdgeInsets.only(left: 35,top: 15,bottom: 0),
            child: Image.asset("assets/images/route_dark.png",fit: BoxFit.fill,)),
        actions: [themeSettings.currentTheme == AppTheme.lightTheme ?
        Padding(padding: const EdgeInsets.only(right: 20,top: 15,bottom: 0),
            child: InkWell(
                onTap: ()async{
                  settings.toggleTheme();
                },
                child: Image.asset("assets/images/moon.png"))):
        Padding(padding: const EdgeInsets.only(right: 20,top: 15,bottom: 0),
          child: InkWell(
              onTap: ()async{
                settings.toggleTheme();
              },
              child: Image.asset("assets/images/sun.png")),
        ),
        Padding(padding: const EdgeInsets.only(top: 12,right: 35),
        child: IconButton(onPressed: ()async{
          await FirebaseAuth.instance.signOut();
          Navigator.of(context).pushNamedAndRemoveUntil("login_screen", (route) => false);
        }, icon: const Icon(Icons.exit_to_app,size: 28,)))
        ],
      ),
    );
  }
}
