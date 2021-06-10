package hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//http://localhost:8080/hello
@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		

		PrintWriter out = response.getWriter();
		out.println("<html>						");
		out.println("	<head>					");
		out.println("		<title>hi</title>	");
		out.println("	</head>					");
		out.println("	<body>					");
		out.println("		<h1>Hi!!</h1>		");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");

		out.println("		<ul>				");
		out.println("		<li> ���̵�: " + id	);
		out.println("		<li> �̸���: " + email);
		out.println("		<li> ��й�ȣ: " + pwd	);
		out.println("		</ul>				");		
		out.println("	</body>					");
		out.println("</html>					");
		
	}
}
