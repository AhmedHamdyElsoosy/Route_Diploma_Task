import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_diploma_task/components_widgets/buttons.dart';
import 'package:route_diploma_task/components_widgets/span_texts.dart';
import '../providers/theme_provider.dart';
import '../theme/theme.dart';

class BoxedCard extends StatelessWidget {
  final String courseTitle;
  final String studentsEnrolledDetails;
  final String EnrollJoinButtonsTitle;
  const BoxedCard({super.key, required this.courseTitle, required this.studentsEnrolledDetails, required this.EnrollJoinButtonsTitle});
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<ThemeSettings>(context,listen: false);
    ThemeSettings themeSettings = Provider.of<ThemeSettings>(context);
    ThemeData currentTheme = themeSettings.currentTheme;
    return Container(
      width: 220,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(right: 10,left: 10),
      margin: const EdgeInsets.only(top: 20,bottom: 15,right: 7,left: 0),
      decoration: BoxDecoration(
        color: settings.currentTheme == AppTheme.lightTheme? Colors.grey[100] : Colors.grey[900],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 10,bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/card_route.png",fit: BoxFit.contain,),
            const SizedBox(height: 10,),
            CardsTitles(courseTitle: courseTitle, studentsEnrolledDetails: studentsEnrolledDetails),
            const SizedBox(height: 20,),
            EnrollJoinButtons(title: EnrollJoinButtonsTitle,width: 220,textPadding: 45,)
          ],
        ),
      ),
    );
  }
}
