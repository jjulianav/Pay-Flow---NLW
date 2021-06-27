import 'package:flutter/material.dart';

import 'package:pay_flow/share/themes/app_colors.dart';
import 'package:pay_flow/share/themes/app_text_styles.dart';
import 'package:pay_flow/share/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:pay_flow/share/widgets/set_label_button/set_label_button.dart';

class ButtonSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final String title;
  final String subtitle;

  const ButtonSheetWidget({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // top: true,
      // left: true,
      // right: true,
      // bottom: true,
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text.rich(
                        TextSpan(
                            text: title,
                            style: TextStyles.buttonBoldHeading,
                            children: [
                              TextSpan(
                                text: "\n $subtitle",
                                style: TextStyles.buttonHeading,
                              ),
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // divisão horizontal
                    // Divider(
                    //   thickness: 1,
                    //   color: AppColors.stroke,
                    // ),
                    Container(
                      height: 1,
                      color: AppColors.stroke,
                    ),
                    SetLabelButtons(
                        enablePrimaryColor: true,
                        primaryLabel: primaryLabel,
                        primaryOnPressed: primaryOnPressed,
                        secondaryLabel: secondaryLabel,
                        secondaryOnPressed: secondaryOnPressed),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
