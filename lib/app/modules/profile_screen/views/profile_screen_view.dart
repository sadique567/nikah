import 'package:alnikah/app/model/userProfileModel.dart';
import 'package:alnikah/app/modules/full_details_screen/views/detailSectionCard.dart';
import 'package:alnikah/app/routes/app_pages.dart';
import 'package:alnikah/app/utils/common_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  const ProfileScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: const Text(
          'Profile Details',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        leading: mybackButton(color: Colors.white),
        automaticallyImplyActions: false,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.EDIT_USER_DETAILS);
              // EasyLoading.showInfo("Pending");
            },
            icon: Icon(Icons.edit, color: Colors.white),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: primaryColor));
        }

        final UserProfileModel? profile = controller.profile.value;
        if (profile == null) {
          return const Center(child: Text('No profile data found.'));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(context, profile),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  children: [
                    if (profile.bio.trim().isNotEmpty)
                      _buildAboutCard(context, profile),
                    _buildBasicDetailsCard(profile),
                    _buildReligiousDetailsCard(profile),
                    _buildEducationCareerCard(profile),
                    _buildFamilyDetailsCard(profile),
                    _buildLifestyleCard(profile),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
      // bottomNavigationBar: Obx(() {
      //   if (controller.isLoading.value || controller.profile.value == null) {
      //     return const SizedBox.shrink();
      //   }
      //   return _buildBottomActions(primaryColor);
      // }),
    );
  }

  // ---------------------------------------------------------------------
  // Header: photo, name, quick facts
  Widget _buildHeader(BuildContext context, UserProfileModel profile) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          ReadOnlyProfileAvatar(
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP3Hgl1gBi1gBPt3eNGiNdQ5szfQhWdnv-xG1ZJzLYSBe7L1n9bJeCVX_u&s=10",
            radius: 120,
            fullName: profile.fullName,
            // isVerified: profile.isVerified,
          ),
          const SizedBox(height: 14),
          Text(
            "Narender Modi (PM)",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '75 yrs • ${profile.height} • ${profile.maritalStatus}',
            style: const TextStyle(fontSize: 13.5, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: 14,
                color: Theme.of(context).secondaryHeaderColor,
              ),
              const SizedBox(width: 4),
              Text(
                'New Delhi , Delhi IN',
                style: const TextStyle(fontSize: 13, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              QuickFactChip(
                icon: Icons.mosque,
                label: '${profile.sect} • ${profile.maslakFiqh}',
              ),
              QuickFactChip(icon: Icons.school, label: "10 failed"),
              QuickFactChip(icon: Icons.work, label: "Worst PM"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAboutCard(BuildContext context, UserProfileModel profile) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 7),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 1,
            offset: const Offset(-1, 1),
          ),
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 1,
            offset: const Offset(1, -1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1C1C1E),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            profile.bio,
            style: TextStyle(
              fontSize: 14,
              // color: Colors.,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Basic details
  // ---------------------------------------------------------------------
  Widget _buildBasicDetailsCard(UserProfileModel profile) {
    return Obx(
      () => DetailSectionCard(
        title: 'Basic Details',
        icon: Icons.person_outline,
        isExpanded: controller.expandedSections['Basic Details'] ?? true,
        onToggle: () => controller.toggleSection('Basic Details'),
        children: [
          DetailRow(
            label: 'Age',
            value: '${profile.age} yrs',
            icon: Icons.date_range,
          ),
          DetailRow(label: 'Gender', value: profile.gender, icon: Icons.person),
          DetailRow(label: 'Height', value: profile.height, icon: Icons.height),
          DetailRow(
            label: 'Weight',
            value: profile.weight,
            icon: Icons.line_weight,
          ),

          DetailRow(
            label: 'Marital Status',
            value: profile.maritalStatus,
            icon: Icons.date_range,
          ),
          DetailRow(
            label: 'Mother Tongue',
            value: profile.motherTongue,
            icon: Icons.language,
          ),
          DetailRow(
            label: 'City',
            value: profile.city,
            icon: Icons.location_city,
          ),
          DetailRow(
            label: 'State',
            value: profile.state,
            icon: Icons.location_history,
          ),
          DetailRow(
            label: 'Country',
            value: profile.country,
            icon: Icons.countertops,
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Religious details (Muslim specific)
  // ---------------------------------------------------------------------
  Widget _buildReligiousDetailsCard(UserProfileModel profile) {
    return Obx(
      () => DetailSectionCard(
        title: 'Religious Details',
        icon: Icons.mosque_outlined,
        isExpanded: controller.expandedSections['Religious Details'] ?? true,
        onToggle: () => controller.toggleSection('Religious Details'),
        children: [
          DetailRow(label: 'Religion', value: profile.religion),
          DetailRow(label: 'Sect', value: profile.sect),
          DetailRow(label: 'Maslak / Fiqh', value: profile.maslakFiqh),
          DetailRow(label: 'Namaz (Prayer)', value: profile.namazHabit),
          DetailRow(label: 'Quran Recitation', value: profile.quranRecitation),
          DetailRow(
            label: 'Zakat Payer',
            value: profile.zakatPayer ? 'Yes' : 'No',
          ),
          DetailRow(
            label: 'Hajj Performed',
            value: profile.hajjPerformed ? 'Yes' : 'No',
          ),
          DetailRow(
            label: profile.gender.toLowerCase() == 'female' ? 'Hijab' : 'Beard',
            value: profile.hijabOrBeard,
          ),
          DetailRow(
            label: 'Sect Preference for Match',
            value: profile.sectPreferenceForMatch,
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Education & career
  // ---------------------------------------------------------------------
  Widget _buildEducationCareerCard(UserProfileModel profile) {
    return Obx(
      () => DetailSectionCard(
        title: 'Education & Career',
        icon: Icons.school_outlined,
        isExpanded: controller.expandedSections['Education & Career'] ?? true,
        onToggle: () => controller.toggleSection('Education & Career'),
        children: [
          DetailRow(
            label: 'Highest Education',
            value: profile.highestEducation,
          ),
          DetailRow(label: 'Field of Study', value: profile.fieldOfStudy),
          DetailRow(
            label: 'College / University',
            value: profile.collegeUniversity,
          ),
          DetailRow(label: 'Occupation', value: profile.occupation),
          DetailRow(label: 'Employed In', value: profile.employedIn),
          DetailRow(label: 'Annual Income', value: profile.annualIncome),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Family details
  // ---------------------------------------------------------------------
  Widget _buildFamilyDetailsCard(UserProfileModel profile) {
    return Obx(
      () => DetailSectionCard(
        title: 'Family Details',
        icon: Icons.family_restroom_outlined,
        isExpanded: controller.expandedSections['Family Details'] ?? true,
        onToggle: () => controller.toggleSection('Family Details'),
        children: [
          DetailRow(label: "Father's Name", value: profile.fatherName),
          DetailRow(
            label: "Father's Occupation",
            value: profile.fatherOccupation,
          ),
          DetailRow(label: "Mother's Name", value: profile.motherName),
          DetailRow(
            label: "Mother's Occupation",
            value: profile.motherOccupation,
          ),
          DetailRow(label: 'Brothers', value: '${profile.numberOfBrothers}'),
          DetailRow(label: 'Sisters', value: '${profile.numberOfSisters}'),
          DetailRow(label: 'Family Type', value: profile.familyType),
          DetailRow(label: 'Family Status', value: profile.familyStatus),
          DetailRow(label: 'Family Values', value: profile.familyValues),
          DetailRow(label: 'Native Place', value: profile.maternalNativeCity),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Lifestyle
  // ---------------------------------------------------------------------
  Widget _buildLifestyleCard(UserProfileModel profile) {
    return Obx(
      () => DetailSectionCard(
        title: 'Lifestyle',
        icon: Icons.spa_outlined,
        isExpanded: controller.expandedSections['Lifestyle'] ?? true,
        onToggle: () => controller.toggleSection('Lifestyle'),
        children: [
          DetailRow(label: 'Diet', value: profile.diet),
          DetailRow(label: 'Smoker', value: profile.smoker ? 'Yes' : 'No'),
        ],
      ),
    );
  }
}
