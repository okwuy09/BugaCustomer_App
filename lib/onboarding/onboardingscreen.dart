import 'package:buga_customer/authentication.dart/signin/signin.dart';
import 'package:buga_customer/authentication.dart/signup/signup.dart';
import 'package:buga_customer/component/button.dart';
import 'package:buga_customer/component/colors.dart';
import 'package:buga_customer/component/style.dart';
import 'package:buga_customer/onboarding/slidewidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  int pageIndex = 0;

//dispose the pageView controller
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: AppColor.white,
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          children: [
            //const SizedBox(height: 30),

            SizedBox(
              height: screensize.height / 2.1,
              child: pageIndex == 0
                  ? const SlideWidget(imageUrl: 'assets/first.png')
                  : pageIndex == 1
                      ? const SlideWidget(imageUrl: 'assets/second.png')
                      : const SlideWidget(imageUrl: 'assets/third.png'),
            ),
            const SizedBox(height: 35),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  expansionFactor: 1.1,
                  radius: 500,
                  dotWidth: 6,
                  dotHeight: 6,
                  spacing: 5,
                  dotColor: AppColor.lightGrey,
                  activeDotColor: AppColor.primaryColor,
                ),
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn),
              ),
            ),
            const SizedBox(height: 35),
            SizedBox(
              height: 200,
              child: PageView(
                onPageChanged: (index) {
                  setState(() => pageIndex = index);
                },
                controller: controller,
                children: [
                  /// first slide
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screensize.width / 5),
                    child: Column(
                      children: [
                        Text(
                          'Order Pick-Up',
                          style: style.copyWith(
                            fontSize: 24,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Order for your packages pick-up straight from the app.',
                          style: style.copyWith(
                              fontSize: 14, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),

                  /// second slide
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screensize.width / 5),
                    child: Column(
                      children: [
                        Text(
                          'In-App Tracker',
                          style: style.copyWith(
                            fontSize: 24,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Track the driver until the goods are delivered.',
                          style: style.copyWith(
                              fontSize: 14, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),

                  /// third slide
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screensize.width / 5),
                    child: Column(
                      children: [
                        Text(
                          'Express Delivery',
                          style: style.copyWith(
                            fontSize: 24,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Get your goods delivered to you quick and easy...',
                          style: style.copyWith(
                              fontSize: 14, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 47),
        color: AppColor.white,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Column(
                children: [
                  MainButton(
                    backgroundColor: AppColor.primaryColor,
                    onTap: () async {
                      // final prefs = await SharedPreferences.getInstance();
                      // prefs.setBool('showHome', true).then(
                      //       (value) => Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (_) => const SignUp(),
                      //         ),
                      //       ),
                      //     );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignUp(),
                        ),
                      );
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
                  const SizedBox(height: 10),
                  MainButton(
                    backgroundColor: AppColor.white,
                    onTap: () async {
                      // final prefs = await SharedPreferences.getInstance();
                      // prefs.setBool('showHome', true).then(
                      //       (value) => Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (_) => const SignIn(),
                      //         ),
                      //       ),
                      //     );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignIn(),
                        ),
                      );
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
