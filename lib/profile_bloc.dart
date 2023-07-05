import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:foyer_project/device_profile.dart';
import 'package:foyer_project/location_based_profile.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileManager with ChangeNotifier {
  List<ProfileData> _profiles = [];

  List<ProfileData> get profiles => _profiles;

  Future<void> addProfile(
    DeviceProfile deviceProfile,
    Location location,
    String locationName,
  ) async {
    final profileData = ProfileData(
      deviceProfile: deviceProfile,
      location: location,
      locationName: locationName,
    );

    _profiles.add(profileData);
    await saveProfilesToLocalStorage();

    notifyListeners();
  }

  Future<void> loadProfiles() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final profilesJson = prefs.getString('profiles');

      if (profilesJson != null) {
        final profilesList = json.decode(profilesJson) as List<dynamic>;
        _profiles = profilesList
            .map((profileDataJson) => ProfileData.fromJson(profileDataJson))
            .toList();
      }
    } catch (e) {
      print('Error loading profiles: $e');
    }

    notifyListeners();
  }

  Future<void> saveProfilesToLocalStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final profilesJson =
          json.encode(_profiles.map((profile) => profile.toJson()).toList());

      await prefs.setString('profiles', profilesJson);
    } catch (e) {
      print('Error saving profiles: $e');
    }
  }

  bool isProfileEmpty(DeviceProfile profile) {
    return false;
  }

  bool isProfileDuplicate(DeviceProfile profile, Location location) {
    bool isDuplicate = _profiles.any((profileData) =>
        profileData.deviceProfile.profileName == profile.profileName &&
        profileData.location.latitude == location.latitude &&
        profileData.location.longitude == location.longitude);

    return isDuplicate;
  }

  bool isProfileNameDuplicate(DeviceProfile profile) {
    bool isDuplicate = _profiles.any((profileData) =>
        (profileData.deviceProfile.themeColor == profile.themeColor &&
            profileData.deviceProfile.profileName == profile.profileName));

    return isDuplicate;
  }
}
