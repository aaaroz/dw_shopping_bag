import 'package:flutter/material.dart';
import '../models/cart.dart'; //IMPORT MODEL CART.DART

class ProductList extends StatelessWidget {
  final List<Cart>
      carts; //DEFINISIKAN VARIABLE CARTS YANG BERFUNGSI UNTUK MENAMPUNG LIST DATA, DIMANA TIPENYA MENGGUNAKAN LIST DAN STRUKTUR DATANYA MERUJUK PADA MODEL Cart

  ProductList(this.carts); //BUAT CONSTRUCTOR UNTUK MEMINTA DATA

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      //APABILA CARTS KOSONG
      child: carts.isEmpty
          ? Column(
              children: <Widget>[
                //MAKA TAMPILKAN WIDGET TEXT UNTUK MEMBERIKAN INFORMASI BAHWA TIDAK ADA
                Text(
                  "No Transaction Data",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                //SELAIN ITU, MAKA DATA CARTS AKAN DILOOPING MENGGUNAKAN LISTVIEW.BUILDER
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                //DIDALAM BUILDER INI WIDGET AKAN DILOOPING BERDASARKAN JUMLAH DATA, DAN INDEX ARRAYNYA AKAN DIUPDATE KE DALAM VARIABLE INDEX
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        child: Text(
                          carts[index].qty.toString(),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            carts[index].title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'Harga: Rp' + carts[index].harga.toStringAsFixed(0),
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: carts
                  .length, //JUMLAH ITEMNYA BERDASARKAN JUMLAH DATA YANG ADA DI DALAM CARTS
            ),
    );
  }
}
