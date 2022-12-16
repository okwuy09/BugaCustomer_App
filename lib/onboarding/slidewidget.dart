import 'package:buga_customer/component/colors.dart';
import 'package:flutter/material.dart';

class SlideWidget extends StatelessWidget {
  final String imageUrl;
  const SlideWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 68),
        child: Image.asset(
          imageUrl,
        ),
      ),
    );
  }
}
