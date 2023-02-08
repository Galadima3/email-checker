// To parse this JSON data, do
//
//     final emailModel = emailModelFromJson(jsonString);


import 'dart:convert';

EmailModel emailModelFromJson(String str) => EmailModel.fromJson(json.decode(str));

String emailModelToJson(EmailModel data) => json.encode(data.toJson());

class EmailModel {
    EmailModel({
        required this.email,
        required this.autocorrect,
        required this.deliverability,
        required this.qualityScore,
        required this.isValidFormat,
        required this.isFreeEmail,
        required this.isDisposableEmail,
        required this.isRoleEmail,
        required this.isCatchallEmail,
        required this.isMxFound,
        required this.isSmtpValid,
    });

    final String email;
    final String autocorrect;
    final String deliverability;
    final String qualityScore;
    final Is isValidFormat;
    final Is isFreeEmail;
    final Is isDisposableEmail;
    final Is isRoleEmail;
    final Is isCatchallEmail;
    final Is isMxFound;
    final Is isSmtpValid;

    factory EmailModel.fromJson(Map<String, dynamic> json) => EmailModel(
        email: json["email"],
        autocorrect: json["autocorrect"],
        deliverability: json["deliverability"],
        qualityScore: json["quality_score"],
        isValidFormat: Is.fromJson(json["is_valid_format"]),
        isFreeEmail: Is.fromJson(json["is_free_email"]),
        isDisposableEmail: Is.fromJson(json["is_disposable_email"]),
        isRoleEmail: Is.fromJson(json["is_role_email"]),
        isCatchallEmail: Is.fromJson(json["is_catchall_email"]),
        isMxFound: Is.fromJson(json["is_mx_found"]),
        isSmtpValid: Is.fromJson(json["is_smtp_valid"]),
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "autocorrect": autocorrect,
        "deliverability": deliverability,
        "quality_score": qualityScore,
        "is_valid_format": isValidFormat.toJson(),
        "is_free_email": isFreeEmail.toJson(),
        "is_disposable_email": isDisposableEmail.toJson(),
        "is_role_email": isRoleEmail.toJson(),
        "is_catchall_email": isCatchallEmail.toJson(),
        "is_mx_found": isMxFound.toJson(),
        "is_smtp_valid": isSmtpValid.toJson(),
    };
}

class Is {
    Is({
        required this.value,
        required this.text,
    });

    final bool value;
    final String text;

    factory Is.fromJson(Map<String, dynamic> json) => Is(
        value: json["value"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "text": text,
    };
}
