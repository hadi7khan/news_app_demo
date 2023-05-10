import 'package:assignment/src/features/news/data/models/news_model.dart';
import 'package:assignment/src/features/news/presentation/view/tabs_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatefulWidget {
  final int? index;
  final NewsModel? newsDetails;
  const NewsDetailsScreen({
    super.key,
    this.newsDetails,
    this.index,
  });

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      // physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return TabsScreen();
                                        },));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                // color: AppColors.themeColor,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: CachedNetworkImage(
                  // height: 300.0,
                  // width: double.infinity,
                  imageUrl:
                      widget.newsDetails!.articles![widget.index!].urlToImage!,
                  fit: BoxFit.cover,
                  placeholder: ((context, url) => const Center(
                        child: CircularProgressIndicator(),
                      )),
                  // errorWidget:  ((context, url) => const Center(
                  //   child: CircularProgressIndicator(),
                  // )),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: Card(
              elevation: 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      top: 10.0,
                    ),
                    child: Text(
                      widget.newsDetails!.articles![widget.index!].author!,
                      style: const TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 18.0,
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: Text(
                          'News Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.description_outlined,
                        color: Colors.black,
                        size: 18.0,
                      )
                    ],
                  ),
                  // const SizedBox(
                  //   height: 3.0,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      top: 5.0,
                      right: 18.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Title:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text( widget.newsDetails!.articles![widget.index!].title == null ? "":
                            widget.newsDetails!.articles![widget.index!].title!,
                            maxLines: 5,
                            style: const TextStyle(
                                fontSize: 12.0, overflow: TextOverflow.clip),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      top: 5.0,
                      right: 18.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              // fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'Published At: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: widget.newsDetails!
                                    .articles![widget.index!].publishedAt!,
                                style: const TextStyle(
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      top: 5.0,
                    ),
                    child: Text(
                      'News Description:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 5.0,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      top: 5.0,
                      right: 18.0,
                      bottom: 10.0,
                    ),
                    child: Text(
                      widget.newsDetails!.articles![widget.index!].description!,
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
