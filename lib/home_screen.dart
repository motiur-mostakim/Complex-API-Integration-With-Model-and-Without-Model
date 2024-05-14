// import 'dart:convert';

// import 'package:api_integration_final/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<UserModel> userList = [];

//     Future<List<UserModel>> getUserApi() async {
//       final response = await http
//           .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

//       var data = jsonDecode(response.body.toString());

//       if (response.statusCode == 200) {
//         for (Map<String, dynamic> i in data) {
//           userList.add(UserModel.fromJson(i));
//         }
//         return userList;
//       } else {
//         return userList;
//       }
//     }

//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//               child: FutureBuilder(
//                   future: getUserApi(),
//                   builder: (BuildContext context,
//                       AsyncSnapshot<List<UserModel>> snapshot) {
//                     if (!snapshot.hasData) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else {
//                       return ListView.builder(
//                           itemCount: userList.length,
//                           itemBuilder: (context, index) {
//                             return Card(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                         "Name:  ${snapshot.data![index].name.toString()}"),
//                                     Text(
//                                         "UserName:  ${snapshot.data![index].username.toString()}"),
//                                     Text(
//                                         "E-mail:  ${snapshot.data![index].email.toString()}"),
//                                     Text(
//                                         "Phone:  ${snapshot.data![index].phone.toString()}"),
//                                     Text(
//                                         "Address:  ${snapshot.data![index].address?.city.toString()}, "
//                                         " ${snapshot.data![index].address?.street.toString()},"
//                                         " ${snapshot.data![index].address?.zipcode.toString()},"
//                                         " ${snapshot.data![index].address?.suite.toString()}"),
//                                     Text(
//                                         "Company:  ${snapshot.data![index].company.toString()}"),
//                                     Text(
//                                         "Website:  ${snapshot.data![index].website.toString()}"),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           });
//                     }
//                   }))
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GetData> getList = [];

  Future<List<GetData>> getDataList() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        GetData getData = GetData(
          name: i["name"],
          id: i["id"],
          username: i["username"],
          email: i["email"],
          // address: i["address"],
          // company: i["company"],
          phone: i["phone"],
          // zipcode: i["zipcode"],
          // suite: i["suite"],
          // website: i["website"],
        );
        getList.add(getData);
      }
      return getList;
    } else {
      return getList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getDataList(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<GetData>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: getList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data![index].name.toString()),
                                  Text(snapshot.data![index].username.toString()),
                                  Text(snapshot.data![index].email.toString()),
                                  Text(snapshot.data![index].phone.toString()),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}

class GetData {
  String name, username, email,
  phone;
  // website,
  // company,
  // zipcode,
  // suite,
  // address;
  int id;
  GetData({
    required this.username,
    required this.id,
    required this.name,
    // required this.address,
    // required this.company,
    required this.email,
    required this.phone,
    // required this.suite,
    // required this.website,
    // required this.zipcode
  });
}
