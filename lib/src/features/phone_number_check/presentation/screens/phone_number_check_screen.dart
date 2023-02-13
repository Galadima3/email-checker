import 'package:email_checker/src/features/phone_number_check/presentation/screens/phone_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PhoneCheckScreen extends StatefulWidget {
  const PhoneCheckScreen({super.key});

  @override
  State<PhoneCheckScreen> createState() => _PhoneCheckScreenState();
}

class _PhoneCheckScreenState extends State<PhoneCheckScreen> {
  final _phoneFormKey = GlobalKey<FormState>();
  final phoneTextController = TextEditingController();
  var countryCode = '';
  void goToNextPage() {
    if (phoneTextController.text.isNotEmpty &&
        _phoneFormKey.currentState!.validate() &&
        !(phoneTextController.text.length < 10)) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PhoneDetailScreen(
          phoneNumber: phoneTextController.text,
        ),
      ));
    }
  }

  @override
  void dispose() {
    phoneTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Center(
              child: SvgPicture.asset(
                height: 150,
                width: 150,
                'asset/images/phone.svg',
              ),
            ),
            const SizedBox(height: 50),
            //TextField
            Center(
              child: Container(
                padding: const EdgeInsets.only(left: 5),
                height: 50,
                width: 320,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12)),
                child: Form(
                  key: _phoneFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Center(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty && value.length < 10) {
                          return 'Phone number (+x xxx-xxx-xxxx)';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) => goToNextPage,
                      keyboardType: TextInputType.phone,
                      controller: phoneTextController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          hintText: 'Enter your phone number',
                          hintStyle: TextStyle(fontSize: 14),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: goToNextPage,
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}

//                   ),

// IntlPhoneField(
//                     onCountryChanged: (value){
//                       setState(() {
//                         value = countryCode as Country;
//                         debugPrint(value.code);
//                       });
//                     },
//                     controller: phoneTextController,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(),
//                       ),
//                     ),
//                     initialCountryCode: 'NG',
//                     onSubmitted: (p0) => goToNextPage('+234$p0'),
//                   ),
