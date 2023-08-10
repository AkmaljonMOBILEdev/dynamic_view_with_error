import 'package:e_commerce/data/models/widget_model.dart';
import 'package:e_commerce/data/network/providers/apiprovider.dart';
import 'package:e_commerce/data/status/form_status.dart';
import 'package:e_commerce/providers/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
  init();
    super.initState();
  }
  init()async{
    ApiProvider apiProvider =ApiProvider();
    var data = await apiProvider.fetchData();
    print(data.data);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Dynamic View"),
    //   ),
    //   body: Stack(
    //     children: [
    //       ListView.builder(itemBuilder: (BuildContext context,int index) {
    //         return dynamicMaker(context.watch<PageProvider>().items[index]);
    //       }),
    //       Visibility(
    //           visible: FormStatus.loading==context.watch<PageProvider>().status,
    //           child: const Center(child: CircularProgressIndicator(),))
    //     ],
    //   )
    // );
  }

  Widget dynamicMaker(WidgetModel widgetModel) {
    Color color = Color(
        int.parse(widgetModel.color.substring(1, 7), radix: 16) + 0xFF000000);
    return Container(
        height: widgetModel.height,
        width: widgetModel.width,
        decoration: BoxDecoration(
          color: color,
        ),
        child: widgetModel.type == "container"
            ? Container(
          child: Text("Title:  ${widgetModel.title}"),
        ) : widgetModel.type == "column" ? Column(
          children: [Text("Title:  ${widgetModel.title}")],) : widgetModel
            .type == "raw" ? Row(
          children: [Text("Title:  ${widgetModel.title}")],) : SizedBox(
          child: Text("Title:  ${widgetModel.title}"),)
    );
  }
}
