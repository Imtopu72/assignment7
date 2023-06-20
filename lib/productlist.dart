import 'package:flutter/material.dart';
import 'package:assignment7/cart.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  List<Product> products = [
    Product('MI', 5),
    Product('Samsung', 10),
    Product('Symphony', 15),
    Product('Oppo', 20),
    Product('Vivo', 25),
    Product('Infinix', 30),
    Product('Pixel', 35),
    Product('Apple', 45),
  ];
  int totalProducts = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage(products: products, totalProducts: totalProducts)),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            trailing: CounterButton(
              product: products[index],
              onPressed: () {
                setState(() {
                  totalProducts++;
                  products[index].incrementCounter();
                  if (products[index].counter == 5) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Congratulations!'),
                          content: Text('You\'ve bought 5 ${products[index].name}!'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                });
              },
            ),
          );
        },

      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  int counter;

  Product(this.name, this.price) : counter = 0;

  void incrementCounter() {
    counter++;
  }
}

class CounterButton extends StatelessWidget {
  final Product product;
  final VoidCallback onPressed;

  CounterButton({required this.product, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter: ${product.counter}'),
        SizedBox(
          height: 28,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text('Buy Now'),
          ),
        ),
      ],
    );
  }
}
