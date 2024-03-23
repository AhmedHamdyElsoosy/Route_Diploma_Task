import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_diploma_task/components_widgets/buttons.dart';
import 'package:route_diploma_task/components_widgets/span_texts.dart';
import '../providers/theme_provider.dart';
import '../theme/theme.dart';

class RectangleCard extends StatelessWidget {
  final String courseTitle;
  final String studentsEnrolledDetails;
  final String enrollJoinButtonsTitle;
  const RectangleCard({super.key, required this.courseTitle, required this.studentsEnrolledDetails, required this.enrollJoinButtonsTitle});
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<ThemeSettings>(context,listen: false);
    ThemeSettings themeSettings = Provider.of<ThemeSettings>(context);
    ThemeData currentTheme = themeSettings.currentTheme;
    return Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(right: 10,left: 10),
        margin: const EdgeInsets.only(top: 20,bottom: 5,right: 0,left: 0),
        decoration: BoxDecoration(
          color: settings.currentTheme == AppTheme.lightTheme? Colors.grey[100] : Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 100,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 0,bottom: 0),
              child: Image.asset("assets/images/card_route.png",fit: BoxFit.contain,),
            ),
            const SizedBox(width: 15,),
            CardsTitles(courseTitle: courseTitle, studentsEnrolledDetails: studentsEnrolledDetails),
            const Expanded(child: SizedBox()),
            Container(
              margin: const EdgeInsets.only(top: 0),
                child: EnrollJoinButtons(title: enrollJoinButtonsTitle,width: 130,textPadding: 10,))
          ],
        ),
      ),
    );
  }
}

