import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../theme/theme.dart';

class WelcomeCreateText extends StatelessWidget {
  final String? text ;
   const WelcomeCreateText({super.key,
     this.text});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<ThemeSettings>(context,listen: false);
    ThemeSettings themeSettings = Provider.of<ThemeSettings>(context);
    ThemeData currentTheme = themeSettings.currentTheme;
    return Text("$text",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18 ,
          height: 0 ,
          color: settings.currentTheme == AppTheme.lightTheme? Colors.black : Colors.white
      ),);
  }
}

class HintWelcomeCreateText extends StatelessWidget {
  final String? text ;
  const HintWelcomeCreateText({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<ThemeSettings>(context,listen: false);
    ThemeSettings themeSettings = Provider.of<ThemeSettings>(context);
    ThemeData currentTheme = themeSettings.currentTheme;
    return Text("$text",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10 ,
          height: 2 ,
          color: settings.currentTheme == AppTheme.lightTheme? Colors.grey[600] : Colors.grey[500]
      ),);
  }
}

class EmailPassText extends StatelessWidget {
  final String? text ;
  const EmailPassText({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<ThemeSettings>(context,listen: false);
    ThemeSettings themeSettings = Provider.of<ThemeSettings>(context);
    ThemeData currentTheme = themeSettings.currentTheme;
    return Text("$text",
      style: TextStyle(
          fontWeight: FontWeight.w100,
          fontSize: 12 ,
          height: 2 ,
          color: settings.currentTheme == AppTheme.lightTheme? const Color(0xff004182) : Colors.white
      ),);
  }
}

class DoNotHaveAlreadyHave extends StatelessWidget {
  final String theTitle;
  final String loginOrSignUp;
  final String navigateToScreenNamed;
  const DoNotHaveAlreadyHave({super.key, required this.theTitle, required this.loginOrSignUp, required this.navigateToScreenNamed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(theTitle,style:
          const TextStyle(
            fontSize: 12,
            color: Colors.grey
          )
          ,),
        const SizedBox(width: 10,),
        InkWell(
          onTap: (){
            Navigator.of(context).pushReplacementNamed(navigateToScreenNamed);
          },
          child: Text(loginOrSignUp,style:
          TextStyle(
              fontSize: 12,
              color: Colors.blue[900]
          )
            ,),
        )
      ],
    );
  }
}

class CardsTitles extends StatelessWidget {
  final String courseTitle;
  final String studentsEnrolledDetails;
  const CardsTitles({super.key, required this.courseTitle, required this.studentsEnrolledDetails});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<ThemeSettings>(context,listen: false);
    ThemeSettings themeSettings = Provider.of<ThemeSettings>(context);
    ThemeData currentTheme = themeSettings.currentTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(courseTitle,style: TextStyle(
          fontSize: 10,
          color: settings.currentTheme == AppTheme.lightTheme? Colors.black : Colors.white
        ),),
        Text(studentsEnrolledDetails,style: TextStyle(
            fontSize: 10,
            color: settings.currentTheme == AppTheme.lightTheme? Colors.grey : Colors.grey
        ),)
      ],
    );
  }
}


