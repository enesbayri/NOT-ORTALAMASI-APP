// ignore_for_file: camel_case_types, file_names


class ortalamaSabitler{
  static List harfler=["AA","BA","BB","CB","CC","DC","DD","FD","FF"];   
  static List<double> harfNotu=[4,3.5,3,2.5,2,1.5,1,0.5,0];
  static List dersKredi=[1,2,3,4,5,6,7,8,9,10];

  static double harfiNotaCevir(harf){
    return harfNotu[(harfler. indexOf(harf))];
  }

}