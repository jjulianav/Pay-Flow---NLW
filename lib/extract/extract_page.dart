import 'package:flutter/material.dart';
import 'package:pay_flow/share/models/boleto_model.dart';
import 'package:pay_flow/share/themes/app_colors.dart';
import 'package:pay_flow/share/themes/app_text_styles.dart';
import 'package:pay_flow/share/widgets/boleto_info/boleto_info_widget.dart';
import 'package:pay_flow/share/widgets/boleto_list/boleto_list_controller.dart';
import 'package:pay_flow/share/widgets/boleto_list/boleto_list_paid_widget.dart';
import 'package:pay_flow/share/widgets/boleto_list/boleto_list_widget.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  State<ExtractPage> createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Row(
            children: [
              Text(
                "Meu extrato",
                style: TextStyles.titleBoldHeading,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Divider(
            thickness: 1,
            height: 1,
            color: AppColors.stroke,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BoletoListPaid(
            controller: controller,
          ),
        ),
      ],
    );
  }
}
