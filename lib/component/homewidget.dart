import 'package:buga_customer/component/colors.dart';
import 'package:buga_customer/component/style.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.imageUrl,
    required this.onTap,
    required this.text,
    required this.title,
  });
  final String title;
  final String text;
  final String imageUrl;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90,
        width: screensize.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: AppColor.lightGrey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              height: 38,
              width: 34,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screensize.width < 700
                      ? screensize.width / 1.405
                      : screensize.width / 1.18,

                  /// 1.405,
                  child: Row(
                    children: [
                      Text(
                        title,
                        style: style.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColor.black,
                          fontSize: 14,
                        ),
                      ),
                      Expanded(child: Container()),
                      const Icon(Icons.arrow_forward_rounded)
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 48,
                  width: screensize.width / 1.46,
                  child: Text(
                    text,
                    style: style.copyWith(fontSize: 11),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
