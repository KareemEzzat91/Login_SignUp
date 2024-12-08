import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../responsive/responsive.dart';

class CustomTextField extends StatefulWidget {
  final String text;
  final double height;
  final bool isPassword;
  final Icon icon;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.text,
    required this.height,
    required this.icon,
    this.isPassword = false,
    this.validator,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  late FocusNode _focusNode;
  Color _iconColor = Colors.grey;


  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _iconColor = _focusNode.hasFocus ? const Color(0xff0186c7) : Colors.grey;
      });
    });
  }
  double TextSize(context,{required double isExtraSmallSize , required double isMobileSize,required double isMobileLarge,required double isIpadSize,required double isTabletSize,required double isLargeTabletSize,required double defaultSize} ){ return Responsive.isExtraSmall(context) ? isExtraSmallSize :
  Responsive.isMobile(context) ?isMobileSize:
  Responsive.isMobileLarge(context) ? isMobileLarge:
  Responsive.isIpad(context) ? isIpadSize:
  Responsive.isTablet(context) ? isTabletSize :
  Responsive.isLargeTablet(context) ? isLargeTabletSize : isLargeTabletSize;}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.height * .01,
        ),
        Container(
          decoration: BoxDecoration(
            border:Border.all(color:Color(0xffA3D1D7) ) ,
            gradient: const LinearGradient(

              colors: [Color(0xffA3D1D7), Color(0xff46919B),Color(0xff82D6E1)], // Gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15), // Same border radius as the TextFormField
          ),
          child: TextFormField(
            obscureText: _obscureText && widget.isPassword,
            enabled: true,
            validator: widget.validator,
            focusNode: _focusNode,
            controller: widget.controller,
            style: TextStyle(
              fontSize: TextSize(
                context,
                isExtraSmallSize: 16,
                isMobileSize: 20,
                isMobileLarge: 24,
                isIpadSize: 30,
                isTabletSize: 36,
                isLargeTabletSize: 42,
                defaultSize: 22,
              ),
            ),
            cursorHeight: 24,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white, // Background color for the inner field
              hintText: "Enter ${widget.text}",
              hintStyle: TextStyle(color: _iconColor, fontSize: 18),
              contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none, // Remove default border
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none, // No default border
              ),
              prefixIcon: Icon(
                widget.icon.icon,
                size: 28,
                color: _iconColor,
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText
                      ? CupertinoIcons.eye
                      : CupertinoIcons.eye_slash,
                  size: 24,
                  color: _iconColor,
                ),
              )
                  : null,
            ),
            cursorColor: const Color(0xff0186c7),
          ),
        ),
      ],
    );
  }

}