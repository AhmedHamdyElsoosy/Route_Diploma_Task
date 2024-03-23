import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../theme/theme.dart';

class LoginSignUpButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonId ;
  final String navigateToScreenNamed;
  const LoginSignUpButton({super.key, required this.buttonId, required this.navigateToScreenNamed, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<ThemeSettings>(context,listen: false);
    ThemeSettings themeSettings = Provider.of<ThemeSettings>(context);
    ThemeData currentTheme = themeSettings.currentTheme;
    return MaterialButton(
      height: 50,
      textColor:settings.currentTheme == AppTheme.lightTheme? Colors.white : Colors.blueGrey[800],
      color: settings.currentTheme == AppTheme.lightTheme? Colors.blue[900] : Colors.white,
        onPressed: onPressed,
      child: Text(buttonId));
  }
}

class EnrollJoinButtons extends StatelessWidget {
  final double width;
  final double textPadding;
  final String title;
  const EnrollJoinButtons({super.key, required this.title, required this.width, required this.textPadding});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<ThemeSettings>(context,listen: false);
    ThemeSettings themeSettings = Provider.of<ThemeSettings>(context);
    ThemeData currentTheme = themeSettings.currentTheme;
    return Container(
      width: width,
      alignment: Alignment.center,
      child: ElevatedButton(
          onPressed: (){},
          style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all<Color>(
              settings.currentTheme == AppTheme.lightTheme? const Color(0xff004182) : const Color(0xffFFFFFF),
            ) ,
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            )
          ),
          child:Padding(
            padding:  EdgeInsets.only(right: textPadding ,left: textPadding),
            child: Text(title,style: TextStyle(
              fontSize: 12,
              color: settings.currentTheme == AppTheme.lightTheme? Colors.white : Colors.black,
            ),),
          )
      ),
    );
  }
}

