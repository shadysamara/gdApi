import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String label;
  TextEditingController controller;
  TextInputType textInputType;
  Function validation;
  CustomTextfield(
      {this.label,
      this.validation,
      this.controller,
      this.textInputType = TextInputType.text});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        validator: (v) => validation(v),
        controller: this.controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
            label: Text(this.label),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
