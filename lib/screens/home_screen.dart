import 'package:flutter/material.dart';
import 'package:task_app/data/repository.dart';
import 'package:task_app/util/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<String> productList = [''];
  static List<String> singleTonList = [''];
  static List<String> productType = [''];
  static List<String> productSelected = [''];
  static List<String> weightList = [''];
  static List<String> weightPacking = [''];
  static List<String> weightPrice = [''];
  static List<String> sizeList=[''];
  static List<String> sizePacking = [''];
  static List<String> sizePrice = [''];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD PRODUCT'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ..._getProductsFields(),
              ElevatedButton(onPressed: ()=> getFormData(), child: const Text("SUBMIT"))
            ],
          ),
        ),
      ),
    );
  }
  List<Widget> _getProductsFields(){
    List<Widget> productTextFields = [];
    for(int i=0; i<productList.length; i++){
      productTextFields.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                ProductNameField(i),
                SizedBox(height: 16,),
                ProductTypeField(i),
                SizedBox(height: 16,),
                // we need add button at last friends row
                _addRemoveButton(i == productList.length-1, i),
              ],
            ),
          )
      );
    }
    return productTextFields;
  }


  /// add / remove button
  Widget _addRemoveButton(bool add, int index){
    return InkWell(
      onTap: (){
        if(add){
          // add new text-fields at the top of  textfields
          productList.insert(0, '');
          productType.insert(0, '');
          singleTonList.insert(0, '');
          setState((){});
        }
        else {
          productList.removeAt(index);
          productType.removeAt(index);
          singleTonList.removeAt(index);
          setState((){});
        }

      },
      child: Container(
        width: 60,
        height: 50,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon((add) ? Icons.add : Icons.remove, color: Colors.white,),
      ),
    );
  }

  //product filed
  Widget ProductNameField(int index){
    return TextFormField(
      onChanged: (v) => productList[index] = v,
      decoration: textFieldDecoration(hintText: 'Product Name'),
    );

  }
  Widget ProductTypeField(int index){
    List<String> productType = ["Singleton","Weight","Size"];
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(50),
              border: Border.all(width: 1,color: Color(0xFFB1B1B1))
          ),
          child: DropdownButton(
            underline: SizedBox(),
            borderRadius: BorderRadius.circular(16),
            focusColor: Colors.transparent,
            iconSize: 25,
            isExpanded: true,
            items: productType.map((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) async{
              productSelected.insert(index, value.toString());
              setState(() {
              });
            },
            hint: Text(productSelected[index]==''? "Product Type" :productSelected[index] ),
          ),
        ),
        SizedBox(height: 16),
        if(productSelected[index]=='Singleton') SingleTon(index),
        if(productSelected[index]=='Weight') ..._getWeightProducts(),
        if(productSelected[index]=='Size') ..._getSizeProducts(),

      ],
    );

  }

Widget SingleTon(int index){
  return TextFormField(
    onChanged: (v) => singleTonList[index] = v,
    decoration: textFieldDecoration(hintText: 'Price'),
  );
}
Widget Weight(int index){
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (v) => weightPacking[index] = v,
            decoration: textFieldDecoration(hintText: 'Weight'),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: TextFormField(
            onChanged: (v) => weightPrice[index] = v,
            decoration: textFieldDecoration(hintText: 'Price'),
          ),
        ),
      ],
    );
  }
  List<Widget> _getWeightProducts(){
    List<Widget> weightTextFields = [];
    for(int i=0; i<weightList.length; i++){
      weightTextFields.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(child: Weight(i)),
                  SizedBox(width: 8),
                  _addRemoveButtonWeight(i == weightList.length-1, i),
                ],
            ),
          )
      );
    }
    return weightTextFields;
  }

  Widget _addRemoveButtonWeight(bool add, int index){
    return InkWell(
      onTap: (){
        if(add){
          weightList.insert(0, '');
          weightPacking.insert(0, '');
          weightPrice.insert(0, '');
          setState((){});
        }
        else {
          weightList.removeAt(index);
          weightPacking.removeAt(index);
          weightPrice.removeAt(index);
          setState((){});
        }

      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon((add) ? Icons.add : Icons.remove, color: Colors.white,),
      ),
    );
  }
  Widget Size(int index){
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (v) => sizePacking[index] = v,
            decoration: textFieldDecoration(hintText: 'Size'),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: TextFormField(
            onChanged: (v) => sizePrice[index] = v,
            decoration: textFieldDecoration(hintText: 'Price'),
          ),
        ),
      ],
    );
  }
  List<Widget> _getSizeProducts(){
    List<Widget> weightTextFields = [];
    for(int i=0; i<sizeList.length; i++){
      weightTextFields.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: Size(i)),
                SizedBox(width: 8),
                _addRemoveButtonSize(i == sizeList.length-1, i),
              ],
            ),
          )
      );
    }
    return weightTextFields;
  }

  Widget _addRemoveButtonSize(bool add, int index){
    return InkWell(
      onTap: (){
        if(add){
          sizeList.insert(0, '');
          sizePacking.insert(0, '');
          sizePrice.insert(0, '');
          setState((){});
        }
        else {
          sizeList.removeAt(index);
          sizePacking.removeAt(index);
          sizePrice.removeAt(index);
          setState((){});
        }

      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon((add) ? Icons.add : Icons.remove, color: Colors.white,),
      ),
    );
  }

  void getFormData(){
    Map<String,dynamic> map={};
    for(int i=0; i<productList.length;i++){
     map.addAll({
      "product": i,
      "productName":productList[i],
      "type":productSelected[i],
      if( productSelected[i]=='Singleton') 'price': singleTonList[i],
      if(productSelected[i]=='Weight') 'price' :{
        for(int j=0;j<weightList.length;j++){
          weightPacking[i]:weightPrice[i]
        }
      },
      if(productSelected[i]=='Size') 'price' :{
        for(int j=0;j<sizeList.length;j++){
          sizePacking[i]:sizePrice[i]
        }
      }
    });
    print(map);
    //post api hit
    Repo().postProduct(context, map);
  }

  }
}

