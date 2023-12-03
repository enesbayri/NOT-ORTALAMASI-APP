// ignore_for_file: camel_case_types, must_be_immutable, prefer_initializing_formals, file_names

import 'package:flutter/material.dart';
import 'model/ortalama.dart';
import 'package:flutter_application_4/helper/sabitler.dart';


class dersListesi extends StatefulWidget {
  late List<ortalama>? girilenDersler;
  late Function elemanCikar;
  dersListesi({required List<ortalama>? girilenDersler,required Function elemanCikar,super.key}){
    this.girilenDersler=girilenDersler;
    this.elemanCikar=elemanCikar;
    }

  @override
  // ignore: no_logic_in_create_state
  State<dersListesi> createState() => dersListesiState(girilenDersler: girilenDersler,elemanCikar: elemanCikar);
}

class dersListesiState extends State<dersListesi> {
  late List<ortalama>? girilenDersler;
  Function elemanCikar;
  dersListesiState({this.girilenDersler,required this.elemanCikar});

  @override
  Widget build(BuildContext context) {
    return girilenDersler!.isEmpty ?Container(child: Center(child: Text("Lütfen ders ekleyin",style: sabitler.baslikTextStyle,)),)
    : 
    Container(
                padding: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                  itemCount: girilenDersler!.length,
                  itemBuilder: (context, index) {
                    ortalama ort=girilenDersler![index];
                    return Dismissible(
                      background: Container(color: sabitler.anarenk),
                      key: ValueKey<ortalama>(girilenDersler![index]),
                      onDismissed: (direction) {
                        setState(() {
                          elemanCikar(index);
                        });

                      },
                      child: Card(
                        child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: sabitler.anarenk,
                              child: Text((ort.getkredi*ort.getnot).toString()),
                            ),
                            title: Text(ort.ders),
                            subtitle: Text(ort.toString()),
                        ),
                      ),
                    );
                  },
                ),
              );
  }
}