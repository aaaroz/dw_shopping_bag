import 'package:flutter/material.dart';
import './components/product_list.dart';
import './components/dashboard.dart';
import './components/add_new_item.dart';
import 'models/cart.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping Bag",
      theme: ThemeData(
          primarySwatch: Colors.pink,
          hintColor: Colors.purpleAccent,
          textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Cart> _carts = [
    //SEBAGAI PERMULAAN, KITA TAMBAHKAN DUA BUAH DATA DUMMY
    Cart(id: 'DW1', title: 'Sabun Mandi', harga: 15000, qty: 1),
    Cart(id: 'DW2', title: 'Shampoo', harga: 17000, qty: 2),
  ];

  void _openModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddNewItem(
              _addNewItem); //DAN ISI DARI MODAL TERSEBUT ADALAH COMPONENT AddNewItem. PASTINYA PARAMETER YANG DIKIRIM ADALAH SEBUAH FUNGSI BERNAMA _addNewItem, MAKA PERLU KITA DEFINISIKAN SELANJUTNYA
        });
  }

  //FUNGSI INI UNTUK MEMANIPULASI DENGAN MENAMBAHKAN DATA BARU KE DALAM CART
  void _addNewItem(String title, double harga, int qty) {
    //BUAT FORMAT DATANYA DENGAN REFERENSI MENGGUNAKAN MODAL Cart
    final newItem = Cart(
        id: DateTime.now().toString(), title: title, harga: harga, qty: qty);
    setState(() {
      _carts.add(newItem); //SET STATE-NYA UNTUK MENAMBAHKAN DATA BARU TERSEBUT
    });
  }

  //FUNGSI INI UNTUK MENGHAPUS SEMUA DATA PADA VARIABLE CARTS
  void _resetCarts() {
    setState(() {
      _carts.clear(); //SET STATENYA KEMUDIAN CLEAR
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Belanjaan"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Dashboard(_carts),
            ProductList(_carts),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            _openModal(context), //KETIKA DITEKAN MENJALANKAN FUNGSI _openModal
      ),
    );
  }
}
