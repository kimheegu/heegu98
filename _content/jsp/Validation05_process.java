package test1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Validation05_process
 */
@WebServlet("/validation05_process.do")
public class Validation05_process extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.println("<!DOCTYPE html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>Validation</title>");
		pw.println("</head>");
		pw.println("<body>");
		String id=request.getParameter("id");
		String name = request.getParameter("name");
		String passwd = request.getParameter("passwd");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String email = request.getParameter("email");
		System.out.println(id);
		pw.println("<p> 아이디 : "+id+"</p>");
		pw.println("<p> 비밀번호 : "+passwd+"</p>");
		pw.println("<p> 이름 : "+name+"</p>");
		pw.println("<p> 전화번호 : "+phone1+" - "+phone2
		+" - "+phone3+"</p>");
		pw.println("<p> 이메일 : "+email+"</p>");
		pw.println("</body>");
		pw.println("</html>");
	}

}
