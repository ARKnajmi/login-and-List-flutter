import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class listProduct extends StatefulWidget {
  const listProduct({super.key});

  @override
  State<listProduct> createState() => _listProductState();
}

class _listProductState extends State<listProduct> {
  final List<Map<String, dynamic>> dummyProducts = [
    {'name': 'Bando 08', 'price': '2.000'},
    {'name': 'Bando 2 cagak', 'price': '3.000'},
    {'name': 'Bando 20 DN', 'price': '1.000'},
    {'name': 'Bando 3 daun', 'price': '2.000'},
    {'name': 'Bando 30', 'price': '2.000'},
    {'name': 'Bando 35', 'price': '2.000'},
    {'name': 'Bando 47', 'price': '3.000'},
    {'name': 'Bando 50', 'price': '3.000'},
    {'name': 'Bando 75', 'price': '7.000'},
    {'name': 'Bando 90', 'price': '7.500'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Product Data'),
          actions: [
            InkWell(
              splashColor: Colors.grey,
              onTap: () => print("Container pressed"),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.refresh),
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: Padding(
              padding: EdgeInsets.all(3.0),
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 22),
                  labelText: 'Filter Products',
                  enabledBorder: InputBorder.none,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.only(right: 22, left: 22),
                    icon: Icon(Icons.close),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          )),
      body: ListView.builder(  
        itemCount: dummyProducts.length,
        itemBuilder: (BuildContext context, int index) {
          final productPrice = dummyProducts[index]['price'] as String;
          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 2,
                offset: Offset(0, 3),
              )
            ]),
            child: ListTile(
              // contentPadding: EdgeInsets.all(0),
              leading: Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(fontSize: 13),
                ),
              ),
              contentPadding: EdgeInsets.only(left: 8, right: 19),
              title: Text(
                dummyProducts[index]['name'] as String,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text('Price: Rp. $productPrice'),
              ),
              trailing: IconButton(
                padding: EdgeInsets.only(left: 21, right: 21),
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onPressed: () {},
            child: Icon(Icons.add),
            tooltip: 'Add Product',
          ),
        ],
      ),
    );
  }
}
