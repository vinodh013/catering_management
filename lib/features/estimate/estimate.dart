import 'package:catering_management/widgets/listtile.dart';
import 'package:catering_management/widgets/searchbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

List _estimationlist = [];

class EstimateScreen extends StatefulWidget {
  const EstimateScreen({super.key});

  @override
  State<EstimateScreen> createState() => _EstimateScreenState();
}

class _EstimateScreenState extends State<EstimateScreen> {
  GlobalKey estimatescaffoldkey = GlobalKey<ScaffoldState>();

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        width: 500,
        child: Container(),
      ),
      body: AdaptiveLayout(
        body: SlotLayout(config: {
          Breakpoints.large: SlotLayout.from(
            key: const Key('estimate large screen'),
            builder: (context) {
              return MultiSplitView(
                initialAreas: [Area(size: 350)],
                dividerBuilder:
                    (axis, index, resizable, dragging, highlighted, themeData) {
                  return const VerticalDivider();
                },
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Column(
                      children: [
                        const SearchBox(),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: EdgeInsets.only(top: 15),
                                  height: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text('hEllo')),
                                        SizedBox(
                                          height: 40,
                                          width: 80,
                                          child: Padding(
                                            padding: EdgeInsets.only(right: 15),
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty
                                                        .all(
                                                            ContinuousRectangleBorder())),
                                                onPressed: () {
                                                  setState(() {});
                                                },
                                                child: Text('Add')),
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const EstimateUpload()
                ],
              );
            },
          )
        }),
      ),
    );
  }
}

class EstimateUpload extends StatefulWidget {
  const EstimateUpload({super.key});

  @override
  State<EstimateUpload> createState() => _EstimateUploadState();
}

class _EstimateUploadState extends State<EstimateUpload> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 150, right: 100, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Customer Name',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
              Text(
                'Date : 21515',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: 250,
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Create Plate',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black45),
          ),
          const SizedBox(
            height: 25,
          ),
          Flexible(
            child: Container(
              height: 450,
              width: 750,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black12)),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.grey,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('No'),
                        Text('items'),
                        Text('Action'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 30,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('1'),
                                Text('Biriyani'),
                                Icon(Icons.delete)
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Text(
                  'Create Plate',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
                Container(
                  width: 250,
                  child: TextFormField(),
                ),
                Container(
                  width: 200,
                  child: FilledButton(
                      // style: ButtonStyle(
                      //     backgroundColor:
                      //         MaterialStatePropertyAll(Colors.purple[900])),
                      // onHover: (value) {},
                      onPressed: () {},
                      child: Text(
                        'Save',
                        // style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
