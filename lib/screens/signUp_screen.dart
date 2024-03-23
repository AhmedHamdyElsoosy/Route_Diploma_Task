import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components_widgets/custom_app_bar.dart';
import '../components_widgets/custom_text_form_field.dart';
import '../components_widgets/buttons.dart';
import '../components_widgets/span_texts.dart';
import '../providers/theme_provider.dart';
import '../theme/theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              const WelcomeCreateText(text: "Create an account .."),
              const HintWelcomeCreateText(text: "Connect with your friends , TODAY !"),
              const SizedBox(height: 30,),
              const EmailPassText(text: "E-mail Address"),
              const SizedBox(height:5),
              CustomTextField(isSecured: false,myController: email,hintText: "Enter Your E-Mail Address",theIcon: const Icon(Icons.email,size: 0),iconColor: settings.currentTheme == AppTheme.lightTheme? Colors.transparent : Colors.transparent),
              const SizedBox(height:15),
              const EmailPassText(text: "Password"),
              const SizedBox(height:5),
              CustomTextField(isSecured:true,myController: password,hintText: "Please Enter Your Password",theIcon: const Icon(Icons.remove_red_eye),iconColor: settings.currentTheme == AppTheme.lightTheme? Colors.grey : Colors.grey),
              const SizedBox(height:50),
              LoginSignUpButton(buttonId: "Sign Up",navigateToScreenNamed: "login_screen",onPressed: ()async{
                try {
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                  Navigator.of(context).pushReplacementNamed("home_screen");
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }
              }),
              const SizedBox(height:35),
              const DoNotHaveAlreadyHave(theTitle: "Already have an account?", loginOrSignUp: "Login",navigateToScreenNamed: "login_screen",)

            ]
        ),
      ),
    );
  }
}