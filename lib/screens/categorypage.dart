import 'package:ecommerce_app/screens/categorybydata.dart';
import 'package:ecommerce_app/screens/categoryproduct.dart';
import 'package:ecommerce_app/services/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
 body: FutureBuilder(
        future: ApiService().getCategories(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // return Text("success");
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CategoryByData(catName:snapshot.data[index].toString())));
                    },
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        padding: EdgeInsets.all(40),
                        child: Center(
                          child: Text(
                            snapshot.data[index].toString().toUpperCase(),
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    

    );
  }
}