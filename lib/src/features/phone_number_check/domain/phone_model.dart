// To parse this JSON data, do
//
//     final phoneModel = phoneModelFromJson(jsonString);

import 'dart:convert';

PhoneModel phoneModelFromJson(String str) => PhoneModel.fromJson(json.decode(str));

String phoneModelToJson(PhoneModel data) => json.encode(data.toJson());

class PhoneModel {
    PhoneModel({
        required this.phone,
        required this.valid,
        required this.format,
        required this.country,
        required this.location,
        required this.type,
        required this.carrier,
    });

    final String phone;
    final bool valid;
    final Format format;
    final Country country;
    final String location;
    final String type;
    final String carrier;

    factory PhoneModel.fromJson(Map<String, dynamic> json) => PhoneModel(
        phone: json["phone"],
        valid: json["valid"],
        format: Format.fromJson(json["format"]),
        country: Country.fromJson(json["country"]),
        location: json["location"],
        type: json["type"],
        carrier: json["carrier"],
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
        "valid": valid,
        "format": format.toJson(),
        "country": country.toJson(),
        "location": location,
        "type": type,
        "carrier": carrier,
    };
}

class Country {
    Country({
        required this.code,
        required this.name,
        required this.prefix,
    });

    final String code;
    final String name;
    final String prefix;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        code: json["code"],
        name: json["name"],
        prefix: json["prefix"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "prefix": prefix,
    };
}

class Format {
    Format({
        required this.international,
        required this.local,
    });

    final String international;
    final String local;

    factory Format.fromJson(Map<String, dynamic> json) => Format(
        international: json["international"],
        local: json["local"],
    );

    Map<String, dynamic> toJson() => {
        "international": international,
        "local": local,
    };
}
