import 'package:e_commerce/data/models/universal_response.dart';
import 'package:e_commerce/data/network/providers/apiprovider.dart';
import 'package:e_commerce/data/status/form_status.dart';
import 'package:flutter/cupertino.dart';

import '../data/models/widget_model.dart';

class PageProvider with ChangeNotifier{
  PageProvider(){
    fetchComponents();
  }
  List<WidgetModel> items = [];
  String errorText = '';
  FormStatus status = FormStatus.pure;

  Future<void> fetchComponents()async{
    notify(FormStatus.loading);
    UniversalData data = await ApiProvider().fetchData();
    print("DDDDDDDDD: ${data.data}");
    if(data.error.isEmpty){
      print("DAAAAAAATA:  ${data.data}");
      notify(FormStatus.success);
      items = data.data as List<WidgetModel>;
    }else{
      notify(FormStatus.failure);
      errorText = data.error;
    }
  }

  notify(FormStatus value){
    status = value;
    notifyListeners();
  }

}