import 'package:buga_customer/authentication.dart/signup/accountverified.dart';
import 'package:buga_customer/component/button.dart';
import 'package:buga_customer/component/colors.dart';
import 'package:buga_customer/component/style.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //navigation button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          SizedBox(width: screensize.width / 6),
                          Text(
                            'Verify Your Email',
                            style: style.copyWith(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: screensize.height * 0.03),

                      Text(
                        'We have sent you a mail. Please click on the link in the message to verify your email address so that you can access the App.',
                        style: style.copyWith(
                          fontSize: 14,
                        ),
                      ),

                      SizedBox(height: screensize.height * 0.05),

                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/emailsent.png',
                          height: 200,
                          width: 224,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: screensize.height * 0.1),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 47.0, right: 47.0),
                      child: MainButton(
                        backgroundColor: AppColor.primaryColor,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AccountVerified(),
                          ),
                        ),
                        child: Text(
                          'Check Your Mail',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        text: 'Didn’t receive the mail? ',
                        style: style.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            text: 'Check your spam folder.',
                            style: style.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
