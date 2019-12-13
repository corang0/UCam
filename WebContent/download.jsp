<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Material.MaterialDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<jsp:useBean id="material" class="Material.MaterialDTO" scope="page" />
<jsp:setProperty name="material" property="ptitle" />
<jsp:setProperty name="material" property="pcontent" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
	<%
		String fileName = request.getParameter("file_name");	     
	    String folder = request.getServletContext().getRealPath("/UploadFolder");	    
	    String filePath = folder + "/" + fileName;
	
	    try {
	        File file = new File(filePath);
	        byte b[] = new byte[(int) file.length()];
	             
	        response.reset();
	        response.setContentType("application/octet-stream");
	               
	        String encoding = new String(fileName.getBytes("euc-kr"),"8859_1");
	               
	        response.setHeader("Content-Disposition", "attachment;filename="+ encoding);
	        response.setHeader("Content-Length", String.valueOf(file.length()));
	        
	        if (file.isFile())
	        {
	            FileInputStream fileInputStream = new FileInputStream(file);
	            ServletOutputStream servletOutputStream = response.getOutputStream();            
	        
	            int readNum = 0;
	            while ( (readNum = fileInputStream.read(b)) != -1) {
	                servletOutputStream.write(b, 0, readNum);
	            }
	            
	            servletOutputStream.close();
	            fileInputStream.close();
	        }
	        
	    } catch (Exception e) {
	        System.out.println("Download Exception : " + e.getMessage());
	    }
	%>
</body>
</html>