import 'package:flutter/material.dart';

import 'package:pay_flow/share/themes/app_colors.dart';
import 'package:pay_flow/share/themes/app_text_styles.dart';

class InpuTextWidget extends StatelessWidget {
  final String label;
  final IconData iconData;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;

  const InpuTextWidget({
    Key? key,
    required this.label,
    required this.iconData,
    this.initialValue,
    this.validator,
    this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          TextFormField(
            initialValue: initialValue,
            validator: validator,
            controller: controller,
            onChanged: onChanged,
            style: TextStyles.input,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              labelText: label,
              labelStyle: TextStyles.input,
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Icon(
                      iconData,
                      color: AppColors.primary,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 48,
                    color: AppColors.stroke,
                  ),
                ],
              ),
              border: InputBorder.none,
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
        ],
      ),
    );
  }
}
