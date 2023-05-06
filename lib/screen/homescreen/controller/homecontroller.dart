import 'package:get/get.dart';
import 'package:planet_app/screen/homescreen/model/homemodel.dart';

class HomeController extends GetxController
{
  List planetImgList = [
    'assets/img/sun.png',
    'assets/img/earth.png',
    'assets/img/moon.png',
    'assets/img/mars.png',
    'assets/img/jupiter.png',
    'assets/img/sat.png',
    'assets/img/mercury.png',
    'assets/img/neptune.png',
    'assets/img/pluto.png',
    'assets/img/uranus.png',
    'assets/img/venus.png',
  ];

  List distanceInLight = [
    '274 m/s²',
    '3.721 m/s²',
    '1.62 m/s²',
    '9.689 m/s²',
    '24.79 m/s²',
    '24.79 m/s²',
    '3.7 m/s²',
    '3.7 m/s²',
    '3.7 m/s²',
    '8.87 m/s²',
    '8.87 m/s²',
  ];
  List planetName = [
    'SUN',
    'EARTH',
    'MOON',
    'MARS',
    'JUPITER',
    'SATURN',
    'MERCURY',
    'NEPTUNE',
    'PLUTO',
    'URANUS',
    'VENUS',
  ];
  List distance = [
    '150.88 million km',
    '267.64 million km',
    '384.88 million km',
    '384.88 million km',
    '883.51 million km',
    '883.51 million km',
    '83.801 million km',
    '4.5725 billion km',
    '5.1597 billion km',
    '3.0892 billion km',
    '141.47 million km',
  ];


}