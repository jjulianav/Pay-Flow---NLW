import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pay_flow/share/models/boleto_model.dart';
import 'package:pay_flow/share/themes/app_colors.dart';
import 'package:pay_flow/share/themes/app_text_styles.dart';
import 'package:pay_flow/share/widgets/boleto_list/boleto_list_controller.dart';
import 'package:pay_flow/share/widgets/boleto_tile/boleto_tile_widget.dart';
import 'package:pay_flow/share/widgets/label_button/label_button.dart';

class BoletoListWidget extends StatefulWidget {
  final BoletoListController controller;
  BoletoListWidget({Key? key, required this.controller}) : super(key: key);

  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
      valueListenable: widget.controller.boletosNotifier,
      builder: (_, boletos, __) => Column(
          children: boletos
              .map((e) => InkWell(
                  focusColor: AppColors.primary,
                  onTap: () {
                    showMaterialModalBottomSheet(
                      context: context,
                      builder: (context) => SingleChildScrollView(
                        controller: ScrollController(),
                        child: Container(
                          color: Colors.white,
                          height: 293,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 160, vertical: 15),
                                child: Divider(
                                  color: AppColors.stroke,
                                  height: 1,
                                  thickness: 2,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 78, left: 78, top: 10, bottom: 25),
                                child: Text.rich(
                                  TextSpan(
                                      text: "O boleto ",
                                      style: TextStyles.trailingRegular,
                                      children: [
                                        TextSpan(
                                            text: e.name,
                                            style: TextStyles.trailingBold),
                                        TextSpan(
                                          text: "\n no valor de R\$ ",
                                          style: TextStyles.trailingRegular,
                                        ),
                                        TextSpan(
                                            text: "${e.value}",
                                            style: TextStyles.trailingBold),
                                        TextSpan(
                                          text: "\n foi pago?",
                                          style: TextStyles.trailingRegular,
                                        )
                                      ]),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 155,
                                      child: LabelButton(
                                        label: "Ainda não",
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        boxDecoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.fromBorderSide(
                                              BorderSide(
                                                  color: AppColors.stroke),
                                            ),
                                            color: AppColors.background),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      width: 155,
                                      child: LabelButton(
                                        label: "Sim",
                                        boxDecoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.primary),
                                        onPressed: () {
                                          widget.controller.setarEstado(
                                              e.name.toString(), true);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Divider(
                                thickness: 1,
                                height: 1,
                                color: AppColors.stroke,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: GestureDetector(
                                  onTap: () {
                                    print("ok");
                                  },
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.trashAlt,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "Deletar boleto",
                                          style: TextStyles.captionBody,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: BoletoTileWidget(
                    data: e,
                  )))
              .toList()),
    );
  }
}
