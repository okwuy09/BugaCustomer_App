import 'package:buga_customer/authentication.dart/signin/signin.dart';
import 'package:buga_customer/authentication.dart/signup/verifymail.dart';
import 'package:buga_customer/component/button.dart';
import 'package:buga_customer/component/colors.dart';
import 'package:buga_customer/component/mytextform.dart';
import 'package:buga_customer/component/social_container.dart';
import 'package:buga_customer/component/style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

TextEditingController _emailField = TextEditingController();
TextEditingController _passwordField = TextEditingController();
TextEditingController _fullName = TextEditingController();

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    // used to determined the screen size for responsive design
    var screensize = MediaQuery.of(context).size;
    //var provider = Provider.of<Authentication>(context);

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
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up!',
                        style: style.copyWith(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Create an account to get started...',
                        style: style.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),

                      SizedBox(height: screensize.height * 0.05),
                      // sign up full name form
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
                        hintText: 'John Doe',
                        autofillHints: const [AutofillHints.name],
                        controller: _fullName,
                        validatior: (input) =>
                            input!.isEmpty ? "Please enter fullname" : null,
                      ),

                      // sign up email form
                      SizedBox(height: screensize.height * 0.03),
                      Text(
                        'Email Address',
                        style: style.copyWith(
                          fontSize: 12.0,
                          color: AppColor.black.withOpacity(0.8),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      MyTextForm(
                        obscureText: false,
                        hintText: 'johnisdoe@me.com',
                        autofillHints: const [AutofillHints.email],
                        controller: _emailField,
                        validatior: (input) => !(input?.contains('@') ?? false)
                            ? "Please enter valid Email"
                            : null,
                      ),

                      // sign up password form

                      SizedBox(height: screensize.height * 0.03),
                      Text(
                        'Password',
                        style: style.copyWith(
                          fontSize: 12.0,
                          color: AppColor.black.withOpacity(0.8),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      MyTextForm(
                        obscureText: _isObscure,
                        controller: _passwordField,
                        hintText: 'password2022',
                        validatior: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Pasword*';
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColor.grey,
                          ),
                          onPressed: () {
                            setState(
                              () {
                                _isObscure = !_isObscure;
                              },
                            );
                          },
                        ),
                      ),
                      //

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.translate(
                            offset: const Offset(-10, 0),
                            child: Checkbox(
                              checkColor: AppColor.white,
                              activeColor: AppColor.red,
                              visualDensity: VisualDensity.compact,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              value: ischecked,
                              onChanged: (value) {
                                setState(() {
                                  ischecked = value!;
                                });
                              },
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'I agree to the ',
                              style: style.copyWith(
                                fontSize: 12,
                              ),
                              children: [
                                TextSpan(
                                  text: 'terms of service',
                                  style: style.copyWith(
                                    color: AppColor.red,
                                    fontSize: 12,
                                  ),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: style.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                                TextSpan(
                                  text: 'privacy policies.',
                                  style: style.copyWith(
                                    color: AppColor.red,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(height: screensize.height * 0.08),
                // navigate to sign in page, if you have account already
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 47.0, right: 47.0),
                      child: Column(
                        children: [
                          MainButton(
                            backgroundColor: ischecked
                                ? AppColor.primaryColor
                                : AppColor.inactiveButton,
                            onTap: () async {
                              if (_globalFormKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const VerifyEmailPage(),
                                  ),
                                );
                              }

                              // final prefs =
                              //     await SharedPreferences.getInstance();
                              // prefs.setString('email', _emailField.text);
                              // prefs.setString('password', _passwordField.text);
                              // prefs.setString('name', _fullName.text);
                              // setState(() {});
                              // await _getToken();
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                                style: style.copyWith(
                                  color: AppColor.darkGrey,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 3),
                              InkWell(
                                onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SignIn(),
                                  ),
                                ),
                                child: Text(
                                  'Log In',
                                  style: style.copyWith(
                                    color: AppColor.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                SizedBox(height: screensize.height * 0.06),
                // divider with centered 'OR'.
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColor.grey.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'or sign up with',
                        style:
                            style.copyWith(fontSize: 12, color: AppColor.grey),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Divider(
                          color: AppColor.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),

                // Sign in with google 0r apple
                SizedBox(height: screensize.height * 0.06),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        child: const SocialContainer(
                          text: 'Facebook',
                          textlogo: 'f',
                        ),
                        onTap: () {},
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        child: const SocialContainer(
                          text: 'Google',
                          textlogo: 'G',
                        ),
                        onTap: () {},
                      ),
                    ],
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
