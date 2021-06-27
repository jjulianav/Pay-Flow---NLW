import 'package:flutter/material.dart';

import 'package:pay_flow/share/models/boleto_model.dart';
import 'package:pay_flow/share/themes/app_text_styles.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel data;

  const BoletoTileWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        data.name!,
        style: TextStyles.titleListTile,
      ),
      subtitle: Text(
        "Vence em ${data.dueData}",
        style: TextStyles.captionBody,
      ),
      trailing: Text.rich(TextSpan(
        text: "R\$ ",
        style: TextStyles.trailingRegular,
        children: [
          TextSpan(
            text: "${data.value!.toStringAsFixed(2)}",
            style: TextStyles.trailingBold,
          ),
        ],
      )),
    );
  }
}
