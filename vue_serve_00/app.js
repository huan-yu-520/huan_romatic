//app.js node.js 服务器
//1:第三方模块 
//  express          web服务器
//  cors             跨域
//  express-session  session
//  body-parser      处理post数据
//  multer           上传文件
//  fs               文件操作(内置)
//  mysql            mysql驱动模块 
//下载指令:联网 
//npm i express-session body-parser //multer mysql express cors
//1:引入二个模块  express mysql
const express = require("express");
const mysql = require("mysql");
//2:创建连接池
var pool = mysql.createPool({
  host:"127.0.0.1",
  user:"root",
  password:"",
  port:3306,
  database:"xz",
  connectionLimit:50
})
//3:创建express对象
var server = express();
//4.指定静态目录
server.use(express.static("public"));
//5:处理跨域请求
const cors = require("cors");
server.use(cors({
  origin:["http://127.0.0.1:8080",
  "http://localhost:8080"],
  credentials:true
}));
//6:添加session功能
const session = require("express-session");
server.use(session({
  secret:"128位字符串",
  resave:true,
  saveUninitialized:true
}));
//9:绑定监听端口
server.listen(3000);

//10：接收用户登录请求
server.get("/login",(req,res)=>{
   //1:接收脚手架参数 uname upass
  var uname = req.query.uname;
  var upass = req.query.upass;
  var sql =" SELECT id FROM my_vue";
  sql+=" WHERE uname = ?";
  sql+=" AND upass = md5(?)";
   //3:返回结果 
  pool.query(sql,[uname,upass],(err,result)=>{
    if(err)throw err;
    if(result.length==0){
       res.send({code:-1,msg:"用户名或密码有误"});
     }else{
       //result=[{id:1}]
       req.session.uid = result[0].id 
       console.log(req.session.uid);
       res.send({code:1,msg:"登录成功"});
     }
   });
});

server.get("/reg",(req,res)=>{
  var uname=req.query.uname;
  var upass=req.query.upass;
  var sql="INSERT INTO my_vue SET ?";
  pool.query(sql,[req.query],(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>=1){
      res.send({code:1,msg:"注册成功"});
    }
  })
});

server.get("/free",(req,res)=>{
  var sql="select pid, img, title from vue_pic";
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    if(result.length==0){
      res.send({code:-1,msg:"数据加载失败"});
    }
    else{
      res.send({code:1,msg:"加载成功",data:result})
    }
  })
});

server.get("/freedata",(req,res)=>{
  var pno=req.query.pno;
  var ps=req.query.pageSize;
  if(!pno){pno=1}
  if(!ps){ps=6}
  var sql = " SELECT fid,img,title,reading,comment";
  sql+=" FROM free_original";
  sql+=" LIMIT ?,?";
  var offset = (pno-1)*ps;
  ps = parseInt(ps);
  //3:json
  pool.query(sql,[offset,ps],(err,result)=>{
    if(err)throw err;
    res.send({code:1,msg:"查询成功",data:result});
  });
})







