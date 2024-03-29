import 'package:flutter/material.dart';
import 'package:tok_tok/widget/brand_colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.icon,
    this.keytype,
    this.lebelText,
    this.keyy,
    this.maxNumber,
    this.controller,
    this.validator,
    this.data,
    this.hintText,
    this.isObsecure,
    this.suffixIcon,
    this.formatter,
    this.onChangeFunction,
    this.suffixText,
  });

  final TextEditingController? controller;
  final dynamic? onChangeFunction;
  final dynamic data;
  final dynamic icon;
  final dynamic suffixIcon;

  //final String ?initialText;
  final dynamic? validator;
  final String? hintText;
  final int? maxNumber;
  final String? lebelText;
  final dynamic formatter;
  final dynamic keytype;
  final String? suffixText;
  final dynamic isObsecure;

  final String? keyy;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        //minLines: 1,
        obscureText: isObsecure ?? false,
        maxLines: maxNumber,

        keyboardType: keytype,
        controller: controller,
        inputFormatters: formatter,
        validator: validator,
        // onSaved: (String value) => data[keyy] = value,
        onChanged: onChangeFunction,
        autofocus: false,
        style: myStyle(14.0, Colors.white70),
        decoration: InputDecoration(
          hoverColor: Colors.white,
          filled: true,
          suffixText: suffixText,
          errorStyle:
              myStyle(12, Colors.redAccent.withOpacity(0.9), FontWeight.w500),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          fillColor: Colors.black54,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.pink,
              width: 1,
            ),
          ),
          labelText: hintText,
          hintStyle: myStyle(12, Colors.white),
          suffixIcon: suffixIcon,
          prefixIcon: icon,
          labelStyle: myStyle(12, Colors.white),
          hintText: lebelText,
        ),
      ),
    );
  }
}
