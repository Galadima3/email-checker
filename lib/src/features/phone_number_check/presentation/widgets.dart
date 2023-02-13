import 'package:email_checker/src/features/phone_number_check/domain/phone_model.dart';
import 'package:flutter/material.dart';

class CarrierTile extends StatelessWidget {
  final AsyncSnapshot<PhoneModel> asyncData;
  const CarrierTile({
    super.key,
    required this.asyncData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            children: [const Text('Carrier'), Text(asyncData.data!.carrier)]),
      ),
    );
  }
}

class MobileNumberTile extends StatelessWidget {
  final AsyncSnapshot<PhoneModel> asyncData;
  const MobileNumberTile({
    super.key,
    required this.asyncData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              const Text('Phone Number'),
              Text(asyncData.data!.phone)
            ]),
      ),
    );
  }
}
