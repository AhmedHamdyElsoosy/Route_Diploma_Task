import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_diploma_task/components_widgets/card_boxed.dart';
import 'package:route_diploma_task/components_widgets/card_rectangled.dart';
import '../components_widgets/custom_app_bar.dart';
import '../providers/theme_provider.dart';
import '../theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <QueryDocumentSnapshot> featuredCourses = [];
  List <QueryDocumentSnapshot> bestSellingCourses = [];

  getFeatured()async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("featuredCourses").get();
    featuredCourses.addAll(querySnapshot.docs);
    setState(() {
    });
  }

  getBestSelling()async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("bestSellingCourses").get();
    bestSellingCourses.addAll(querySnapshot.docs);
    setState(() {
    });
  }

  @override
  void initState() {
    getFeatured();
    getBestSelling();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<ThemeSettings>(context,listen: false);
    ThemeSettings themeSettings = Provider.of<ThemeSettings>(context);
    ThemeData currentTheme = themeSettings.currentTheme;
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(110),
          child: HomeScreenAppBar()),
      body: Container(
        margin: const EdgeInsets.only(right: 35 , left:  35,top: 70,bottom: 0),
        child:  ListView(
            padding: const EdgeInsets.only(top: 10),
            children: [
              Row(
                children: [
                  Text("Featured",style: TextStyle(color:settings.currentTheme == AppTheme.lightTheme? Colors.blue[900] : Colors.white ,fontSize: 16,fontWeight: FontWeight.bold),),
                  const SizedBox(width: 5,),
                  Text("Courses",style: TextStyle(color:settings.currentTheme == AppTheme.lightTheme? Colors.black : Colors.grey ,fontSize: 16,fontWeight: FontWeight.bold),),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 0,left: 0,top: 10,bottom: 10),
                height: 270,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredCourses.length,
                  itemBuilder: (context,i) {
                    return
                      BoxedCard(courseTitle: "${featuredCourses[i]["courseTitle"]}",
                        studentsEnrolledDetails: "${featuredCourses[i]["studentsEnrolledDetails"]}",
                        EnrollJoinButtonsTitle: "Enroll Now",);
                  }),
              ),
              const SizedBox(height: 40,),
              Row(
                children: [
                  Text("Best Selling",style: TextStyle(color:settings.currentTheme == AppTheme.lightTheme? Colors.blue[900] : Colors.white ,fontSize: 16,fontWeight: FontWeight.bold),),
                  const SizedBox(width: 5,),
                  Text("Courses",style: TextStyle(color:settings.currentTheme == AppTheme.lightTheme? Colors.black : Colors.grey ,fontSize: 16,fontWeight: FontWeight.bold),),
                  const Expanded(child: SizedBox()),
                  InkWell(
                    onTap: (){},
                    child: Text("View All",style: TextStyle(color:settings.currentTheme == AppTheme.lightTheme? Colors.black : Colors.blue[900] ,fontSize: 16,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,
                      decorationColor: settings.currentTheme == AppTheme.lightTheme? Colors.black : Colors.blue[900]),),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 0,left: 0,top: 20,bottom: 15),
                height: 270,
                child: ListView.builder(
                  itemCount: bestSellingCourses.length,
                  itemBuilder: (context,i){
                    return Row(
                      children: [
                        RectangleCard(
                            courseTitle: "${bestSellingCourses[i]["courseTitle"]}",
                            studentsEnrolledDetails: "${bestSellingCourses[i]["studentsEnrolledDetails"]}",
                            enrollJoinButtonsTitle: "Join Now")
                      ]
                    );
                  },
                  scrollDirection: Axis.vertical,
                ),
              ),
            ]
        ),
      ),
    );
  }
}
