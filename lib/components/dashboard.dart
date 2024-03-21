import 'package:flutter/material.dart';
import '../models/cart.dart';

class Dashboard extends StatelessWidget {
  final List<Cart>
      _listCart; //SEPERTI BIASA DEFINISIKAN VARIABLE UNTUK MENAMPUNG DATA LIST CART

  Dashboard(this._listCart); //BUAT CONSTRUCTOR UNTUK MEMINTA DATA LIST CARTNYA

  //BUAT GETTER UNTUK MENDAPATKAN TOTAL ITEM
  int get totalItem {
    //DIMANA DATANYA KITA DAPATKAN DARI HASIL SUM QTY
    return _listCart.fold(0, (sum, item) {
      return sum += item.qty;
    });
  }

  //BUAT GETTER UNTUK MENDAPATKAN TOTAL PRICE
  double get totalPrice {
    //DAN DATANYA KITA DAPATKAN DARI SUM HARGA
    return _listCart.fold(0, (sum, item) {
      return sum += item.harga;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6, //TINGKAT KETEBALAN SHADOW DARI CARD
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceAround, //AGAR KEDUA ELEMEN DIDALAMNYA DI SET SEHINGGA MEMILIKI JARAK ANTAR KEDUANYA DAN MEMENUHI CARD
          children: <Widget>[
            Column(
              children: <Widget>[
                //MENAMPILKAN TOTAL ITEM
                Text(
                  "Total Item",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  totalItem.toString() + " pcs",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                //MENAMPILKAN TOTAL BELANJA
                Text(
                  "Total Belanja",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  totalPrice.toStringAsFixed(0),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
