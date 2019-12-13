<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Material.MaterialDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.io.File"%>

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
		String userID = null;
		String cid = request.getParameter("cid");
		int fileSize= 5*1024*1024;
        String uploadPath = request.getServletContext().getRealPath("/UploadFolder");
        
		File destdir = new File(uploadPath);
        
        if(!destdir.exists()){
            destdir.mkdirs();
        }
        
        MultipartRequest multi = new MultipartRequest
                (request, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
            
		String file1 = multi.getFilesystemName("file1");
		String file2 = multi.getFilesystemName("file2");
		System.out.println(uploadPath);	
        
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		else {
			if (multi.getParameter("ptitle") == null || multi.getParameter("pcontent") == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");

			} 
			else {								
				MaterialDAO materialDAO = new MaterialDAO();			
				int result = materialDAO.write(multi.getParameter("ptitle"), multi.getParameter("pcontent"), cid, file1, file2);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				} 
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='lectureArchives.jsp'");	
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>