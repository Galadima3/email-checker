import 'package:email_checker/src/features/email_check/data/email_networking.dart';
import 'package:email_checker/src/features/email_check/domain/email_model.dart';
import 'package:email_checker/src/features/email_check/presentation/common_widgets.dart';
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
  late Future<EmailModel> _value;
  @override
  void initState() {
    _value = _getData();
    super.initState();
  }

  Future<EmailModel> _getData() async {
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
                      constantSpacing,
                      Center(
                        child: SvgPicture.asset(
                          height: 120, 
                          width: 120,
                          snapshot.data!.deliverability == 'DELIVERABLE' ? validImage : invalidImage,
                        ),
                      ),
                      constantSpacing,

                      Text('Email: ${snapshot.data!.email}',
                          style: const TextStyle(
                            fontFamily: 'OpenSans-Medium',
                            fontSize: 16,
                          )),
                      constantSpacing,

                      //email validity
                      ResultTile(asyncData: snapshot),
                      constantSpacing,
                      ResultTileWithIcon(
                          asyncData: snapshot, textData: 'Deliverability'),
                      constantSpacing,
                      QualityScoreTile(
                          asyncData: snapshot, textData: 'Quality Score'),
                      constantSpacing,
                      FreeEmailTile(
                          asyncData: snapshot, textData: 'Free Email'),
                      constantSpacing,
                      DisposableEmailTile(
                          asyncData: snapshot, textData: 'Disposable Email')
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
