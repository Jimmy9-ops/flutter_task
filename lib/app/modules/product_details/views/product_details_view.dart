
import 'package:flutter/material.dart';
import 'package:flutter_task/app/data/models/product.dart';

import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
   Product product;

   ProductDetailsView(  {super.key, required this.product});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title:  Text(  product.title.ar,
        style: const TextStyle(fontSize: 20,),)),
      body: SingleChildScrollView(
        child: Stack(
         // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           // SizedBox(height: 100,),
            // Stack to overlay the card with the image

                Positioned(
                  top: 100,
                  child: Card(
                      elevation: 4,
                      //margin: EdgeInsets.all(16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 300,),
                            Text(
                              product.title.ar,
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              product.description.ar,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Price: \$${product.price.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                ),

                // Positioned image overlaying with the card
                Positioned(
                  top: -200,
                  left: 0,
                  right: 0,

                  // Adjust the bottom value as needed
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.network(
                      product.images[0].image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),


            // Add to Cart button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  // Add to cart functionality
                },
                child: const Text('Add to Cart'),
              ),
            ),
          ]
        ),

      )
    );
  }
}
