/// Data model representing a full matrimonial profile.
/// Structured for a Muslim matrimonial app (religious, educational,
/// family and personal details). This is a plain read-only data holder —
/// no image picking/upload logic lives here, only a display URL/path.
class UserProfileModel {
  // ---------- Basic / Header ----------
  final String id;
  final String fullName;
  final String profileImageUrl; // network or asset path, display only
  final bool isVerified;
  final int age;
  final String gender; // Male / Female
  final String maritalStatus; // Never Married / Divorced / Widowed
  final String height; // e.g. 5'6"
  final String weight; // e.g. 62 kg
  final String complexion; // Fair / Wheatish / Dark
  final String motherTongue;
  final String city;
  final String state;
  final String country;
  final String bio;

  // ---------- Religious Details ----------
  final String religion; // Islam
  final String sect; // Sunni / Shia / Other
  final String
  maslakFiqh; // Hanafi / Shafi'i / Maliki / Hanbali / Salafi / Ahle Hadith
  final String namazHabit; // Regular (5 times) / Sometimes / Occasionally / No
  final String quranRecitation; // Fluent / Basic / Learning / No
  final bool zakatPayer;
  final bool hajjPerformed;
  final String
  hijabOrBeard; // Wears Hijab/Niqab (female) or Keeps Beard (male) / No
  final String sectPreferenceForMatch; // Same sect only / Any

  // ---------- Education & Career ----------
  final String highestEducation;
  final String fieldOfStudy;
  final String collegeUniversity;
  final String occupation;
  final String employedIn; // Government / Private / Business / Not Working
  final String annualIncome;

  // ---------- Family Details ----------
  final String fatherName;
  final String fatherOccupation;
  final String motherName;
  final String motherOccupation;
  final int numberOfBrothers;
  final int numberOfSisters;
  final String familyType; // Joint / Nuclear
  final String
  familyStatus; // Middle Class / Upper Middle Class / Rich / Affluent
  final String familyValues; // Orthodox / Moderate / Liberal

  // ---------- Lifestyle ----------
  final String diet; // Halal only
  final bool smoker;
  final String maternalNativeCity;

  const UserProfileModel({
    required this.id,
    required this.fullName,
    required this.profileImageUrl,
    required this.isVerified,
    required this.age,
    required this.gender,
    required this.maritalStatus,
    required this.height,
    required this.weight,
    required this.complexion,
    required this.motherTongue,
    required this.city,
    required this.state,
    required this.country,
    required this.bio,
    required this.religion,
    required this.sect,
    required this.maslakFiqh,
    required this.namazHabit,
    required this.quranRecitation,
    required this.zakatPayer,
    required this.hajjPerformed,
    required this.hijabOrBeard,
    required this.sectPreferenceForMatch,
    required this.highestEducation,
    required this.fieldOfStudy,
    required this.collegeUniversity,
    required this.occupation,
    required this.employedIn,
    required this.annualIncome,
    required this.fatherName,
    required this.fatherOccupation,
    required this.motherName,
    required this.motherOccupation,
    required this.numberOfBrothers,
    required this.numberOfSisters,
    required this.familyType,
    required this.familyStatus,
    required this.familyValues,
    required this.diet,
    required this.smoker,
    required this.maternalNativeCity,
  });

  /// Build a model instance from a JSON/Map payload (e.g. API response).
  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id']?.toString() ?? '',
      fullName: json['fullName'] ?? '',
      profileImageUrl: json['profileImageUrl'] ?? '',
      isVerified: json['isVerified'] ?? false,
      age: json['age'] ?? 0,
      gender: json['gender'] ?? '',
      maritalStatus: json['maritalStatus'] ?? '',
      height: json['height'] ?? '',
      weight: json['weight'] ?? '',
      complexion: json['complexion'] ?? '',
      motherTongue: json['motherTongue'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      country: json['country'] ?? '',
      bio: json['bio'] ?? '',
      religion: json['religion'] ?? 'Islam',
      sect: json['sect'] ?? '',
      maslakFiqh: json['maslakFiqh'] ?? '',
      namazHabit: json['namazHabit'] ?? '',
      quranRecitation: json['quranRecitation'] ?? '',
      zakatPayer: json['zakatPayer'] ?? false,
      hajjPerformed: json['hajjPerformed'] ?? false,
      hijabOrBeard: json['hijabOrBeard'] ?? '',
      sectPreferenceForMatch: json['sectPreferenceForMatch'] ?? '',
      highestEducation: json['highestEducation'] ?? '',
      fieldOfStudy: json['fieldOfStudy'] ?? '',
      collegeUniversity: json['collegeUniversity'] ?? '',
      occupation: json['occupation'] ?? '',
      employedIn: json['employedIn'] ?? '',
      annualIncome: json['annualIncome'] ?? '',
      fatherName: json['fatherName'] ?? '',
      fatherOccupation: json['fatherOccupation'] ?? '',
      motherName: json['motherName'] ?? '',
      motherOccupation: json['motherOccupation'] ?? '',
      numberOfBrothers: json['numberOfBrothers'] ?? 0,
      numberOfSisters: json['numberOfSisters'] ?? 0,
      familyType: json['familyType'] ?? '',
      familyStatus: json['familyStatus'] ?? '',
      familyValues: json['familyValues'] ?? '',
      diet: json['diet'] ?? 'Halal',
      smoker: json['smoker'] ?? false,
      maternalNativeCity: json['maternalNativeCity'] ?? '',
    );
  }

  /// Sample/dummy data used until a real API is wired up.
  factory UserProfileModel.dummy() {
    return const UserProfileModel(
      id: 'U10245',
      fullName: 'Farheen Siddiqui',
      profileImageUrl:
          'https://images.unsplash.com/photo-1609505848912-b7c3b8b4beda?q=80&w=765&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      isVerified: true,
      age: 26,
      gender: 'Female',
      maritalStatus: 'Never Married',
      height: '5\'4"',
      weight: '55 kg',
      complexion: 'Fair',
      motherTongue: 'Urdu',
      city: 'Lucknow',
      state: 'Uttar Pradesh',
      country: 'India',
      bio:
          'Assalamu Alaikum. I am a practicing Muslimah, working as a school '
          'teacher. Looking for a God-fearing, family oriented life partner '
          'who follows the Sunnah and respects family values.',
      religion: 'Islam',
      sect: 'Sunni',
      maslakFiqh: 'Hanafi',
      namazHabit: 'Regular (5 times a day)',
      quranRecitation: 'Fluent with Tajweed',
      zakatPayer: true,
      hajjPerformed: false,
      hijabOrBeard: 'Wears Hijab',
      sectPreferenceForMatch: 'Sunni - Hanafi preferred',
      highestEducation: 'B.Ed',
      fieldOfStudy: 'Education',
      collegeUniversity: 'Lucknow University',
      occupation: 'School Teacher',
      employedIn: 'Private',
      annualIncome: '₹4,00,000 - ₹5,00,000',
      fatherName: 'Mohammed Siddiqui',
      fatherOccupation: 'Businessman',
      motherName: 'Rukhsana Siddiqui',
      motherOccupation: 'Homemaker',
      numberOfBrothers: 1,
      numberOfSisters: 2,
      familyType: 'Joint Family',
      familyStatus: 'Middle Class',
      familyValues: 'Moderate, religious values followed',
      diet: 'Halal only',
      smoker: false,
      maternalNativeCity: 'Bareilly, Uttar Pradesh',
    );
  }
}
