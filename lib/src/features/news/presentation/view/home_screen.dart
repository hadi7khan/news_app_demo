import 'package:assignment/drawer.dart';
import 'package:assignment/src/features/authentication/presentation/view/login_screen.dart';
import 'package:assignment/src/features/authentication/presentation/view_model/sign_in.dart';
import 'package:assignment/src/features/news/presentation/view_model/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final String? name;
  const HomeScreen({Key? key, this.name}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsAdp>(context, listen: false)
        .getNews();
  }
  Future<Null> refresh() {
    return Provider.of<NewsAdp>(context, listen: false)
        .refreshNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name == null ? "Greetings!" : widget.name!,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 34.sp),
                    ),
                    Icon(Icons.width_normal_rounded,
                        color: Color.fromRGBO(235, 87, 87, 1), size: 24),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Welcome back",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(36, 36, 36, 0.5)),
                ),
                SizedBox(height: 28.h),
              Text(
                "News",
                style: TextStyle(
                  color: Color.fromRGBO(36, 36, 36, 1),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Consumer<NewsAdp>(builder: (context, value, child) {
        if (value.newshttpCode == "") {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (value.newshttpCode != "200" ||
            value.news == null) {
          return Center(
            child: Text("Something went wrong!"),
          );
        }
        return RefreshIndicator(
          onRefresh: refresh,
          child: value.news!.articles!.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        child: SvgPicture.asset(
                          "assets/inprogress.svg",
                          height: MediaQuery.of(context).size.width * 0.5,
                          width: MediaQuery.of(context).size.width * 0.6,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10),
                        child: Text(
                          "News is empty",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(color: Colors.grey.shade100),
                      child: ListTile(
                        isThreeLine: true,
                        leading: CircleAvatar(
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          value.news!.articles![index].title!,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(value.news!.articles![index].author == null ? "" :
                          value.news!.articles![index].author!  ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.white,
                      ),
                  itemCount: value.news!.articles!.length),
        );
      }),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
