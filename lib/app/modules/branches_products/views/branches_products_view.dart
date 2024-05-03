
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/branches_products_controller.dart';

class BranchesProductsView extends GetView<BranchesProductsController> {

  final NotchBottomBarController? cont;

   BranchesProductsView({Key? key, this.cont}) : super(key: key);

  final c = Get.find<BranchesProductsController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title:GetBuilder<BranchesProductsController>(builder: (_)  => Text(
            c.selectedCategoryId == c.categoryIndex?.id ?  c.categoryIndex!.titleAr
            :
        'Branch Categories',style: const TextStyle(color: Colors.green),),)
      ),
      body:Column(
        children: [
          GetBuilder<BranchesProductsController>(builder: (_)  => SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: c.categories.length,
              itemBuilder: (context, index) {
                final category = c.categories[index];
                return GestureDetector(
                    onTap: () {

                       c.changeCategory(category.id);
                     //  print(category.id);
                    //  _loadProducts(category.id);
                      c.loadProducts(category.id);
                    },
                    child:
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: c.selectedCategoryId == category.id
                            ? Colors.blue.withOpacity(0.3) // Highlight color
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                        border: c.selectedCategoryId == category.id
                            ? Border.all(
                          color: Colors.green,
                          width: 2.0,
                        ) // Border for selected category
                            : null,
                      ),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(category.image),
                           // Text(category.titleAr),
                          ],
                        ),
                      ),
                    ),


                );
              },
            ),
          )

              ),


    GetBuilder<BranchesProductsController>(builder: (_)  =>  Expanded(
      child:  GridView.builder(
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            ),
            itemCount: c.products.length,
            itemBuilder: (BuildContext context, int index) {
            final product = c.products[index];
            return InkWell(
              onTap: (){
               // Get.to(() =>ProductDetailsView(product: product,));
              },
              child: Stack(
                children: [



                  Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Center(
                        child: SizedBox(height:40,width: 70,
                            child: Image.network(product.images[0].image,fit: BoxFit.cover,)),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title.ar,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              product.description.ar,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${product.price.toStringAsFixed(2)}رس',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.green,
                                  ),
                                ),

                                IconButton(
                                  icon: const Icon(Icons.favorite_border),
                                  onPressed: () {
                                    // Implement favorite functionality here
                                  },
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),]
              ),
            );


            }
            ),
    )

    )
        ],
      )
    );
  }
}
