import 'package:buga_customer/component/button.dart';
import 'package:buga_customer/component/colors.dart';
import 'package:buga_customer/component/mytextform.dart';
import 'package:buga_customer/component/popsheet.dart';
import 'package:buga_customer/component/style.dart';
import 'package:buga_customer/homepage/bottomnarvbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();

  final TextEditingController _pickUpAddress = TextEditingController();
  final TextEditingController _deliveryAddress = TextEditingController();
  final TextEditingController _goodsWeight = TextEditingController();
  final TextEditingController _length = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _quantity = TextEditingController();

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
                            'Get A Quote',
                            style: style.copyWith(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Fill in the details below to get an estimated price for your package(s)',
                        style: style.copyWith(
                          fontSize: 14.0,
                        ),
                      ),

                      SizedBox(height: screensize.height * 0.02),
                      Row(
                        children: [
                          Text(
                            'Location',
                            style: style.copyWith(
                              fontSize: 14,
                              color: AppColor.black,
                            ),
                          ),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.add,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ],
                      ),

                      // pick-up Adress form
                      const SizedBox(height: 6),

                      RichText(
                        text: TextSpan(
                          text: 'Pick-Up Address',
                          style: style.copyWith(
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                              text: '*',
                              style: style.copyWith(
                                color: AppColor.red,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MyTextForm(
                        obscureText: false,
                        hintText: 'Enter pick-up address',
                        autofillHints: const [
                          AutofillHints.addressCityAndState
                        ],
                        controller: _pickUpAddress,
                        validatior: (input) => input!.isEmpty
                            ? "Please Enter pick-up address"
                            : null,
                      ),

                      /// delivery addess
                      SizedBox(height: screensize.height * 0.02),
                      RichText(
                        text: TextSpan(
                          text: 'Delivery Address',
                          style: style.copyWith(
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                              text: '*',
                              style: style.copyWith(
                                color: AppColor.red,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MyTextForm(
                        obscureText: false,
                        hintText: 'Enter delivery address',
                        controller: _deliveryAddress,
                        autofillHints: const [
                          AutofillHints.addressCityAndState
                        ],
                        validatior: (input) => input!.isEmpty
                            ? "Please Enter Delivery Address"
                            : null,
                      ),

                      /// packages section
                      SizedBox(height: screensize.height * 0.03),
                      Row(
                        children: [
                          Text(
                            'Package',
                            style: style.copyWith(
                              fontSize: 14,
                              color: AppColor.black,
                            ),
                          ),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.add,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ],
                      ),

                      ///
                      const SizedBox(height: 6),
                      RichText(
                        text: TextSpan(
                          text: 'Weight',
                          style: style.copyWith(
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                              text: '*',
                              style: style.copyWith(
                                color: AppColor.red,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MyTextForm(
                        obscureText: false,
                        hintText: 'Enter approximate weight of goods',
                        keyboardType: TextInputType.number,
                        controller: _goodsWeight,
                        validatior: (input) => input!.isEmpty
                            ? "Please Enter weight of goods"
                            : null,
                      ),

                      ///
                      SizedBox(height: screensize.height * 0.02),
                      Text(
                        'Dimension',
                        style: style.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MyTextForm(
                              obscureText: false,
                              hintText: 'Length',
                              keyboardType: TextInputType.number,
                              controller: _length,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'by',
                            style: style.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: MyTextForm(
                              obscureText: false,
                              hintText: 'Weight',
                              keyboardType: TextInputType.number,
                              controller: _weight,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'by',
                            style: style.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: MyTextForm(
                              obscureText: false,
                              hintText: 'Height',
                              keyboardType: TextInputType.number,
                              controller: _height,
                            ),
                          ),
                        ],
                      ),

                      ///
                      SizedBox(height: screensize.height * 0.02),
                      RichText(
                        text: TextSpan(
                          text: 'Quantity',
                          style: style.copyWith(
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                              text: '*',
                              style: style.copyWith(
                                color: AppColor.red,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MyTextForm(
                        obscureText: false,
                        hintText: 'Enter value',
                        keyboardType: TextInputType.number,
                        controller: _quantity,
                        validatior: (input) =>
                            input!.isEmpty ? "Please Enter value" : null,
                      ),

                      SizedBox(height: screensize.height * 0.08),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 47.0,
                          right: 47.0,
                          bottom: 10,
                        ),
                        child: MainButton(
                          backgroundColor: (_pickUpAddress.text.isNotEmpty &&
                                  _deliveryAddress.text.isNotEmpty &&
                                  _goodsWeight.text.isNotEmpty &&
                                  _quantity.text.isNotEmpty)
                              ? AppColor.primaryColor
                              : AppColor.inactiveButton,
                          onTap: () {
                            if (_globalFormKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                builder: (ctx) {
                                  return PopupSheet(
                                    title: 'Estimated Price',
                                    buttonText: 'Book Shipment',
                                    text:
                                        'Kindly note that the above price is just an estimate and the final price may vary a little.',
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                      ),
                                      child: Text(
                                        '#5,500.00',
                                        style: style.copyWith(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.black,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pop(ctx);
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return PopupSheet(
                                              title: 'Transaction In Progress',
                                              buttonText: 'Cancel Transaction',
                                              text:
                                                  'Kindly wait a few minutes while your payment is being processed...',
                                              child:
                                                  const CupertinoActivityIndicator(
                                                radius: 45,
                                              ),
                                              onTap: () =>
                                                  Navigator.pop(context),
                                            );
                                          });
                                    },
                                  );
                                },
                              );
                            }
                          },
                          child: Text(
                            'Get A Qoute',
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
          )
        ],
      ),
    );
  }
}
