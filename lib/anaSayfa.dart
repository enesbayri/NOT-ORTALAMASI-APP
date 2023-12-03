// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_4/appbarDropdown.dart';
import 'package:flutter_application_4/dersListesiWidget.dart';
import 'package:flutter_application_4/dropDownWidget.dart';
import 'package:flutter_application_4/helper/sabitler.dart';
import 'package:flutter_application_4/model/ortalama.dart';
import 'package:flutter_application_4/ortalamaGosterWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => AnaSayfaState();
}

class AnaSayfaState extends State<AnaSayfa> {
  int krediDegeri = 1;
  double harfDegeri = 4;
  String ders = "";
  List<ortalama> girilenDersler = [];

  var formKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppbarDropdown(renkDegistir: (renk) {
            setState(() {
              sabitler.anarenk = renk;
              sabitler.inputArkaplan=renk.shade100.withOpacity(0.3);
              sabitler.baslikTextStyle=GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.w900, color: renk);
              sabitler.ortalamaBodyStyle=GoogleFonts.quicksand(fontSize: 55, fontWeight: FontWeight.w800, color: renk);
              sabitler.ortalamaDerStyle=GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w600, color: renk);
            });
          })
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          sabitler.baslikText,
          style: sabitler.baslikTextStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.only(top: 16),
                    height: 150,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: sabitler.inputArkaplan,
                                  borderRadius: BorderRadius.circular(24)),
                              child: TextFormField(
                                key: formKey,
                                validator: ((value) {
                                  if (value!.length < 3) {
                                    return "Lütfen geçerli bir ders adı giriniz!";
                                  }
                                  return null;
                                }),
                                onSaved: (newValue) {
                                  ders = newValue!;
                                  ortalama dersbilgi =
                                      ortalama(ders, krediDegeri, harfDegeri);
                                  girilenDersler.add(dersbilgi);
                                },
                                decoration:  const InputDecoration(
                                  label: Text("Hesaplanacak Ders"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(24))),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child:
                                    dropdown(DropDownHarf(harfSecildi: (harf) {
                                  harfDegeri = harf;
                                })),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: dropdown(
                                    DropDownk(krediSecildi: (kredi) {
                                      krediDegeri = kredi;
                                    }),
                                  )),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () {
                                      bool validate =
                                          formKey.currentState!.validate();
                                      if (validate) {
                                        formKey.currentState!.save();
                                        formKey.currentState!.reset();
                                        harfDegeri = 4;
                                        krediDegeri = 1;
                                        setState(() {
                                          harfDegeri = 4;
                                          krediDegeri = 1;
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.arrow_forward_ios)),
                              )
                            ],
                          )
                        ]),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ortalamaGoster(
                    girilenDersler: girilenDersler,
                  ),
                ),
              ],
            ),
            Expanded(
              child: dersListesi(
                girilenDersler: girilenDersler,
                elemanCikar: (index) {
                  setState(() {
                    girilenDersler.removeAt(index);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container dropdown(dropdownwidget) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: sabitler.inputArkaplan,
      ),
      child: dropdownwidget,
    );
  }
}
