import 'package:buga_customer/component/button.dart';
import 'package:buga_customer/component/colors.dart';
import 'package:buga_customer/component/popover.dart';
import 'package:buga_customer/component/style.dart';
import 'package:flutter/material.dart';

class PopupSheet extends StatefulWidget {
  final Widget child;
  final String title;
  final String text;
  final String buttonText;
  final Function()? onTap;
  const PopupSheet({
    Key? key,
    required this.child,
    required this.text,
    required this.title,
    required this.buttonText,
    this.onTap,
  }) : super(key: key);

  @override
  State<PopupSheet> createState() => _PopupSheetState();
}

class _PopupSheetState extends State<PopupSheet> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //var provider = Provider.of<AppData>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _globalFormKey,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.only(
                left: 28,
                right: 28,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      widget.title,
                      style: style.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  widget.child,
                  const SizedBox(height: 30),
                  Text(
                    widget.text,
                    style: style.copyWith(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 20,
                    ),
                    child: MainButton(
                      backgroundColor: AppColor.primaryColor,
                      onTap: widget.onTap,
                      child: Text(
                        widget.buttonText,
                        style: style.copyWith(
                          fontSize: 14,
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
