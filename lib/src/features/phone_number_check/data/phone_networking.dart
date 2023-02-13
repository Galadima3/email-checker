import 'package:email_checker/src/features/phone_number_check/domain/phone_model.dart';
import 'package:email_checker/utils/constants.dart';
import 'package:http/http.dart';

import 'dart:convert';

class PhoneAPIService {
  Future<PhoneModel> getPhoneInfo(String phoneNumber) async {
    try {
      var url = Uri.parse(
          '${APIConstants.phoneBaseUrl}${APIConstants.phoneAPIKey}&phone=$phoneNumber');
      Response response = await get(url);
      if (response.statusCode == 200) {
        var model = PhoneModel.fromJson(jsonDecode(response.body));
        return model;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
