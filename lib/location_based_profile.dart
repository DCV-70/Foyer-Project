import 'dart:ui';

import 'package:foyer_project/device_profile.dart';

class ProfileData {
  final DeviceProfile deviceProfile;
  final Location location;
  final String locationName;

  ProfileData({
    required this.deviceProfile,
    required this.location,
    required this.locationName,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      deviceProfile: DeviceProfile(
        profileName: json['profileName'],
        themeColor: Color(json['themeColor']),
        textSize: json['textSize'],
      ),
      location: Location(
        latitude: json['latitude'],
        longitude: json['longitude'],
      ),
      locationName: json['locationName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'themeColor': deviceProfile.themeColor!.value,
      'textSize': deviceProfile.textSize,
      'latitude': location.latitude,
      'longitude': location.longitude,
      'locationName': locationName,
    };
  }
}

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});
}
