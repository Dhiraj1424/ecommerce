import 'package:ecommerce_app/screens/producrdetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/provider/fetchdatabycategory.dart';

class CategoryByData extends StatefulWidget {

  final String catName;
  const CategoryByData({
    Key? key,
    required this.catName,
  }) : super(key: key);

  @override
  State<CategoryByData> createState() => _CategoryByDataState();
}

class _CategoryByDataState extends State<CategoryByData> {

@override
  void initState() {
    // TODO: implement initState

  final  myData=Provider.of<FetchDataByCategoryProvider>(context,listen: false);
  myData.getDataByCategory(widget.catName);
      super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final  myData=Provider.of<FetchDataByCategoryProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: myData.loading?ListView.builder(
        itemCount: myData.myDataList.length,
        itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: (() {
            Navigator.push(context, MaterialPageRoute(builder: ((context) => 
                ProductDetail(prodDetail: myData.myDataList[index])
                )));
          }),
          child: Card(
           child: Column(
            children: [
              Text('${myData.myDataList[index].title}'),
              SizedBox(
                height: 10,
              ),
              Image.network('${myData.myDataList[index].image}'),
               SizedBox(
                height: 10,
              ),
              Text('Rs. ''${myData.myDataList[index].price}'),
               SizedBox(
                height: 10,
              ),
            ],
           ),
          ),
        );
      })
      ):CircularProgressIndicator()
    );
  }
}