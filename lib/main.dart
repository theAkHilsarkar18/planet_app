import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_app/screen/homescreen/view/homescreen.dart';
import 'package:planet_app/screen/openscreen/view/openscreen.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            getPages: [
              GetPage(name: '/',page: () => Homescreen(),transition: Transition.downToUp),
              GetPage(name: '/open',page: () => Openscreen(),transition: Transition.downToUp),
            ],
          );
        }
    )
  );
}