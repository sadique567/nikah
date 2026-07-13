import 'package:alnikah/app/modules/home_screen/views/home_screen_view.dart';
import 'package:alnikah/app/modules/match_profile/views/match_profile_view.dart';
import 'package:alnikah/app/modules/profile_screen/views/profile_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> screens = const [
    HomeScreenView(),
    MatchProfileView(),
    ProfileScreenView(),
  ];

  Widget getCurrentScreen() => screens[selectedIndex.value];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
