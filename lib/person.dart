import 'package:flutter/material.dart';

@immutable
class Person {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  @override
  String toString() => "$name ($age)";

  Person.formJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        age = json['age'] as int;
}
