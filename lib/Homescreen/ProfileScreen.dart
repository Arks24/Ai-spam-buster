import 'dart:io';

import 'package:ai_spam_call/wigets/appbarAi.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var name = "Katherine swift";
  var email = "helloyouthmind@gmail.com";
  var number = "411-674858587";
  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAi(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 2), // Adjust the offset
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: getImage,
                          icon: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: _image != null
                          ? Image.file(_image!).image
                          : AssetImage('assets/placeholder.png'),
                      radius: 35,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        fontFamily: 'Sansita',
                        color: Color(0xFF969696),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      number,
                      style: TextStyle(
                        fontFamily: 'Sansita',
                        color: Color(0xFF969696),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 2), // Adjust the offset
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Full name",
                        style: TextStyle(
                          fontFamily: 'Sansita',
                          color: Color(0xFF969696),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0x422AB13F),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Please enter your full name",
                            hintStyle: TextStyle(
                              fontSize: 12,
                              color: Color(0x808D98AA),
                              fontFamily: 'Sansita',
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 12.0,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "User Name",
                        style: TextStyle(
                          fontFamily: 'Sansita',
                          color: Color(0xFF969696),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0x422AB13F),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Please enter your user name",
                            hintStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0x808D98AA),
                                fontFamily: 'Sansita',
                                fontWeight: FontWeight.w400),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 12.0,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "E-mail",
                        style: TextStyle(
                          fontFamily: 'Sansita',
                          color: Color(0xFF969696),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0x422AB13F),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Please enter your E-mail",
                            hintStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0x808D98AA),
                                fontFamily: 'Sansita',
                                fontWeight: FontWeight.w400),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 12.0,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Phone number",
                        style: TextStyle(
                          fontFamily: 'Sansita',
                          color: Color(0xFF969696),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0x422AB13F),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Please enter your Phone number",
                            hintStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0x808D98AA),
                                fontFamily: 'Sansita',
                                fontWeight: FontWeight.w400),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 12.0,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 25,
                            width: 88,
                            child: Center(
                              child: Text(
                                "Update Profile",
                                style: TextStyle(
                                  fontFamily: 'Sansita',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xFFC50A0A),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 25,
                            width: 60,
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  fontFamily: 'Sansita',
                                  color: Color(0xFFC50A0A),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFC50A0A)),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
