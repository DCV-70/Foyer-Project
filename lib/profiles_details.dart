// ignore_for_file: unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:foyer_project/location_based_profile.dart';

class ProfileDetailsPage extends StatefulWidget {
  final ProfileData profile;

  const ProfileDetailsPage({Key? key, required this.profile}) : super(key: key);

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  double textSize = 14;

  @override
  Widget build(BuildContext context) {
    textSize = widget.profile.deviceProfile.textSize;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        elevation: 0,
        title: const Text('Profile Details'),
        backgroundColor: widget.profile.deviceProfile.themeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Center(
              child: Text(
                '${widget.profile.deviceProfile.profileName}',
                style:
                    TextStyle(fontSize: textSize, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Theme Color : ',
                    style: TextStyle(
                        fontSize: textSize, fontWeight: FontWeight.normal),
                  ),
                  Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: widget.profile.deviceProfile.themeColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Location : ',
                    style: TextStyle(
                        fontSize: textSize, fontWeight: FontWeight.normal),
                  ),
                  Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: widget.profile.deviceProfile.themeColor),
                    child: Center(
                        child: Text(
                      widget.profile.locationName,
                      style: TextStyle(fontSize: textSize),
                    )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latitude : ',
                    style: TextStyle(
                        fontSize: textSize, fontWeight: FontWeight.normal),
                  ),
                  Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: widget.profile.deviceProfile.themeColor),
                    child: Center(
                        child: Text(
                      '${widget.profile.location.latitude}',
                      style: TextStyle(fontSize: textSize),
                    )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Longitude : ',
                    style: TextStyle(
                        fontSize: textSize, fontWeight: FontWeight.normal),
                  ),
                  Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: widget.profile.deviceProfile.themeColor),
                    child: Center(
                        child: Text(
                      '${widget.profile.location.longitude}',
                      style: TextStyle(fontSize: textSize),
                    )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Text Size : ',
                    style: TextStyle(
                        fontSize: textSize, fontWeight: FontWeight.normal),
                  ),
                  Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: widget.profile.deviceProfile.themeColor,
                    ),
                    child: Center(
                        child: Text(
                      '${widget.profile.deviceProfile.textSize}',
                      style: TextStyle(fontSize: textSize),
                    )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
