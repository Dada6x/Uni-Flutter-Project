import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamamia_uniproject/Models/products.dart';
import 'package:mamamia_uniproject/components/Product_card_HomePage.dart';
import 'package:http/http.dart' as http;

class ProjectSearchBar extends StatefulWidget {
  const ProjectSearchBar({super.key});

  @override
  State<ProjectSearchBar> createState() => _ProjectSearchBarState();
}

class _ProjectSearchBarState extends State<ProjectSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 20),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: TextField(
            readOnly: true,
            decoration: InputDecoration(
                hintText: "What are you looking for?".tr,
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Theme.of(context).colorScheme.primary,
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
            onTap: () {
              showSearch(
                  context: context,
                  delegate:
                      Search()); //removed search page and used search delegate instead
            }),
      ),
    );
  }
}

//widget thats used in search
class Search extends SearchDelegate {
  Future<List> getFilteredList(String search) async {
    final response = await http.post(
        Uri.parse("http://192.168.151.48:8000/api/auth/search_in_products"),
        body: {
          "token":
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xNTEuNDg6ODAwMC9hcGkvcmVnaXN0ZXIiLCJpYXQiOjE3MzYyNDA5NzksImV4cCI6MTczNjI0NDU3OSwibmJmIjoxNzM2MjQwOTc5LCJqdGkiOiJiTTI1bUNBbjhEZDg4OHRBIiwic3ViIjoiMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.6tXFc7bEr97OQ0e_Wx2CgOgRBJ-iIgEagW_aI4yzIBA",
          "search": search
        });
    List list = jsonDecode(response.body);
    return list;
  }

  @override
  String get searchFieldLabel => 'Search'.tr;
  @override
  List<Widget>? buildActions(BuildContext context) {
    //app bar actions in search page
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.remove))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //app bar leading in search page
    return IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    //app bar body after pressing the search icon on keyborad
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //app bar body before pressing search icon on keyboard
    if (query != "") {
      return FutureBuilder(
          future: getFilteredList(query),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (data == null) {
              return const Center(child: LinearProgressIndicator());
            } else {
              var datalength = data.length;
              if (datalength == 0) {
                return const Center(
                  child: Text('no data found'),
                );
              } else {
                return ListView.builder(
                    itemCount: datalength,
                    itemBuilder: (context, index) {
                      return ProjectProductCartCardHome(
                        name: data[index]["name"],
                        id: data[index]["id"],
                        price: data[index]["price"],
                        imageLink: "assets/images/product.png",
                        category: "food",
                      );
                    });
              }
            }
          });
    } else {
      return const Productsgetter();
    }
  }
}
//! make the searchBar logic for search for the shit
