import 'package:buga_customer/authentication.dart/signup/createprofile.dart';
import 'package:buga_customer/component/button.dart';
import 'package:buga_customer/component/colors.dart';
import 'package:buga_customer/component/style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountVerified extends StatefulWidget {
  const AccountVerified({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AccountVerifiedState createState() => _AccountVerifiedState();
}

class _AccountVerifiedState extends State<AccountVerified> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();

  email() async {
    final prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    return email;
  }

  @override
  Widget build(BuildContext context) {
    // used to determined the screen size for responsive design

    var screensize = MediaQuery.of(context).size;
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //navigation button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Account Verified',
                            style: style.copyWith(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: screensize.height * 0.1),

                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/check.png',
                          height: 120,
                          width: 120,
                        ),
                      ),
                      SizedBox(height: screensize.height * 0.05),
                      Text(
                        'Congratulations!',
                        style: style.copyWith(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: AppColor.black,
                        ),
                      ),
                      const SizedBox(height: 20),

                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'The email  ',
                          style: style.copyWith(
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: email.toString(),
                              style: style.copyWith(
                                color: AppColor.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' is now a verified account. Thank you for helping us keep your account verified. ',
                              style: style.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screensize.height * 0.08),
                Padding(
                  padding: const EdgeInsets.only(left: 47.0, right: 47.0),
                  child: MainButton(
                    backgroundColor: AppColor.primaryColor,
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CreateProfile(),
                      ),
                    ),
                    child: Text(
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
