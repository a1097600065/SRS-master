<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.*" %>
<%@ page import="sqliteDao.*" %>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Map.Entry" %>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>课程管理</title>
  <meta name="description" content="这是一个 user 页面">
  <meta name="keywords" content="user">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar admin-header">
  <div class="am-topbar-brand">
    <strong>学生选课管理系统</strong> 
  </div>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> <%=request.getSession().getAttribute("username")%><span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>
        </ul>
      </li>
      <li><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar">
    <ul class="am-list admin-sidebar-list">
      <li class="admin-parent">
      <a class="am-cf" href="courseManage.jsp"><span class="am-icon-table"></span>课程管理</a></li>
      <li id="professorManage"><a href="professorManage.jsp"><span class="am-icon-table"></span> 教师管理</a></li>
    </ul>

    <div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-bookmark"></span> 公告</p>
        <p>学生选课系统</p>
      </div>
    </div>

  
  </div>
  <!-- sidebar end -->

  <!-- content start -->
 <!-- content start -->
  <div class="admin-content">

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">课程管理</strong></div>
    </div>

    <div class="am-g">
      <div class="am-u-md-6 am-cf">
        <div class="am-fl am-cf">
          <div class="am-btn-toolbar am-fl">
           <div class="am-btn-group am-btn-group-xs">
              <button type="button" class="am-btn am-btn-default"  data-am-modal="{target: '#modal', closeViaDimmer: 0, width: 400, height: 225}"><span class="am-icon-plus"></span> 新增</button>
            </div>
            <!-- 新增遮罩层 -->
            <div class="am-modal am-modal-no-btn" tabindex="-1" id="modal">
              <div class="am-modal-dialog">
                 <div class="am-modal-hd">新增排课
                  <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
                </div>
	              <div class="am-modal-bd">
	              <form class="am-form">
	               <label for="no" class="am-fl">排课编号：</label><input type="text"name="no" id="no">
	               <label for="course" class="am-fl">课程：</label>
	               <select id="course">
	                  <%    CourseDao courseDao=new CourseDaoImpl();                		
	            		    HashMap<String, Course> cs=courseDao.findAll();
                           			
							for (Entry<String, Course> entry : cs.entrySet()) {
								entry.getKey();
								entry.getValue().getCourseName();
							
                      %>
	                   <option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
                       <%} %>	          
	               </select>
	               <label for="room" class="am-fl">上课地点：</label><input type="text" name="room" id="room">
	               <label for="seat" class="am-fl">选课容量：</label><input type="text" name="seat" id="seat">
	               <label  class="am-fl">上课学期：</label>
	               <select id="semester">
	                   <option value="201601">201601</option>
                       <option value="201602">201602</option>
                    </select>
	               <label  class="am-fl">上课时间：</label>
	               <select id="day">
	                   <option value="星期一">星期一</option>
                       <option value="星期二">星期二</option>
                       <option value="星期三">星期三</option>
                       <option value="星期四">星期四</option>
                       <option value="星期五">星期五</option>
                    </select>
	               <select id="time">
	                   <option value="8:00-10:15">8:00-10:15</option>
		               <option value="10:15-12:00">10:15-12:00</option>
		               <option value="14:30-16:15">14:30-16:15</option>
	               </select>
	                <label for="p" class="am-fl">任课老师：</label>
	               <select id="p">
	                  <%    PersonDao PersonDao=new PersonDaoImpl();
	                		Professor professor=new Professor();
	                		professor.setTitle("");
	                		professor.setDepartment("");
                            List ps=PersonDao.findProfessors(professor);
                       
                            Iterator i = ps.iterator();
                    		while(i.hasNext()){
                    			Professor p =(Professor)i.next();
                      %>
	                   <option value="<%=p.getSsn()%>"><%=p.getName()%></option>
                       <%} %>
                    </select>
	           
	                 <br/>
	                <input type="button" value="新增排课" id="addSection">
	              </form>
	              </div>
              </div>
             </div>
             <!-- end -->
             
               <!-- 显示已选学生遮罩层 -->
            <div class="am-modal am-modal-no-btn" tabindex="-1" id="yixuan">
              <div class="am-modal-dialog">
                 <div class="am-modal-hd">
                  <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
                </div>
	              <div class="am-modal-bd">
	              <form class="am-form">
	               
	              <label id="sno" class="am-fl"></label>
	               <table id="stable" class="am-table am-table-striped am-table-hover table-main">
	               <thead>
	               <th>SSN</th>
	               <th>名字</th>
	               <th>专业</th>
	               </thead>
	               <tbody>
	                <tr></tr>
	               </tbody>
	               </table>
	              </form>
	              </div>
              </div>
             </div>
             <!-- end -->

            <div class="am-form-group am-margin-left am-fl">
             <label for="sec">学期：</label> 
              <select id="sec">
               <option value="201601">201601</option>
               <option value="201602">201602</option>
              </select>
              <label for="c" >课程：</label>
	               <select id="c">
	                  <%                 		
							for (Entry<String, Course> entry : cs.entrySet()) {
								entry.getKey();
								entry.getValue().getCourseName();
							
                      %>
	                   <option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
                       <%} %>	          
	               </select>
	             <input type="button" id="search" value="查询">
            </div>
          </div>
        </div>
      </div>  

    <div class="am-g">
      <div class="am-u-sm-12">
        <form class="am-form">
          <table id="ctable" class="am-table am-table-striped am-table-hover table-main">
            <thead>
              <tr>
                <th>排课编号</th>
                <th>课程名称</th>
                <th>上课时间</th>
                <th>地点</th>
                <th>任课教师</th>
                <th>剩余容量</th>
                <th class="table-set">操作</th>
                <th>已选学生</th>
              </tr>
          </thead>
          <tbody>
            <tr>

            </tr>
          </tbody>
        </table>
          <div class="am-cf">
  共6条记录
  <div class="am-fr">
    <ul class="am-pagination">
      <li class="am-disabled"><a href="#">«</a></li>
      <li class="am-active"><a href="#">1</a></li>

      <li><a href="#">»</a></li>
    </ul>
  </div>
