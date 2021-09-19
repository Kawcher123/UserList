import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_login/common_widgets/ui.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key key,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.initialValue,
    this.hintText,
    this.errorText,
    this.iconData,
    this.labelText,
    this.obscureText,
    this.suffixIcon,
    this.isFirst,
    this.isLast,
    this.style,
    this.textAlign,
    this.suffix,
  }) : super(key: key);

  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final String initialValue;
  final String hintText;
  final String errorText;
  final TextAlign textAlign;
  final String labelText;
  final TextStyle style;
  final IconData iconData;
  final bool obscureText;
  final bool isFirst;
  final bool isLast;
  final Widget suffixIcon;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText ?? "",
          style: Get.textTheme.bodyText1,
          textAlign: textAlign ?? TextAlign.start,
        ),
        TextFormField(
          keyboardType: keyboardType ?? TextInputType.text,
          onSaved: onSaved,
          onChanged: onChanged,
          validator: validator,
          initialValue: initialValue ?? '',
          style: style ?? Get.textTheme.bodyText2,
          obscureText: obscureText ?? false,
          textAlign: textAlign ?? TextAlign.start,
          decoration: Ui.getInputDecoration(
            hintText: hintText ?? '',
            iconData: iconData,
            suffixIcon: suffixIcon,
            suffix: suffix,
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}
