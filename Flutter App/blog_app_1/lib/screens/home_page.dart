import 'package:blog_app_1/screens/post_details_page.dart';
import 'package:blog_app_1/widgets/bottom_bar_widget.dart';
import 'package:blog_app_1/widgets/post_cell_widget.dart';
import 'package:flutter/material.dart';

class Post {
  final String title;
  final String image;
  final String author;
  final String date;

  Post({this.title, this.image, this.author, this.date});
}

class HomePage extends StatelessWidget {
  final data = [
    Post(
      image: 'assets/images/flutter.jpg',
      title: 'Berkenalan Dengan Flutter',
      author: 'Haris SR',
      date: '11 Mei 2021',
    ),
    Post(
      image: 'assets/images/programming.jpg',
      title: 'Low Level VS High Level Programming',
      author: 'Asep',
      date: '13 Mei 2021',
    ),
    Post(
      image: 'assets/images/firebase.jpg',
      title: 'Bekerja Dengan Firebase',
      author: 'Yeni',
      date: '24 April 2021',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1F28),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My BLog',
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
          )
        ],
      ),
      bottomNavigationBar: BottomBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.book),
        backgroundColor: Colors.blue[900],
        elevation: 0,
        onPressed: () {},
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'cari artikel, penulis, tag',
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Blog Harian Saya',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final post = data[index];
                    return PostCellWidget(
                        title: post.title,
                        image: post.image,
                        author: post.author,
                        date: post.date,
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => PostDetailsPage(
                                title: post.title,
                                image: post.image,
                                author: post.author,
                                date: post.date,
                              ),
                            ),
                          );
                        });
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
                const SizedBox(
                  height: 20,
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
