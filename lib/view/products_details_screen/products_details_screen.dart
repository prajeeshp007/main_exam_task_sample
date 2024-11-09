import 'package:flutter/material.dart';
import 'package:main_exam_task_sample/controller/products_details_screen_controller.dart';
import 'package:main_exam_task_sample/view/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

class ProductsDetailsScreen extends StatefulWidget {
  final String product_id;
  const ProductsDetailsScreen({super.key, required this.product_id});

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context
            .read<ProductsDetailsScreenController>()
            .getSingleproduct(product_id: widget.product_id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
          icon: const Icon(Icons.keyboard_backspace_rounded),
        ),
        centerTitle: true,
        title: const Text(
          'Product Detail Screen',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Consumer<ProductsDetailsScreenController>(
        builder: (context, productController, child) {
          // final product = productController.singleproduct!;
          return productController.isloading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productController.singleproduct!.name ?? "Product Name",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Text(
                      //   "ID: ${product.id}",
                      //   style: const TextStyle(fontSize: 16),
                      // ),
                      const SizedBox(height: 16),
                      Text(
                        "Year: ${productController.singleproduct!.data?.year ?? "Not available"}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Price: \$${productController.singleproduct!.data?.price?.toStringAsFixed(2) ?? "Not available"}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "CPU Model: ${productController.singleproduct!.data?.cpuModel ?? "Not available"}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
