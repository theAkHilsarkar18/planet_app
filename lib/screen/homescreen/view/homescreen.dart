import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planet_app/screen/homescreen/controller/homecontroller.dart';
import 'package:planet_app/screen/homescreen/model/homemodel.dart';
import 'package:sizer/sizer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  HomeController homeController = Get.put(HomeController());
  AnimationController? animationController;
  Animation? rotateTween;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 6));
    rotateTween =
        Tween<double>(begin: 0, end: pi).animate(animationController!);
    animationController!.repeat(reverse: false);
    animationController!.addListener(() {
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/img/bg2.gif', fit: BoxFit.cover),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        shape:  RoundedRectangleBorder( // <-- SEE HERE
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50.0),
                          ),
                        ),
                        builder: (context) {
                          return bottomSheetContainer(index,homeController.distance[index],
                            homeController.distanceInLight[index],);
                        },
                      );
                    },
                    child: planetBox(
                      homeController.planetImgList[index],
                      homeController.planetName[index],
                      homeController.distance[index],
                      homeController.distanceInLight[index],
                    ),
                  );
                },
                itemCount: homeController.planetImgList.length,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget planetBox(
      String planetImg, String name, String distance, String light) {
    return Container(
      height: 25.h,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.all(10),
              height: 25.h,
              width: 78.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black38,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('$name',
                      style: GoogleFonts.poppins(
                          color: Colors.white70, fontSize: 20.sp)),
                  Text('Milkyway Galaxy',
                      style: GoogleFonts.poppins(
                          color: Colors.white60, fontSize: 10.sp)),
                  SizedBox(
                      width: 50,
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      )),
                  SizedBox(
                    height: 8.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on,
                          color: Colors.white70, size: 12.sp),
                      SizedBox(
                        width: 2.sp,
                      ),
                      Text('$distance',
                          style: GoogleFonts.poppins(
                              color: Colors.white60, fontSize: 8.sp)),
                    ],
                  ),
                  SizedBox(
                    height: 3.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.line_weight_rounded,
                          color: Colors.white70, size: 12.sp),
                      SizedBox(
                        width: 2.sp,
                      ),
                      Text('$light',
                          style: GoogleFonts.poppins(
                              color: Colors.white60, fontSize: 8.sp)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // planet img
          Align(
            alignment: Alignment.centerLeft,
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(animationController!),
              child: Container(
                margin: EdgeInsets.all(10),
                height: 15.h,
                width: 34.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(
                    '$planetImg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheetContainer(int index,String distance,String light)
  {
    return Container(
      height: 40.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 28.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black54
              ),
              child: Column(
                children: [
                  SizedBox(height: 4.h,),
                  Text('Distance From Earth',style: GoogleFonts.poppins(color: Colors.white54,fontSize: 16.sp)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on,
                          color: Colors.white70, size: 15.sp),
                      SizedBox(
                        width: 5.sp,
                      ),
                      Text('$distance',
                          style: GoogleFonts.poppins(
                              color: Colors.white60, fontSize: 15.sp)),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Text('Gravity On Planet',style: GoogleFonts.poppins(color: Colors.white54,fontSize: 16.sp)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on,
                          color: Colors.white70, size: 15.sp),
                      SizedBox(
                        width: 5.sp,
                      ),
                      Text('$light',
                          style: GoogleFonts.poppins(
                              color: Colors.white60, fontSize: 15.sp)),
                    ],
                  ),
                  TextButton(onPressed: () {
                    Get.toNamed('/open');
                  }, child: Text('Learn more',style: GoogleFonts.poppins(letterSpacing: 1),)),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(animationController!),
              child: Container(
                height: 15.h,
                width: 15.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  //color: Colors.amberAccent
                ),
                child: Image.asset('${homeController.planetImgList[index]}',fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
