// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:foyer_project/device_profile.dart';
import 'package:foyer_project/location_based_profile.dart';
import 'package:foyer_project/profile_bloc.dart';
import 'package:provider/provider.dart';

class ProfileSettingsDialog extends StatefulWidget {
  final Location location;
  final String locationName;

  const ProfileSettingsDialog(
      {Key? key, required this.location, required this.locationName})
      : super(key: key);

  @override
  _ProfileSettingsDialogState createState() => _ProfileSettingsDialogState();
}

class _ProfileSettingsDialogState extends State<ProfileSettingsDialog> {
  Color? _themeColor;
  final textSizeController = TextEditingController();
  final profileNameController = TextEditingController();
  final locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final profileManager = Provider.of<ProfileManager>(context);

    return AlertDialog(
      title: const Text('Profile Settings'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<Color>(
            icon: Container(),
            value: _themeColor,
            onChanged: (color) {
              setState(() {
                _themeColor = color;
              });
            },
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              const DropdownMenuItem<Color>(
                value: Colors.blue,
                child: Text('Blue'),
              ),
              const DropdownMenuItem<Color>(
                value: Colors.red,
                child: Text('Red'),
              ),
              const DropdownMenuItem<Color>(
                value: Colors.green,
                child: Text('Green'),
              ),
              const DropdownMenuItem<Color>(
                value: Colors.yellow,
                child: Text('Yellow'),
              ),
              const DropdownMenuItem<Color>(
                value: Colors.orange,
                child: Text('Orange'),
              ),
              const DropdownMenuItem<Color>(
                value: Colors.purple,
                child: Text('Purple'),
              ),
              const DropdownMenuItem<Color>(
                value: Colors.teal,
                child: Text('Teal'),
              ),
              const DropdownMenuItem<Color>(
                value: Colors.pink,
                child: Text('Pink'),
              ),
              const DropdownMenuItem<Color>(
                value: Colors.cyan,
                child: Text('Cyan'),
              ),
              const DropdownMenuItem<Color>(
                value: Colors.amber,
                child: Text('Amber'),
              ),
              const DropdownMenuItem<Color>(
                value: Colors.indigo,
                child: Text('Indigo'),
              ),
            ],
            decoration: const InputDecoration(labelText: 'Theme Color'),
          ),
          TextField(
            controller: textSizeController,
            decoration: const InputDecoration(labelText: 'Text Size'),
          ),
          TextField(
            controller: profileNameController,
            decoration: const InputDecoration(labelText: 'Profile Name'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            final textSize = double.tryParse(textSizeController.text);

            final profileName = profileNameController.text;

            if (textSize != null) {
              final newProfile = DeviceProfile(
                themeColor: _themeColor,
                textSize: textSize,
                profileName: profileName,
              );

              if (!profileManager.isProfileEmpty(newProfile) &&
                  !profileManager.isProfileDuplicate(
                      newProfile, widget.location) &&
                  !profileManager.isProfileNameDuplicate(newProfile)) {
                profileManager.addProfile(
                  newProfile,
                  widget.location,
                  widget.locationName,
                );
              } else {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Error'),
                    content: const Text('Invalid or duplicate profile.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            } else {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Error'),
                  content: const Text('Invalid text size.'),
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
}