</div>
          <hr />
          <p>注：.....</p>
        </form>
      </div>

    </div>
  </div>
  <!-- content end -->

</div>



<!--[if lt IE 9]>
<script src="assets/js/jquery1.11.1.min.js"></script>
<script src="assets/js/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery-1.8.2.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<!--<![endif]-->
<script src="assets/js/app.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	 $.ajax({
         type: "POST",
         url: "showSectionServlet",
         data:"",                                     
         success: function(data) {
             //将返回字符串转换为json对象
             var json = null;
             try { 
                 json = eval('(' + data + ')');
                 $("#ctable tr:gt(0)").remove();
                 var rows="";
                 for(var i in json){
                	 rows =rows + "<tr>"+
                	 "<td>"+json[i].no+"</td>"+
                	 "<td>"+json[i].cname+"</td>"+
                	 "<td>"+json[i].day+" "+json[i].time+"</td>"+
                	 "<td>"+json[i].room+"</td>"+
                	 "<td>"+json[i].pname+"</td>"+
                	 "<td>"+json[i].seat+"</td>"+
                	 "<td><div class='am-btn-toolbar'><div class='am-btn-group am-btn-group-xs'><button class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span><a href='EditSection.jsp?no="+json[i].no+"\'>编辑</a></button><button class='am-btn am-btn-default am-btn-xs am-text-danger><span class='am-icon-trash-o'></span><a href='deleteSectionServlet?no="+json[i].no+"\'>删除</a></button></div></div></td>"
                	 +"<td><a  class='attend' data-id='"+json[i].no+"\' href='javascript:void(0)' data-am-modal='{target: \"#yixuan\", closeViaDimmer: 0, width: 400, height: 225}'>已选学生</a></td></tr>";
                 }
                 $("#ctable").append(rows);
                 //alert(json);
                 
             } catch (e) {
                 alert("返回字符串不是json格式!");
                 return;
             }     
         }

     });
	 
	 //新增排课
	 $("#addSection").click(function(){
		  $.post("addSectionServlet",{no:$('#no').val(),course:$('#course').val(),room:$('#room').val(),seat:$('#seat').val(),semester:$('#semester').val(),day:$('#day').val(),time:$('#time').val(),p:$('#p').val()},
			  function(data){
			   alert(data)
			   window.location.href="courseManage.jsp";
			  });
	 });
});

//查询排课
$("#search").click(function(){
	  $.post("searchSectionServlet",{sec:$('#sec').val(),c:$('#c').val()},  
		  function(data){
		   var json = null;
            try { 
                json = eval('(' + data + ')');
                $("#ctable tr:gt(0)").remove();
                var rows="";
                for(var i in json){
               	 rows =rows + "<tr>"+
            	 "<td>"+json[i].no+"</td>"+
            	 "<td>"+json[i].cname+"</td>"+
            	 "<td>"+json[i].day+" "+json[i].time+"</td>"+
            	 "<td>"+json[i].room+"</td>"+
            	 "<td>"+json[i].pname+"</td>"+
            	 "<td>"+json[i].seat+"</td>"+
            	 "<td><div class='am-btn-toolbar'><div class='am-btn-group am-btn-group-xs'><button class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span><a href='EditSection.jsp?no="+json[i].no+"\'>编辑</a></button><button class='am-btn am-btn-default am-btn-xs am-text-danger><span class='am-icon-trash-o'></span><a href='deleteSectionServlet?no="+json[i].no+"\'>删除</a></button></div></div></td>"
            	 +"<td><a class='attend' data-id='"+json[i].no+"\' href='javascript:void(0)' data-am-modal='{target: \"#yixuan\", closeViaDimmer: 0, width: 400, height: 225}'>已选学生</a></td></tr>";
                }
                $("#ctable").append(rows);	                 
            } catch (e) {
                alert("返回字符串不是json格式!");
                return;
            }     
		  });
});

//查看已选学生
$(".attend").live("click",function(){
	$("#sno").text("编号为"+$(this).attr('data-id')+"的选课情况：");
	$.post("showAttendServlet",{sno:$(this).attr('data-id')},  
			  function(data){
			   var json = null;
	            try { 
	                json = eval('(' + data + ')');
	                $("#stable tr:gt(0)").remove();
	                var rows="";
	                for(var i in json){
	               	 rows =rows + "<tr>"+
	            	 "<td>"+json[i].ssn+"</td>"+
	            	 "<td>"+json[i].name+"</td>"+
	            	 "<td>"+json[i].major+"</td></tr>";
	             }
	                $("#stable").append(rows);	                 
	            } catch (e) {
	                alert("返回字符串不是json格式!");
	                return;
	            }     
			  });
	
})
//获取参数   
function getUrlParam(name){  
    //构造一个含有目标参数的正则表达式对象  
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");  
    //匹配目标参数  
    var r = window.location.search.substr(1).match(reg);  
    //返回参数值  
    if (r!=null) return unescape(r[2]);  
    return null;  
}
$(document).ready(function(){
	var msg=getUrlParam('msg');
	if(msg==1){
		alert("删除成功");
	}else if(msg==2){
		alert("删除失败");
	}
     else{	}
}); 
</script>
</body>
</html>
