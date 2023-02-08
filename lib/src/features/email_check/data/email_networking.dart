import 'dart:convert';


import 'package:email_checker/src/features/email_check/domain/email_model.dart';
import 'package:email_checker/utils/constants.dart';
import 'package:http/http.dart';

class EmailApiService {
  Future<EmailModel> getEmailInfo(String email) async {
    try {
      var url = Uri.parse('${APIConstants.emailBaseUrl}${APIConstants.emailAPIKey}&email=$email');
      Response response = await get(url);
      if (response.statusCode == 200) {
        var model = EmailModel.fromJson(jsonDecode(response.body));
        return model;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw (Exception(e.toString()));
    }
  }
}
