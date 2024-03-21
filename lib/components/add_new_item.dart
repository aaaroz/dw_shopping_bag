import 'package:flutter/material.dart';

class AddNewItem extends StatefulWidget {
  final Function addNew; //KITA MENDEFINISIKAN SEBUAH FUNGSI DENGAN NAMA addNew
  AddNewItem(
      this.addNew); //DIMANA FUNGSI INI DI-PASSING DARI main.dart, SEHINGGA KITA MEMBUAT CONSTRUCTOR UNTUK MEMINTA FUNGSINYA

  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  //BUAT CONTROLLER UNTUK MENG-HANDLE TEXTFIELD INPUT
  final titleController = TextEditingController();
  final hargaController = TextEditingController();
  final qtyController = TextEditingController();

  //METHOD INI AKAN BERJALAN KETIKA TOMBOL DARI WIDGET FLATBUTTON DITEKAN
  void saveNewItem() {
    //MENGAMBIL VALUE DARI MASING-MASING CONTROLLER INPUTAN DAN MENYIMPANNYA KE DALAM VARIABLE BARU
    final title = titleController.text;
    final harga = hargaController.text;
    final qty = int.parse(qtyController.text);

    //CEK JIKA TIDAK SESUAI RULE DARI KONDISI IFNYA
    if (title.isEmpty || harga.isEmpty || qty <= 0) {
      return; //MAKA STOP TIDAK MELAKUKAN APA-APA
    }
    //JIKA SESUAI, MAKA FUNGSI addNew DIJALANKAN DENGAN MENGIRIMKAN BEBERAPA PARAMETER UNTUK DITAMBAHKAN KE CART PADA MAIN.DART
    widget.addNew(title, double.parse(harga), qty);
    //KARENA NANTINYA AKAN MENGGUNAKAN MODAL, MAKA GUNAKAN NAVIGATOR POP UNTUK MENUTUP MODAL
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Nama Barang'),
              controller:
                  titleController, //CONTROLLER INI SERUPA DENGAN NAME PADA INPUTAN HTML
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Harga'),
              controller: hargaController,
              keyboardType: TextInputType
                  .number, //KEYBOARDNYA HANYA AKAN MENAMPILKAN ANGKA
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Qty'),
              controller: qtyController,
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              child: Text('Tambah'),
              onPressed:
                  saveNewItem, //KETIKA DITEKAN JALANKAN METHOD saveNewItem
              textColor: Colors.pink,
            )
          ],
        ),
      ),
    );
  }
}

FlatButton(
    {required Text child,
    required void Function() onPressed,
    required MaterialColor textColor}) {}
