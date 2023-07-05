import 'package:flutter/material.dart';
import 'package:foyer_project/device_profile_settings.dart';
import 'package:foyer_project/location_based_profile.dart';

class NewLocationDialog extends StatelessWidget {
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController locationNameController = TextEditingController();

  NewLocationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Location'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: latitudeController,
            decoration: const InputDecoration(labelText: 'Latitude'),
          ),
          TextField(
            controller: longitudeController,
            decoration: const InputDecoration(labelText: 'Longitude'),
          ),
          TextField(
            controller: locationNameController,
            decoration: const InputDecoration(labelText: 'LocationName'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            final latitude = double.tryParse(latitudeController.text);
            final longitude = double.tryParse(longitudeController.text);
            final locationName = locationNameController.text;

            if (latitude != null &&
                longitude != null &&
                isValidLatitude(latitude) &&
                isValidLongitude(longitude)) {
              showDialog(
                context: context,
                builder: (_) => ProfileSettingsDialog(
                  location: Location(latitude: latitude, longitude: longitude),
                  locationName: locationName,
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Error'),
                  content: const Text('Invalid latitude or longitude.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  bool isValidLatitude(double latitude) {
    return latitude >= -90 && latitude <= 90;
  }

  bool isValidLongitude(double longitude) {
    return longitude >= -180 && longitude <= 180;
  }
}
