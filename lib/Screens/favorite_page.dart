import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamamia_uniproject/Auth/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:mamamia_uniproject/components/favorite_card.dart';
import 'package:mamamia_uniproject/components/normal_appbar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});
  Future<List> getFavorites() async {
    String? token = await Get.find<Model>().getToken();
    final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/auth/get_favorite_products"),
        body: {
          "token": token,
        });
    print(response.body);
    List productList = jsonDecode(response.body);
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NormalAppBar('Favorites'.tr),
        body: FutureBuilder(
            future: getFavorites(),
            builder: (context, snapshot) {
              var data = snapshot.data;
              if (data == null) {
                return const Center(child: LinearProgressIndicator());
              } else {
                var datalength = data.length;
                if (datalength == 0) {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(
                          Icons.favorite,
                          size: 50,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Center(
                        child: Text("fav Page".tr),
                      ),
                    ],
                  ));
                } else {
                  return ListView.builder(
                      itemCount: datalength,
                      itemBuilder: (context, index) {
                        return FavoriteCard(
                          Favid: data[index]["id"],
                          name: data[index]["product_details"]["name"],
                          id: data[index]["product_details"]["id"],
                          price: data[index]["product_details"]["price"],
                          imageLink: "assets/images/product.png",
                          category: "food",
                        );
                      });
                }
              }
            }));
  }
}
      
       /*Obx(
        () {
          if (Get.find<FavoriteController>().favoriteItems.isEmpty) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    Icons.favorite,
                    size: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Center(
                  child: Text("fav Page".tr),
                ),
              ],
            ));
          }
          return Column(children: [
            Expanded(
              child: ListView.builder(
                itemCount: Get.find<FavoriteController>().favoriteItems.length,
                itemBuilder: (context, index) {
                  return Get.find<FavoriteController>()
                      .favoriteCardsList[index];
                },
              ),
            ),
          ]);
        },
      ),*/
    

       

       /* Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Center(
           child: Icon(
             Icons.favorite,
             size: 50,
             color: MainPage.orangeColor,
           ),
         ),
         const Center(
           child: Text('fav Page'),
         ),
      ],
     ),
       );
  }
*/
