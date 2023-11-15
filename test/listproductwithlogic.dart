import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

class listProduct extends StatefulWidget {
  @override
  _listProductState createState() => _listProductState();
}

class _listProductState extends State<listProduct> {
  List<Product> _products = [];
  String _filterText = '';

  void _addProduct() {
    setState(() {
      _products.add(Product('Product ${_products.length + 1}', 10.0));
    });
  }

  void _refreshProducts() {
    setState(() {
      _products.clear();
    });
  }

  List<Product> getFilteredProducts() {
    if (_filterText.isEmpty) {
      return _products;
    } else {
      return _products
          .where((product) =>
              product.name.toLowerCase().contains(_filterText.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = getFilteredProducts();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Product Data'),
         bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _filterText = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Filter Products',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
         )
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _filterText = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Filter Products',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredProducts[index].name),
                  subtitle: Text('\$${filteredProducts[index].price}'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _addProduct,
            child: Icon(Icons.add),
            tooltip: 'Add Product',
          ),
          SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: _refreshProducts,
            child: Icon(Icons.refresh),
            tooltip: 'Refresh Products',
          ),
        ],
      ),
    );
  }
}