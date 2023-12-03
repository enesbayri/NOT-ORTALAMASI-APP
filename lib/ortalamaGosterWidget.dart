// ignore_for_file: camel_case_types, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_4/helper/sabitler.dart';
import 'package:flutter_application_4/model/ortalama.dart';



class ortalamaGoster extends StatefulWidget {
  List<ortalama> girilenDersler;
  ortalamaGoster({required this.girilenDersler,super.key});

  @override
  State<ortalamaGoster> createState() => _ortalamaGosterState();
}

class _ortalamaGosterState extends State<ortalamaGoster> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                    height: 150,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.girilenDersler.length} DERS GİRİLDİ",
                            style: sabitler.ortalamaDerStyle,
                          ),
                          Text(
                            (widget.girilenDersler.isEmpty ? "0":ortalama.ortHesapla(widget.girilenDersler).toStringAsFixed(2)),
                            style: sabitler.ortalamaBodyStyle,
                          ),
                          Text(
                            "ORTALAMA",
                            style: sabitler.ortalamaDerStyle,
                          ),
                        ]),
                  );
  }
}