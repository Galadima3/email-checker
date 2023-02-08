import 'package:email_checker/src/features/email_check/data/email_networking.dart';
import 'package:email_checker/src/features/email_check/domain/email_model.dart';
import 'package:email_checker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailDetailsScreen extends StatefulWidget {
  final String emailAddress;
  const EmailDetailsScreen({super.key, required this.emailAddress});

  @override
  State<EmailDetailsScreen> createState() => _EmailDetailsScreenState();
}

class _EmailDetailsScreenState extends State<EmailDetailsScreen> {
  //late List<EmailModel>? _emailModel = [];
  late Future<EmailModel> _value;
  @override
  void initState() {
    _value = _getData();
    super.initState();
  }

  Future<EmailModel> _getData() async {
    // var _emailModel = EmailApiService().getEmailInfo(widget.emailAddress);
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    return EmailApiService().getEmailInfo(widget.emailAddress);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: _value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Center(child: Text('An error has occured'));
              } else if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(snapshot.data!.email),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Validation Details'),
                      Container(
                        padding: const EdgeInsets.all(8),
                        height: 75,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple.shade300,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Result'),
                            SvgPicture.asset(snapshot.data!.isValidFormat.value
                                ? successImage
                                : failImage)
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Text('Empty data');
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          },
        ),
      ),
    );
  }
}
