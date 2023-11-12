import 'package:flutter/material.dart';
import 'package:ngoppish_mobile/widgets/left_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListOfItems extends StatefulWidget {
  const ListOfItems({super.key});

  @override
  State<ListOfItems> createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {

  List<String> itemList = [];

  List<String> item2 = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];

  getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList("item_list1")!;
    return list;
  }

  @override
  void initState() {
    super.initState();

    getData().then((value) {
      itemList = value!;
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Daftar Produk"
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          for(int i = 0; i < itemList.length; i+=3)
            Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        const Text("Nama Produk:"),
                        Text(itemList[i])
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      children: [
                        const Text("Jumlah Produk:"),
                        Text(itemList[i+1])
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      children: [
                        const Text("Deskripsi Produk:"),
                        Text(itemList[i+2])
                      ],
                    ),
                    const SizedBox(width: 20,),
                  ],
                ),
              ],
            )
        ],
      ),
    );
  }
}