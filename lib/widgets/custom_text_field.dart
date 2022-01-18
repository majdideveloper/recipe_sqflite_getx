import 'package:flutter/material.dart';
import 'package:recipe_sqflite_getx/config/size_config.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.label,
      this.maxLines,
      this.labelHint,
      required this.multiLines,
      this.controller})
      : super(key: key);

  String label = 'Text here';
  int? maxLines = 1;
  bool multiLines = false;
  String? labelHint;

  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Text(
          label.toUpperCase(),
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w900),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.only(top: 8, left: 14.0),
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: controller,
                  keyboardType: !multiLines
                      ? TextInputType.text
                      : TextInputType.multiline,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    alignLabelWithHint: true,
                    hintText: labelHint,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}
