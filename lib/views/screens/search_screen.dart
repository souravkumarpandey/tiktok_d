import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controllers/search_controller.dart';
import 'package:tiktok_clone/models/user.dart';
import 'package:tiktok_clone/views/screens/profile_screen.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});

final SearchController searchController= Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: TextFormField(
              decoration: const InputDecoration(
                filled: false,
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                )
              ),
              onFieldSubmitted: (value)=> searchController.searchUser(value),
            ),
          ),
          body: searchController.searchedUser.isEmpty?const Center(
            child: Text('Search for users', style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),),
          ):ListView.builder(
                itemCount: searchController.searchedUser.length,
                itemBuilder: (context, index) {
                  User user = searchController.searchedUser[index];
                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(uid: user.uid),
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          user.profilePhoto,
                        ),
                      ),
                      title: Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
        );
      }
    );
  }
}