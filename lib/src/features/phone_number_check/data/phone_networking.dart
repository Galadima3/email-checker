import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneCheckScreen extends StatefulWidget {
  const PhoneCheckScreen({super.key});

  @override
  State<PhoneCheckScreen> createState() => _PhoneCheckScreenState();
}

class _PhoneCheckScreenState extends State<PhoneCheckScreen> {
  final phoneTextController = TextEditingController();
  void returnOutput(String input) {
    debugPrint('Phone Number: $input');
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
            SvgPicture.asset(
              height: 150,
              width: 150,
              'asset/images/phone.svg',
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
                child: Center(
                  child: TextField(
                    onSubmitted: (value) => returnOutput(value),
                    keyboardType: TextInputType.phone,
                    controller: phoneTextController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Enter your phone number',
                        hintStyle: TextStyle(fontSize: 14),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () => returnOutput(phoneTextController.text),
              style: ElevatedButton.styleFrom(),
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
