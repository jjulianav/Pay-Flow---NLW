import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pay_flow/insert_boleto/insert_boleto_controller.dart';

import 'package:pay_flow/share/themes/app_colors.dart';
import 'package:pay_flow/share/themes/app_text_styles.dart';
import 'package:pay_flow/share/widgets/input_text/input_text_widget.dart';
import 'package:pay_flow/share/widgets/set_label_button/set_label_button.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;

  const InsertBoletoPage({
    Key? key,
    this.barcode,
  }) : super(key: key);

  @override
  State<InsertBoletoPage> createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();

  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$ ",
    decimalSeparator: ",",
  );

  final dueDataInputTextController = MaskedTextController(mask: "00/00/0000");
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: AppColors.input,
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/home");
            },
          ),
          backgroundColor: AppColors.background,
          elevation: 0,
        ),
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          // resolve problema de overview
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 93,
                    vertical: 24,
                  ),
                  child: Text(
                    "Preencha os dados do boleto",
                    style: TextStyles.titleBoldHeading,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      InpuTextWidget(
                          label: "Nome do boleto",
                          iconData: Icons.description_outlined,
                          validator: controller.validateName,
                          onChanged: (value) {
                            controller.onChange(name: value);
                          }),
                      InpuTextWidget(
                        controller: dueDataInputTextController,
                        label: "Vencimento",
                        iconData: FontAwesomeIcons.timesCircle,
                        validator: controller.validateVencimento,
                        onChanged: (value) {
                          controller.onChange(dueData: value);
                        },
                      ),
                      InpuTextWidget(
                        controller: moneyInputTextController,
                        label: "Valor",
                        iconData: FontAwesomeIcons.wallet,
                        validator: (_) => controller.validateValor(
                            moneyInputTextController.numberValue),
                        onChanged: (value) {
                          controller.onChange(
                              value: moneyInputTextController.numberValue);
                        },
                      ),
                      InpuTextWidget(
                        controller: barcodeInputTextController,
                        label: "Código",
                        iconData: FontAwesomeIcons.barcode,
                        validator: controller.validateCodigo,
                        onChanged: (value) {
                          controller.onChange(barcode: value);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SetLabelButtons(
          enableSecondarColor: true,
          primaryLabel: "Cancelar",
          primaryOnPressed: () {
            // tela anterior
            Navigator.pop(context);
          },
          secondaryLabel: "Cadastrar",
          secondaryOnPressed: () async {
            await controller.cadastrarBoleto();
            Navigator.pop(context);
          },
        ));
  }
}
