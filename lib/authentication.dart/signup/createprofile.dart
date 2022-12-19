import 'dart:io';

import 'package:buga_customer/component/button.dart';
import 'package:buga_customer/component/colors.dart';
import 'package:buga_customer/component/mytextform.dart';
import 'package:buga_customer/component/style.dart';
import 'package:buga_customer/homepage/bottomnarvbar.dart';
import 'package:buga_customer/services/provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();

  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _fullName = TextEditingController();
  String _gender = 'Select Option';
  String _countryCode = '+1';
  String _age = 'Select Option';
  String _location = 'Select Option';
  final picker = ImagePicker();
  XFile? profileImage;

  pickImage(
    ImageSource source,
  ) async {
    final pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 50,
      maxHeight: 700,
      maxWidth: 650,
    );
    if (mounted) {
      setState(() {
        profileImage = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // used to determined the screen size for responsive design
    var screensize = MediaQuery.of(context).size;
    var provider = Provider.of<Authentication>(context);

    return Scaffold(
      backgroundColor: AppColor.white,
      body: ListView(
        children: [
          Form(
            key: _globalFormKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //navigation button
                      Text(
                        'Let’s get you started!',
                        style: style.copyWith(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Kindly set up your account with the next few steps. Data privacy and security is assured...',
                        style: style.copyWith(
                          fontSize: 14.0,
                        ),
                      ),

                      SizedBox(height: screensize.height * 0.03),

                      Align(
                        alignment: Alignment.center,
                        child: profileImage == null
                            ? Stack(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: AppColor.lightGrey,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  Positioned(
                                    top: 24,
                                    left: 27,
                                    child: GestureDetector(
                                      onTap: (() =>
                                          pickImage(ImageSource.gallery)),
                                      child: Image.asset(
                                        'assets/camera.png',
                                        height: 36,
                                        width: 35,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : Stack(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: AppColor.lightGrey,
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                        image: FileImage(
                                          File(profileImage!.path),
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 6,
                                    right: 3,
                                    child: GestureDetector(
                                      onTap: (() =>
                                          pickImage(ImageSource.gallery)),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 24,
                                            width: 24,
                                            decoration: BoxDecoration(
                                              color: AppColor.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                          Positioned(
                                            left: 5,
                                            top: 4,
                                            child: Image.asset(
                                              'assets/camera.png',
                                              height: 14,
                                              width: 14,
                                              color: AppColor.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                      ),
                      // signin email form
                      SizedBox(height: screensize.height * 0.025),
                      Text(
                        'Full Name',
                        style: style.copyWith(
                          fontSize: 12.0,
                          color: AppColor.black.withOpacity(0.8),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      MyTextForm(
                        obscureText: false,
                        hintText: 'Caramel Coker',
                        autofillHints: const [AutofillHints.name],
                        controller: _fullName,
                        validatior: (input) =>
                            input!.isEmpty ? "Please Enter Fullname" : null,
                      ),

                      ///
                      SizedBox(height: screensize.height * 0.015),
                      Text(
                        'Phone Number',
                        style: style.copyWith(
                          fontSize: 12.0,
                          color: AppColor.black.withOpacity(0.8),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  iconEnabledColor: AppColor.grey,
                                  underline:
                                      const Divider(color: Colors.transparent),
                                  value: _countryCode,
                                  style: style.copyWith(fontSize: 14),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _countryCode = newValue!;
                                    });
                                  },
                                  items: <String>['+1', '+234', '+256']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: MyTextForm(
                              obscureText: false,
                              hintText: '111-1111-111',
                              autofillHints: const [
                                AutofillHints.telephoneNumber
                              ],
                              keyboardType: TextInputType.phone,
                              controller: _phoneNo,
                              validatior: (input) => input!.isEmpty
                                  ? "Please Enter phoneNo."
                                  : null,
                            ),
                          ),
                        ],
                      ),

                      ///
                      SizedBox(height: screensize.height * 0.015),
                      Text(
                        'Gender',
                        style: style.copyWith(
                          fontSize: 12.0,
                          color: AppColor.black.withOpacity(0.8),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Container(
                        height: 48,
                        width: screensize.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              iconEnabledColor: AppColor.grey,
                              underline:
                                  const Divider(color: Colors.transparent),
                              value: _gender,
                              style: style.copyWith(fontSize: 14),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _gender = newValue!;
                                });
                              },
                              items: <String>[
                                'Select Option',
                                'Male',
                                'Female',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),

                      /// Age
                      SizedBox(height: screensize.height * 0.015),
                      Text(
                        'Age',
                        style: style.copyWith(
                          fontSize: 12.0,
                          color: AppColor.black.withOpacity(0.8),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Container(
                        height: 48,
                        width: screensize.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              menuMaxHeight: screensize.height / 2.2,
                              iconEnabledColor: AppColor.grey,
                              underline:
                                  const Divider(color: Colors.transparent),
                              value: _age,
                              style: style.copyWith(fontSize: 14),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _age = newValue!;
                                });
                              },
                              items: <String>[
                                'Select Option',
                                '18',
                                '22',
                                '24',
                                '26',
                                '28',
                                '30',
                                '32',
                                '34',
                                '36',
                                '38',
                                '40',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),

                      /// Location
                      SizedBox(height: screensize.height * 0.015),
                      Text(
                        'Location',
                        style: style.copyWith(
                          fontSize: 12.0,
                          color: AppColor.black.withOpacity(0.8),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Container(
                        height: 48,
                        width: screensize.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              iconEnabledColor: AppColor.grey,
                              underline:
                                  const Divider(color: Colors.transparent),
                              value: _location,
                              style: style.copyWith(fontSize: 14),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _location = newValue!;
                                });
                              },
                              items: <String>[
                                'Select Option',
                                'Enugu State',
                                'Lagos State',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screensize.height * 0.06),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 47.0,
                    right: 47.0,
                    bottom: 10,
                  ),
                  child: MainButton(
                    backgroundColor: (_fullName.text.isNotEmpty &&
                            _phoneNo.text.isNotEmpty &&
                            _age != 'Select Option' &&
                            _location != 'Select Option' &&
                            _gender != 'Select Option' &&
                            profileImage != null)
                        ? AppColor.primaryColor
                        : AppColor.inactiveButton,
                    onTap: () async {
                      if (_globalFormKey.currentState!.validate() &&
                          (_age != 'Select Option' &&
                              _location != 'Select Option' &&
                              _gender != 'Select Option' &&
                              profileImage != null)) {
                        final prefs = await SharedPreferences.getInstance();
                        var email = prefs.getString('email');
                        var password = prefs.getString('password');
                        var fullName = prefs.getString('name');
                        await provider.signUp(
                            email: email!,
                            password: password!,
                            fullName: fullName!,
                            phoneNumber: _phoneNo.text,
                            gender: _gender,
                            profileImage: profileImage,
                            age: _age,
                            location: _location,
                            context: context);
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => const BottomNavBar(),
                        //   ),
                        // );
                      }
                    },
                    child: provider.isSignUp
                        ? buttonCircularIndicator
                        : Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
