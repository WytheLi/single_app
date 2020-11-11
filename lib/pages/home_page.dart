import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// 静态组件
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     getHttp();
//     return Scaffold(
//       body: Center(child: Text('商城首页'),),
//     );
//   }

//   void getHttp() async{
//     try{
//       Response response;
//       response = await Dio().get("http://47.101.37.196:5010/get_all/");
//       return print(response);
//     }catch(e){
//       return print(e);
//     }
//   }
// }

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String showText = '欢迎来到美好人间高级会所！';

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(title: Text('美好人间'),),
         body: Container(
           child: Column(
             children: [
               TextField(
                 controller: typeController,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.all(10.0),
                   labelText: '美女类型',
                   helperText: '请输入你喜欢的类型'
                 ),
                 autofocus: false,  // 文本框自动聚焦，默认true，文本框会拉出键盘
               ),
               RaisedButton(
                 onPressed: _choiceAction,
                 child: Text('选择完毕'),
               ),
               Text(
                 showText,
                 overflow: TextOverflow.ellipsis,   // 文本框内文本超出，省略号代替多余字符
                 maxLines: 1,   // 文本最多显示行数，这里指定一行
               )
             ],
           ),
         ),
       ),
    );
  }

  void _choiceAction(){
    print('点击事件触发，请求数据中。。。');
    if(typeController.text.toString() == ''){   // 文本框内容为空的判断
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text('文本内容为空!'),)   // AlertDialog提示框
      );
    }else{
      getHttp(typeController.text.toString()).then((value){   // value响应体数据
        print(value);
        setState((){
          // showText = value['data']['name'];
          showText = "代理IP: " + value[0]['proxy'];
        });
      });
    }
  }

  Future getHttp(String TypeText) async{
    try{
      Response response;
      var data = {'name': TypeText};
      
      // response = await Dio().get("https://www.easy-mock.com/mock/5fab64a65d1197774d6ab1c6/example/query",
      //   queryParameters: data  // queryParameters指定查询参数，字典类型传参
      // );
      response = await Dio().get("http://47.101.37.196:5010/get_all/");
      return response.data;
    }catch(e){
      print(e);
    }
  }
}