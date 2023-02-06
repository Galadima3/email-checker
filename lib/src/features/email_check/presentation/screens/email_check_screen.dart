import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailCheckScreen extends StatefulWidget {
  const EmailCheckScreen({super.key});

  @override
  State<EmailCheckScreen> createState() => _EmailCheckScreenState();
}

class _EmailCheckScreenState extends State<EmailCheckScreen> {
  final emailTextController = TextEditingController();
  void returnOutput(String input) {
    debugPrint('Email: $input');
  }

  @override
  void dispose() {
    emailTextController.dispose();
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
              'asset/images/email.svg',
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
                    keyboardType: TextInputType.emailAddress,
                    controller: emailTextController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(fontSize: 14),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () => returnOutput(emailTextController.text),
              style: ElevatedButton.styleFrom(),
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
