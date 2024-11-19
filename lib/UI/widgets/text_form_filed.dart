import 'package:flutter/material.dart';
import 'package:pro/core/colors.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String name;
  final TextEditingController controller;
  final bool isPassword;

  const TextFormFieldWidget(
      {super.key,
      required this.name,
      required this.controller,
      this.isPassword = false});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool vis = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: widget.controller,
        obscureText:widget.isPassword? !vis:false,
        style: TextStyle(
          color: Colors.white, // Set your desired text color here
        ),
        decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        vis = !vis;
                      });
                    },
                    icon:
                        Icon(vis ? Icons.visibility_off : Icons.visibility),
                  )
                : null,
            filled: true,
            fillColor: AppColors.secondaryColor,
            hintText: widget.isPassword ? "********" : widget.name,
            hintStyle:
                TextStyle(fontSize: 15, color: Colors.grey.withOpacity(0.2)),
            label:
                Text(widget.name, style: const TextStyle(color: Colors.white)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: AppColors.secondaryColor),
                gapPadding: 5),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: AppColors.secondaryColor),
                gapPadding: 5),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: AppColors.secondaryColor),
                gapPadding: 5),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: AppColors.secondaryColor),
                gapPadding: 5)),
      ),
    );
  }
}
