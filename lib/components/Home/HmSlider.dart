import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList; // 轮播图数据

  HmSlider({Key? key, required this.bannerList}) : super(key: key);

  @override
  _HmSliderState createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  // 轮播图控制器
  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();

  // 轮播图
  Widget _getSlider() {
    return CarouselSlider(
      carouselController: _carouselSliderController,
      items: List.generate(widget.bannerList.length, (index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        aspectRatio: 640 / 420,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  // 搜索框
  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 10,
      right: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 10),
            Text("搜索...", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  // 当前选中的索引
  int _currentIndex = 0;

  //  返回指示灯导航部件
  Widget _getDots() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.bannerList.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = index;
              });
              _carouselSliderController.animateToPage(index);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: _currentIndex == index ? 40 : 20,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: _currentIndex == index
                    ? const Color.fromARGB(255, 255, 141, 1)
                    : Colors.white.withOpacity(0.4),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);
  }
}
