import 'package:alnikah/app/model/userProfileModel.dart';
import 'package:get/get.dart';


class FullDetailsScreenController extends GetxController {
  /// The profile currently being viewed (read-only).
  final Rx<UserProfileModel?> profile = Rx<UserProfileModel?>(null);

  /// True while profile data is being fetched.
  final RxBool isLoading = true.obs;

  /// Which accordion/expansion sections are open. Keyed by section title.
  final RxMap<String, bool> expandedSections = <String, bool>{
    'Religious Details': true,
    'Education & Career': true,
    'Family Details': true,
    'Lifestyle': true,
  }.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  void toggleSection(String title) {
    expandedSections[title] = !(expandedSections[title] ?? true);
  }

  /// Loads the profile to display. If a profile id was passed via
  /// Get.arguments, that would normally be used to call an API/repository.
  /// For now this falls back to dummy data so the screen is viewable
  /// immediately without a backend.
  Future<void> loadProfile() async {
    try {
      isLoading.value = true;

      final dynamic args = Get.arguments;
      if (args is UserProfileModel) {
        profile.value = args;
      } else if (args is Map<String, dynamic>) {
        profile.value = UserProfileModel.fromJson(args);
      } else {
        // TODO: Replace with a real repository/API call, e.g.
        // profile.value = await UserRepository().getFullDetails(userId);
        profile.value = UserProfileModel.dummy();
      }
    } finally {
      isLoading.value = false;
    }
  }

  void onSendInterest() {
    Get.snackbar(
      'Interest Sent',
      'Your interest has been sent to ${profile.value?.fullName ?? "this profile"}.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void onShortlist() {
    Get.snackbar(
      'Shortlisted',
      '${profile.value?.fullName ?? "Profile"} added to your shortlist.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}