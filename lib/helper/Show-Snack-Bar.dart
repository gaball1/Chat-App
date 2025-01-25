import 'package:flutter/material.dart';

void ShowSnacks(BuildContext context, String Msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(Msg),
    ),
  );
}
