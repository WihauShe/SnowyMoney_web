<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="entity.Job,javax.servlet.*" %>
    
<!DOCTYPE html>
<html>
	<head>
    	<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title>SnowyMoney</title>
		<link rel="icon"type="image/x-icon" href="img/snowymoney.ico" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/job_results.css"/>
	</head>
	<body>
		<div class="logo_module">
			<img src="img/whitesnowy.png" /><span>SnowyMoney</span>
		</div>
		<div class="border">
				<table borde="2" cellspacing="10">
					<tr>
						<th></th>
						<th></th>
						<th style="padding-left:20px;">兼职列表</th>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<th>种类</th>
						<th></th>
						<th>要求</th>
						<th></th>
						<th>薪资</th>
						<th>联系方式</th>
					</tr>
					<%
						List<Job> jobList = new ArrayList();
						jobList = (List)request.getAttribute("jobs");
						String[] category= new String[]{"temporary","educator","salesman","poster"};
						for(int i=0;i<jobList.size();i++){
					 %>
					<tr>
						<td><%if(jobList.get(i).getJobCategory().equals(category[0])){ %><%="临时工"%>
						<%}else if(jobList.get(i).getJobCategory().equals(category[1])){ %><%="家教" %>
						<%}else if(jobList.get(i).getJobCategory().equals(category[2])){ %><%="促销" %>
						<%}else if(jobList.get(i).getJobCategory().equals(category[3])){ %><%="传单" %>
						<%}else{ %><%="其他" %><%} %>
						</td>
						<td></td>
						<td><%=jobList.get(i).getJobDemand() %></td>
						<td></td>
						<td><%=jobList.get(i).getJobSalary() %></td>
						<td><%=jobList.get(i).getJobContact() %></td>
					</tr>
					<%} %>
				</table>
		</div>
	</body>
</html>
