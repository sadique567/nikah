import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/match_profile_controller.dart';

class MatchProfileView extends GetView<MatchProfileController> {
  const MatchProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MatchProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MatchProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
