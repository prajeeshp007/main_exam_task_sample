import 'package:flutter/material.dart';
import 'package:main_exam_task_sample/controller/home_Screen_controller.dart';
import 'package:main_exam_task_sample/view/products_details_screen/products_details_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<HomeScreenController>().getAllProductData();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Screen'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<HomeScreenController>(
            builder: (context, homneprovider, child) => homneprovider.isloading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Text(
                        'All Products',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemCount: homneprovider.productlist.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductsDetailsScreen(
                                    product_id: homneprovider
                                        .productlist[index].id!
                                        .toString(),
                                  ),
                                ));
                          },
                          child: ListTile(
                            title: Text(
                              homneprovider.productlist[index].name ??
                                  "Unknown",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Color: ${homneprovider.productlist[index].data?.color ?? "Not available"}",
                                ),
                                Text(
                                  "Capacity: ${homneprovider.productlist[index].data?.capacity ?? "Not available"}",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
          )),
    );
  }
}
