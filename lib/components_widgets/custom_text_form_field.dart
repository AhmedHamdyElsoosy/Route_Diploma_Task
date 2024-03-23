import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../theme/theme.dart';

class CustomTextField extends StatefulWidget {
  bool isSecured ;
  final String? hintText;
  final TextEditingController myController;
  final Icon theIcon ;
  final Color iconColor ;
    CustomTextField({Key? key,
    required this.myController, this.hintText,
    this.iconColor= Colors.transparent, required this.theIcon, required this.isSecured,}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<ThemeSettings>(context,listen: false);
    ThemeSettings themeSettings = Provider.of<ThemeSettings>(context);
    ThemeData currentTheme = themeSettings.currentTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: settings.currentTheme == AppTheme.lightTheme? Colors.white : const Color(0xff141922),
        border: Border.all(color: settings.currentTheme == AppTheme.lightTheme? Colors.grey : Colors.grey),
      ),
      child: TextFormField(
        obscureText: widget.isSecured,
        controller: widget.myController,
        cursorColor: settings.currentTheme == AppTheme.lightTheme? Colors.grey : Colors.white,
        style: TextStyle(color: settings.currentTheme == AppTheme.lightTheme? Colors.black : Colors.white,),
        decoration: InputDecoration(
          suffixIcon: IconButton(onPressed: (){
            setState(() {
              widget.isSecured = !widget.isSecured;
            });
          }, icon: widget.theIcon,),
          suffixIconColor: widget.iconColor,
          hintText: "${widget.hintText}",
          hintStyle: TextStyle(
              fontSize: 13,
              color: settings.currentTheme == AppTheme.lightTheme? Colors.grey : Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }
}

