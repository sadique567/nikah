import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/terms_condition_screen_controller.dart';

class TermsConditionScreenView extends GetView<TermsConditionScreenController> {
  const TermsConditionScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).secondaryHeaderColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.description_outlined,
                              color: Theme.of(context).secondaryHeaderColor,
                              size: 26,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Terms & Conditions",
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).secondaryHeaderColor,

                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),

                                  // style: Theme.of(context).textTheme.titleLarge
                                  //     ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  "Last updated: July 15, 2026",
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 12.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const Divider(height: 32),

                      _sectionTitle(context, "1. Acceptance of Terms"),
                      _sectionBody(
                        "By creating an account or using this application "
                        "(\"App\"), you agree to be bound by these Terms & "
                        "Conditions and our Privacy Policy. If you do not "
                        "agree to these terms, please do not use the App.",
                      ),

                      _sectionTitle(context, "2. Eligibility"),
                      _sectionBody(
                        "You must be at least 18 years of age and legally "
                        "competent to enter into a binding contract under "
                        "applicable law to register and use this App. By "
                        "registering, you confirm that all information "
                        "provided is accurate, current, and belongs to you "
                        "or the individual you are authorized to represent.",
                      ),

                      _sectionTitle(context, "3. Account Registration"),
                      _sectionBody(
                        "You are responsible for maintaining the "
                        "confidentiality of your account credentials and "
                        "for all activities that occur under your account. "
                        "We reserve the right to suspend or terminate "
                        "accounts that provide false or misleading "
                        "information.",
                      ),

                      _sectionTitle(
                        context,
                        "4. Profile Content & Verification",
                      ),
                      _sectionBody(
                        "You are solely responsible for the accuracy of "
                        "the information and photographs you upload. We do "
                        "not guarantee the identity, marital status, or "
                        "intentions of any user. Exercise independent "
                        "judgment before entering into any commitment with "
                        "another user.",
                      ),

                      _sectionTitle(context, "5. User Conduct"),
                      _sectionBody(
                        "You agree not to create fake or duplicate "
                        "profiles, harass or abuse other users, post "
                        "unlawful content, solicit commercially, or "
                        "request money transfers from other users under "
                        "any circumstance.",
                      ),

                      _sectionTitle(context, "6. Subscriptions & Payments"),
                      _sectionBody(
                        "Certain features may require a paid subscription. "
                        "All fees are displayed prior to purchase and are "
                        "non-refundable except as required by applicable "
                        "law.",
                      ),

                      _sectionTitle(
                        context,
                        "7. No Guarantee of Match Outcome",
                      ),
                      _sectionBody(
                        "This App facilitates introductions between users "
                        "seeking matrimonial partners. We do not guarantee "
                        "you will find a match, and we are not responsible "
                        "for the outcome of any relationship arising from "
                        "use of the App.",
                      ),

                      _sectionTitle(context, "8. Privacy"),
                      _sectionBody(
                        "Your use of the App is governed by our Privacy "
                        "Policy, which explains how we collect, use, and "
                        "protect your personal information.",
                      ),

                      _sectionTitle(context, "9. Limitation of Liability"),
                      _sectionBody(
                        "To the maximum extent permitted by law, we are "
                        "not liable for any damages arising from your "
                        "interactions or transactions with other users.",
                      ),

                      _sectionTitle(context, "10. Changes to These Terms"),
                      _sectionBody(
                        "We may update these Terms from time to time. "
                        "Continued use of the App after changes are posted "
                        "constitutes acceptance of the revised terms.",
                      ),

                      _sectionTitle(context, "11. Contact Us"),
                      _sectionBody(
                        "If you have questions about these Terms, please "
                        "contact our support team through the App's Help "
                        "& Support section.",
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Bottom action area
            Container(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => controller.toggleAgreement(
                          !controller.isAgreed.value,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Checkbox(
                                value: controller.isAgreed.value,
                                activeColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                onChanged: controller.toggleAgreement,
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 13.5,
                                      color: Colors.grey.shade800,
                                      height: 1.4,
                                    ),
                                    children: const [
                                      TextSpan(
                                        text: "I have read and agree to the ",
                                      ),
                                      TextSpan(
                                        text: "Terms & Conditions",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(text: " and Privacy Policy"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed:
                              controller.isAgreed.value &&
                                  !controller.isLoading.value
                              ? controller.acceptAndContinue
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            disabledBackgroundColor: Colors.grey,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: controller.isLoading.value
                              ? const SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.4,
                                  ),
                                )
                              : const Text(
                                  "Accept & Continue",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).secondaryHeaderColor,
        ),
      ),
    );
  }

  Widget _sectionBody(String body) {
    return Text(
      body,
      style: TextStyle(
        fontSize: 13.5,
        height: 1.55,
        color: Colors.grey.shade700,
      ),
    );
  }
}
