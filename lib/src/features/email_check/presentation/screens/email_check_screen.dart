import 'package:email_checker/src/features/email_check/presentation/screens/email_details_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailCheckScreen extends StatefulWidget {
  const EmailCheckScreen({
    super.key,
  });

  @override
  State<EmailCheckScreen> createState() => _EmailCheckScreenState();
}

class _EmailCheckScreenState extends State<EmailCheckScreen> {
  final emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //String _email = '';
  bool isEmailValid = false;

  // void _submit (String text){

  //   if(_formKey.currentState!.validate()){
  //    debugPrint('Valid email');
  //   }
  // }
  void returnOutput(String input) {
    debugPrint('Email: $input');
  }

  void goToNextPage() {
    if (emailTextController.text.isNotEmpty &&
        _formKey.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EmailDetailsScreen(
          emailAddress: emailTextController.text,
        ),
      ));
    }
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
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.only(left: 5),
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: TextFormField(
                      onFieldSubmitted: (value) => returnOutput(value),
                      keyboardType: TextInputType.emailAddress,
                      controller: emailTextController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(fontSize: 14),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                      validator: (text) => EmailValidator.validate(text!)
                          ? null
                          : "Please enter a valid email",
                    ),
                  ),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: goToNextPage,
              style: ElevatedButton.styleFrom(),
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
