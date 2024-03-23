import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_diploma_task/components_widgets/custom_app_bar.dart';
import 'package:route_diploma_task/components_widgets/custom_text_form_field.dart';
import 'package:route_diploma_task/components_widgets/buttons.dart';
import 'package:route_diploma_task/components_widgets/span_texts.dart';

import '../providers/theme_provider.dart';
import '../theme/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<ThemeSettings>(context,listen: false);
    ThemeSettings themeSettings = Provider.of<ThemeSettings>(context);
    ThemeData currentTheme = themeSettings.currentTheme;
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(110),
          child: CustomAppBar()),
      body: Container(
        margin: const EdgeInsets.only(right: 35 , left:  35,top: 70,bottom: 0),
        child:  ListView(
          padding: const EdgeInsets.only(top: 10),
          children: [
            const WelcomeCreateText(text: "Hi, Welcome Back .."),
            const HintWelcomeCreateText(text: "H e l l o  a g a i n , Y o u ' v e   b e e n   m i s s e d !"),
            const SizedBox(height: 30,),
            const EmailPassText(text: "E-mail Address"),
            const SizedBox(height:5),
            CustomTextField(isSecured:false,myController: email,hintText: "Enter Your E-Mail Address",theIcon: const Icon(Icons.text_rotation_none_sharp,size: 0,),iconColor: settings.currentTheme == AppTheme.lightTheme? Colors.transparent : Colors.transparent),
            const SizedBox(height:15),
            const EmailPassText(text: "Password"),
            const SizedBox(height:5),
            CustomTextField(isSecured:true,myController: password,hintText: "Please Enter Your Password",theIcon: const Icon(Icons.remove_red_eye),iconColor: settings.currentTheme == AppTheme.lightTheme? Colors.grey : Colors.grey),
            const SizedBox(height:50),
            LoginSignUpButton(buttonId: "Login",navigateToScreenNamed: "signUp_screen",onPressed: ()async{
              try {
                final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email.text,
                    password: password.text
                );
                Navigator.of(context).pushReplacementNamed("home_screen");
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                }
              }
            }),
            const SizedBox(height:35),
            const DoNotHaveAlreadyHave(theTitle: "Don't have an account", loginOrSignUp: "Sign Up",navigateToScreenNamed: "signUp_screen",)

          ]
        ),
      ),
    );
  }
}
