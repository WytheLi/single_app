import 'package:flutter/material.dart';   // 安卓风格
import 'package:flutter/cupertino.dart';  // IOS风格
import 'home_page.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'member_page.dart';

// 静态组件
// class IndexPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('百姓生活+'),),
//       body: Center(
//         child: Text('百姓生活+'),
//       ),
//     );
//   }
// }

// 动态组件
class IndexPage extends StatefulWidget {

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心')
    ),  
  ];

  // 底部导航栏切换策略，将tab栏每一项对应的视图页面对象用列表容器盛放，然后根据点击事件获取的索引值进行指定对应的视图页面进行渲染
  final List tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  int currentIndex = 0;
  var currentPage;
  
  @override
  void initState() {  // initState()做一些初始化的动作 这里指定默认Tab页 详细去查看Widget生命周期树
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
        centerTitle: true,
      ),
       bottomNavigationBar: BottomNavigationBar(  // 底部导航栏
        //  backgroundColor: Colors.pink,
        //  fixedColor: Colors.white,  // 指定Table栏Action项的颜色，默认为主题色
         type: BottomNavigationBarType.fixed,
         currentIndex: currentIndex,
         items: bottomTabs,
         onTap: (index){  // 单击事件
            setState(() {   // 重新绘制视图（这里切换Tab页）
              currentIndex = index;
              currentPage = tabBodies[currentIndex];
            });
         },
       ),
       body: currentPage,
    );
  }
}