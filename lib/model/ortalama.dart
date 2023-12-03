

// ignore_for_file: camel_case_types

class ortalama{
  int kredi=1;
  double not=1;
  String ders="";

  static double ortHesapla(List<ortalama> ortalamalar){
    if(ortalamalar.isEmpty){
      return 0;
    }
    double krediler=0;
    double toplam=0;
    for (var ort in ortalamalar) {
      toplam+=(ort.getkredi*ort.getnot);
      krediler+=ort.getkredi;
    }
    double genelOrt=(toplam/krediler);
    return genelOrt;
  }

  ortalama(this.ders,this.kredi,this.not);

  get getkredi=>kredi;
  get getnot=>not;
  get getders=>ders;

  @override
  String toString() {
    
    return "Kredi: $kredi   Ders Notu: $not";
  }
}