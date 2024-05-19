import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_care/DataBase.dart';
import 'package:pet_care/petReminderDeatilsData.dart';
import 'package:pet_care/showTaskDetailsContainer.dart';
import 'package:pet_care/uihelper.dart';

class petReminderDetails extends StatefulWidget {
  final String petID;
  petReminderDetails({Key? key, required this.petID}) : super(key: key);

  @override
  State<petReminderDetails> createState() => _petReminderDetailsState();
}

class _petReminderDetailsState extends State<petReminderDetails> {
  var data;

  @override
  void initState() {
    super.initState(); // moved super.initState() above
    fetchData(); // removed async keyword from initState
  }

  // Added Future<void> return type and fixed async handling
  Future<void> fetchData() async {
    var fetchedData = await DataBase.readRemainderData(widget.petID);
    setState(() {
      data = fetchedData;
    });
  }

  bool isTaskDetail = false;

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.grey.shade300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Reminders",
              style: TextStyle(fontSize: 24),
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    "Title",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    "Time",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    "Date",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
          Divider(
            thickness: 2,
            indent: 30,
            endIndent: 30,
          ),
          data == null
              ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: const Center(
                            child: CircularProgressIndicator(),
                          ),
              )
              :ListView.separated(
                          separatorBuilder: (context, index) {
              return Divider(
                indent: 5,
                endIndent: 10,
              );
                          },
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: InkWell(
                  onTap: () {
                    isTaskDetail = true;

                    showBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return showTaskDetailsContainer(remainderDetail:data[index]);
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          data[index]["title"] as String,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            data[index]["Time"] as String,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            data[index]["Date"] as String,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            data[index]["isSilent"] =
                            !(data[index]["isSilent"] as bool);
                          });

                          final snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Ring!',
                              message: 'Notifications Turned ON!',
                              contentType: ContentType.success,
                            ),
                          );

                          final snackBarSilent = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Silent!',
                              message: 'Notifications Turned OFF!',
                              contentType: ContentType.warning,
                              color: Colors.blueGrey,
                            ),
                          );

                          data[index]["isSilent"] == true
                              ? ScaffoldMessenger.of(context)
                              .showSnackBar(snackBarSilent)
                              : ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar);
                        },
                        child: data[index]["isSilent"] == true
                            ? FaIcon(
                          FontAwesomeIcons.clock,
                          size: 20,
                        )
                            : FaIcon(
                          FontAwesomeIcons.userClock,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              );
                          },
                        ),
        ],
      ),
    );
  }
}
