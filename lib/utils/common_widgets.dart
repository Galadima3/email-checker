import 'package:email_checker/src/features/email_check/domain/email_model.dart';
import 'package:email_checker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultTile extends StatelessWidget {
  final AsyncSnapshot<EmailModel> asyncData;
  const ResultTile({
    super.key,
    required this.asyncData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 75,
      width: 290,
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Result', style: resultTextStyle),
          SvgPicture.asset(
              width: 40,
              asyncData.data!.isValidFormat.value ? successImage : failImage)
        ],
      ),
    );
  }
}

class ResultTileWithIcon extends StatelessWidget {
  final AsyncSnapshot<EmailModel> asyncData;
  final String textData;
  const ResultTileWithIcon({
    super.key,
    required this.asyncData,
    required this.textData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 75,
      width: 285,
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textData,
            style: resultTextStyle,
          ),
          asyncData.data!.deliverability == "DELIVERABLE"
              ? const Icon(
                  Icons.check,
                  color: Colors.green,
                )
              : const Icon(Icons.cancel)
        ],
      ),
    );
  }
}

class QualityScoreTile extends StatelessWidget {
  final AsyncSnapshot<EmailModel> asyncData;
  final String textData;
  const QualityScoreTile({
    super.key,
    required this.asyncData,
    required this.textData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 75,
      width: 285,
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(textData, style: resultTextStyle),
          double.parse(asyncData.data!.qualityScore) > 0.5
              ? Text(
                  asyncData.data!.qualityScore,
                  style: const TextStyle(color: Colors.green),
                )
              : Text(
                  asyncData.data!.qualityScore,
                  style: const TextStyle(color: Colors.red),
                )
        ],
      ),
    );
  }
}

class FreeEmailTile extends StatelessWidget {
  final AsyncSnapshot<EmailModel> asyncData;
  final String textData;
  const FreeEmailTile({
    super.key,
    required this.asyncData,
    required this.textData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 75,
      width: 285,
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textData,
            style: resultTextStyle,
          ),
          asyncData.data!.isFreeEmail.value
              ? const Icon(
                  Icons.check,
                  color: Colors.green,
                )
              : const Icon(Icons.cancel)
        ],
      ),
    );
  }
}

class DisposableEmailTile extends StatelessWidget {
  final AsyncSnapshot<EmailModel> asyncData;
  final String textData;
  const DisposableEmailTile({
    super.key,
    required this.asyncData,
    required this.textData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 75,
      width: 285,
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textData,
            style: resultTextStyle,
          ),
          asyncData.data!.isDisposableEmail.value
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
    );
  }
}
