import 'package:flutter/material.dart';
import 'package:foyer_project/app_styles.dart';
import 'package:foyer_project/new_location.dart';
import 'package:foyer_project/profile_bloc.dart';
import 'package:provider/provider.dart';

import 'profiles_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileManager = Provider.of<ProfileManager>(context);

    if (profileManager.profiles.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 196, 230, 157),
          title: const Text('User Profiles'),
        ),
        body: const Center(
          child: Text('No profiles available.'),
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              child: Container(
                height: 40,
                width: 150,
                color: App.buttonColor,
                child: const Center(
                  child: Text(
                    'Add New Location',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => NewLocationDialog(),
                );
              },
            )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 196, 230, 157),
        title: const Text('User Profiles'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: profileManager.profiles.length,
                itemBuilder: (context, index) {
                  final profile = profileManager.profiles[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        tileColor: profile.deviceProfile.themeColor,
                        title: Text(profile.deviceProfile.profileName),
                        subtitle: Text(profile.locationName),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ProfileDetailsPage(profile: profile),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const Divider(),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                child: Container(
                  height: 40,
                  width: 150,
                  color: const Color.fromARGB(255, 196, 230, 157),
                  child: const Center(
                    child: Text(
                      'Add New Location',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => NewLocationDialog(),
                  );
                },
              )),
        ],
      ),
    );
  }
}
