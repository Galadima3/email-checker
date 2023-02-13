import 'package:email_checker/src/features/phone_number_check/data/phone_networking.dart';
import 'package:email_checker/src/features/phone_number_check/domain/phone_model.dart';
import 'package:email_checker/src/features/phone_number_check/presentation/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/constants.dart';

class PhoneDetailScreen extends StatefulWidget {
  final String phoneNumber;
  const PhoneDetailScreen({super.key, required this.phoneNumber});

  @override
  State<PhoneDetailScreen> createState() => _PhoneDetailScreenState();
}

class _PhoneDetailScreenState extends State<PhoneDetailScreen> {
  late Future<PhoneModel> _value;
  @override
  void initState() {
    _value = _getData();
    super.initState();
  }

  Future<PhoneModel> _getData() async {
    return PhoneAPIService().getPhoneInfo(widget.phoneNumber);
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
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: SvgPicture.asset(
                      height: 120,
                      width: 120,
                      snapshot.data!.valid
                          ? phoneImage
                          : 'asset/images/phone_failure.svg',
                    ),
                  ),
                  constantSpacing,
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      padding: const EdgeInsets.all(4.5),
                      height: 75,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade200,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Validity'),
                          snapshot.data!.valid
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                              : const Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                )
                        ],
                      ),
                    ),
                  ),
                  MobileNumberTile(asyncData: snapshot),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      padding: const EdgeInsets.all(4.5),
                      height: 75,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade200,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Country'),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(snapshot.data!.country.name),
                                Text(snapshot.data!.country.prefix),
                              ],
                            )
                          ]),
                    ),
                  ),
                  CarrierTile(asyncData: snapshot),
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
    )));
  }
}

