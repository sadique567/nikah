import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/edit_user_details_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class EditUserDetailsView extends GetView<EditUserDetailsController> {
  const EditUserDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final double sizedBoxHeight = 10;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text('Edit Your Details'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _profileHeader(context),
                  SizedBox(height: sizedBoxHeight),

                  _sectionCard(
                    title: 'Basic Details',
                    icon: Icons.person_outline,
                    children: [
                      _textField(
                        controller.nameCtrl,
                        'Full Name',
                        required: true,
                      ),
                      SizedBox(height: sizedBoxHeight),
                      _rowTwo(
                        _dropdown(
                          'Gender',
                          controller.genderNotifier,
                          controller.genderOptions,
                          (v) => controller.genderNotifier.value = v,
                        ),

                        _dobPicker(context),
                      ),
                      SizedBox(height: sizedBoxHeight),
                      _rowTwo(
                        _textField(
                          controller.heightCtrl,
                          'Height (cm)',
                          keyboard: TextInputType.number,
                        ),
                        _textField(
                          controller.weightCtrl,
                          'Weight (kg)',
                          keyboard: TextInputType.number,
                        ),
                      ),
                      SizedBox(height: sizedBoxHeight),
                      _dropdown(
                        'Marital Status',
                        controller.maritalStatusNotifier,
                        controller.maritalOptions,
                        (v) => controller.maritalStatusNotifier.value = v!,
                      ),
                    ],
                  ),

                  _sectionCard(
                    title: 'Contact & Address',
                    icon: Icons.location_on_outlined,
                    children: [
                      _textField(
                        controller.emailCtrl,
                        'Email',
                        keyboard: TextInputType.emailAddress,
                        required: true,
                      ),
                      SizedBox(height: sizedBoxHeight),
                      _textField(
                        controller.phoneCtrl,
                        'Phone Number',
                        keyboard: TextInputType.phone,
                        required: true,
                      ),
                      SizedBox(height: sizedBoxHeight),
                      _textField(
                        controller.addressCtrl,
                        'Address',
                        maxLines: 2,
                      ),
                      SizedBox(height: sizedBoxHeight),
                      _rowTwo(
                        _textField(controller.cityCtrl, 'City'),
                        _dropdown(
                          'State',
                          controller.stateNotifier,
                          controller.stateOptions,
                          (v) => controller.stateNotifier.value = v!,
                        ),
                      ),
                      SizedBox(height: sizedBoxHeight),
                      _dropdown(
                        'Country',
                        controller.countryNotifier,
                        controller.countryOptions,
                        (v) => controller.countryNotifier.value = v!,
                      ),
                    ],
                  ),

                  _sectionCard(
                    title: 'Religious Details',
                    icon: Icons.temple_hindu_outlined,
                    children: [
                      _dropdown(
                        'Religion',
                        controller.religionNotifier,
                        controller.religionOptions,
                        (v) => controller.religion.value = v!,
                      ),

                      SizedBox(height: sizedBoxHeight),
                      _rowTwo(
                        _textField(controller.casteCtrl, 'Caste'),
                        _textField(controller.subCasteCtrl, 'Sub-Caste'),
                      ),
                      SizedBox(height: sizedBoxHeight),
                      _textField(controller.gothraCtrl, 'Gothra'),
                      SizedBox(height: sizedBoxHeight),
                      Text('Manglik', style: _labelStyle),
                      Obx(
                        () => _radioRow(
                          controller.manglikOptions,
                          controller.manglik.value,
                          (v) => controller.manglik.value = v!,
                        ),
                      ),
                    ],
                  ),

                  _sectionCard(
                    title: 'Education & Career',
                    icon: Icons.school_outlined,
                    children: [
                      _dropdown(
                        'Highest Education',
                        controller.educationNotifier,
                        controller.educationOptions,
                        (v) => controller.educationNotifier.value = v!,
                      ),

                      SizedBox(height: sizedBoxHeight),
                      _textField(
                        controller.occupationCtrl,
                        'Occupation',
                        required: true,
                      ),
                      SizedBox(height: sizedBoxHeight),
                      _textField(
                        controller.companyCtrl,
                        'Company / Organization',
                      ),
                      SizedBox(height: sizedBoxHeight),
                      _dropdown(
                        'Annual Income',
                        controller.incomeNotifier,
                        controller.incomeOptions,
                        (v) => controller.income.value = v!,
                      ),
                    ],
                  ),

                  _sectionCard(
                    title: 'Family Details',
                    icon: Icons.family_restroom_outlined,
                    children: [
                      _rowTwo(
                        _textField(controller.fatherNameCtrl, "Father's Name"),
                        _textField(controller.motherNameCtrl, "Mother's Name"),
                      ),
                      SizedBox(height: sizedBoxHeight),
                      _textField(
                        controller.siblingsCtrl,
                        'No. of Siblings',
                        keyboard: TextInputType.number,
                      ),
                      SizedBox(height: sizedBoxHeight),
                      Text('Family Type', style: _labelStyle),
                      Obx(
                        () => _radioRow(
                          controller.familyTypeOptions,
                          controller.familyType.value,
                          (v) => controller.familyType.value = v!,
                        ),
                      ),
                    ],
                  ),

                  _sectionCard(
                    title: 'Lifestyle',
                    icon: Icons.spa_outlined,
                    children: [
                      _dropdown(
                        'Diet',
                        controller.dietNotifier,
                        controller.dietOptions,
                        (v) => controller.diet.value = v!,
                      ),
                      SizedBox(height: sizedBoxHeight),
                      Text('Smoking', style: _labelStyle),
                      Obx(
                        () => _radioRow(
                          controller.yesNoOptions,
                          controller.smoking.value,
                          (v) => controller.smoking.value = v!,
                        ),
                      ),
                      SizedBox(height: sizedBoxHeight),
                      Text('Drinking', style: _labelStyle),
                      Obx(
                        () => _radioRow(
                          controller.yesNoOptions,
                          controller.drinking.value,
                          (v) => controller.drinking.value = v!,
                        ),
                      ),
                      SizedBox(height: sizedBoxHeight),
                      _textField(
                        controller.hobbiesCtrl,
                        'Hobbies & Interests',
                        maxLines: 2,
                      ),
                    ],
                  ),

                  _sectionCard(
                    title: 'About',
                    icon: Icons.info_outline,
                    children: [
                      _textField(
                        controller.aboutCtrl,
                        'Tell us about yourself',
                        maxLines: 5,
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(
            () => SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                onPressed: () {
                  //  controller.isLoading.value
                  //   ? null
                  //   : controller.saveDetails,

                  if (controller.isLoading.value) {
                    return;
                  }

                  if (_formKey.currentState == null ||
                      !_formKey.currentState!.validate())
                    return;

                  controller.saveDetails();
                },
                child: controller.isLoading.value
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Save Details',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- Reusable UI pieces ----------------

  Widget _profileHeader(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 48,
            backgroundColor: Colors.grey.shade200,
            child: Icon(Icons.person, size: 52, color: Colors.grey.shade500),
          ),
          Positioned(
            bottom: -2,
            right: -2,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary, // ✅ fixed
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(
                Icons.camera_alt,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: Colors.indigo),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const Divider(height: 10, color: Colors.amberAccent),
          ...children,
        ],
      ),
    );
  }

  Widget _rowTwo(Widget a, Widget b) {
    return Row(
      children: [
        Expanded(child: a),
        const SizedBox(width: 12),
        Expanded(child: b),
      ],
    );
  }

  Widget _textField(
    TextEditingController ctrl,
    String label, {
    bool required = false,
    int maxLines = 1,
    TextInputType keyboard = TextInputType.text,
  }) {
    return TextFormField(
      controller: ctrl,
      maxLines: maxLines,
      keyboardType: keyboard,
      decoration: InputDecoration(
        labelText: required ? '$label *' : label,
        filled: true,
        fillColor: const Color(0xFFF7F8FB),
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      ),
      validator: required
          ? (v) => (v == null || v.trim().isEmpty) ? '$label is required' : null
          : null,
    );
  }

  Widget _dropdown(
    String label,
    ValueNotifier<String?> valueListenable,
    List<String> options,
    ValueChanged<String?> onChanged,
  ) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        labelText: label, // ✅ ab TextFormField jaisa label milega
        filled: true,
        fillColor: const Color(0xFFF7F8FB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      ),
      valueListenable: valueListenable,
      items: options
          .map(
            (o) => DropdownItem<String>(
              value: o,
              child: Text(
                o,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
      buttonStyleData: const FormFieldButtonStyleData(
        // ✅ fixed
        padding: EdgeInsets.symmetric(horizontal: 0),
      ),

      dropdownStyleData: DropdownStyleData(
        maxHeight: 200,
        offset: const Offset(0, -4),
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        // height: 44,
        padding: EdgeInsets.symmetric(horizontal: 5),
      ),

      iconStyleData: const IconStyleData(
        icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black54),
      ),
    );
  }

  // Widget _dropdown(
  //   String label,
  //   ValueNotifier<String?> valueListenable,
  //   List<String> options,
  //   ValueChanged<String?> onChanged,
  // ) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       // Text(label, style: _labelStyle),
  //       // const SizedBox(height: 6),
  //       DropdownButtonHideUnderline(
  //         child: DropdownButton2<String>(
  //           isExpanded: true,

  //           valueListenable: valueListenable,
  //           items: options
  //               .map(
  //                 (o) => DropdownItem<String>(
  //                   value: o,
  //                   child: Text(
  //                     o,
  //                     style: const TextStyle(
  //                       fontSize: 14,
  //                       color: Colors.black87,
  //                     ),
  //                   ),
  //                 ),
  //               )
  //               .toList(),
  //           onChanged: onChanged,
  //           buttonStyleData: ButtonStyleData(
  //             height: 50,
  //             width: double.infinity,
  //             padding: const EdgeInsets.symmetric(horizontal: 14),
  //             decoration: BoxDecoration(
  //               color: const Color(0xFFF7F8FB),
  //               borderRadius: BorderRadius.circular(10),

  //               border: Border.all(),
  //             ),
  //           ),
  //           dropdownStyleData: DropdownStyleData(
  //             width: null,
  //             maxHeight: 300,
  //             padding: const EdgeInsets.symmetric(vertical: 4),

  //             offset: const Offset(0, -4),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(10),
  //               border: Border.all(),

  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.black.withOpacity(0.08),
  //                   blurRadius: 12,
  //                   offset: const Offset(0, 4),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           menuItemStyleData: const MenuItemStyleData(
  //             padding: EdgeInsets.symmetric(horizontal: 14),
  //           ),
  //           // hint: Text(label),
  //           iconStyleData: const IconStyleData(
  //             icon: Icon(
  //               Icons.keyboard_arrow_down_rounded,
  //               color: Colors.black54,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _radioRow(
    List<String> options,
    String groupValue,
    ValueChanged<String?> onChanged,
  ) {
    return Wrap(
      spacing: 4,
      children: options.map((o) {
        return SizedBox(
          width: 110,
          child: RadioListTile<String>(
            dense: true,
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            title: Text(o, style: const TextStyle(fontSize: 13)),
            value: o,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        );
      }).toList(),
    );
  }

  Widget _dobPicker(BuildContext context) {
    return Obx(() {
      final date = controller.dob.value;
      return InkWell(
        onTap: () => controller.pickDob(context),
        borderRadius: BorderRadius.circular(10),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: 'Date of Birth',
            filled: true,
            fillColor: const Color(0xFFF7F8FB),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
          ),
          child: Text(
            date == null
                ? 'Select date'
                : '${date.day}/${date.month}/${date.year}',
            style: TextStyle(
              color: date == null ? Colors.grey.shade600 : Colors.black87,
            ),
          ),
        ),
      );
    });
  }

  TextStyle get _labelStyle => const TextStyle(
    fontSize: 13,
    color: Colors.black54,
    fontWeight: FontWeight.w500,
  );
}
