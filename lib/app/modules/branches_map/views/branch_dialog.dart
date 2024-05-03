import 'package:flutter/material.dart';

import '../../../data/models/mapBranches.dart';

class BranchDialog extends StatelessWidget {
  final String title;
  final String phone;
   final int isActive;
  final String image;
  final String address;
  final double distance;
  final String statusAr;
  const BranchDialog({super.key, required this.phone,required this.address,
    required this.distance,required this.image,
    required this.isActive,required this.title,required this.statusAr});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 22.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(title,style:const TextStyle(fontWeight: FontWeight.bold) ,),
                    const SizedBox(height: 10),
                    Text('رقم الجوال:$phone') ,
                  ],
                ),
                const SizedBox(width: 20),


                    Container(
                      height: 100,
                        width: 100,
                        decoration:const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100)
                          ),
                        ),
                        child: Image.network(image,fit: BoxFit.fill,)),

              ],
            ),
            const SizedBox(
              height: 22.0,
            ),
            const Divider(
              height: 2.0,
              thickness: 2.0,
            ),
            const SizedBox(
              height: 16.0,
            ),

            ListTile(leading: const Icon(Icons.my_location),
            title: const Text('عنوان الفرع'),
              subtitle: Text(address),
            ),

            const SizedBox(
              height: 16.0,
            ),

            ListTile(leading: const Icon(Icons.location_on),
              title: const Text('الوصول الي الفرع'),
              subtitle: Text('${distance.toInt()}كم'),
            ),
            const SizedBox(
              height: 16.0,
            ),


              if (isActive ==1)
              const Text('مفتوح',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 25),)
    else const Text('مغلق',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 25)),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}