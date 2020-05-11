import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/screens/full_width_button.dart';
import 'package:provider/provider.dart';
import '../../providers/food_items.dart';
class AddFoodItem extends StatefulWidget {
  final Map<String,String> editData;
  AddFoodItem([this.editData]);
  @override
   AddFoodItemState createState() =>  AddFoodItemState();
}

class  AddFoodItemState extends State<AddFoodItem> {
  GlobalKey<FormState> _formKey=GlobalKey();
  String title;
  String category;
  String description;
  double discount;
  double price;
  Widget _textField(String label,String dataName){
   // print("data is ${widget.editData[dataName]}");
    return TextFormField(
      initialValue: widget.editData==null?"":widget.editData[dataName],
      keyboardType: label=="Price"||label=="Discount"?TextInputType.numberWithOptions():TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: label,
      ),
      maxLines: label=="Description"?3:1,
      validator: (value){
        if(label=="Food Title"&&value.isEmpty) return "$label is required";
        else if(label=="Category"&&value.isEmpty) return "$label is required";
        else if(label=="Description"&&value.isEmpty) return "$label is required";
        else if(label=="Discount"){
          if(value.isEmpty) return "$label is required";
          else if(double.parse(value)<0||double.parse(value)>99)return "Enter a valid discount";
          }
        else if(label=="Price"){
          if(value.isEmpty) return "$label is required";
          else if(double.parse(value)<0) return "Enter a valid Price";
        }
        return null;
      },
      onSaved: (value){
        if(label=="Food Title") title=value;
        else if(label=="Category") category=value;
        else if(label=="Description") description=value;
        else if(label=="Price") price=double.parse(value);
        else if(label=="Discount") discount=double.parse(value);
      },
    );
  }
  Future<void> _submitForm() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        if(widget.editData==null){
          print("Checking boiiiiiiiiiii");
          await Provider.of<FoodItems>(context,listen: false).addItem(Food(
          name: title,
          category: category,
          description: description,
          discount: discount,
          price: price
        ));
        }
        else{
          await Provider.of<FoodItems>(context,listen: false).updateItem(Food(
          name: title,
          category: category,
          description: description,
          discount: discount,
          price: price,
          id: widget.editData["id"],
        ));
        }
        Navigator.of(context).pop();
      }catch(err){
        throw err;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                _textField("Food Title","title"),
                _textField("Category","category"),
                _textField("Description","description"),
                _textField("Price","price"),
                _textField("Discount","discount"),
                SizedBox(height: 30,),
                InkWell(
                  child: FullWidthButton(text: widget.editData==null? 'Add Item':'Update Item',),
                  onTap: _submitForm,
                  ),

              ],
            ),
          ),
        ),
        
      ),
    );
  }
}