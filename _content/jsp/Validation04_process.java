package test1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Validation04_process
 */
@WebServlet("/validation04_process.do")
public class Validation04_process extends HttpServlet {

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.println("<DOCTYPE html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>현재 시간 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h3>입력에 성공했습니다</h3>");
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pw");
		pw.println("아이디 : "+id);
		pw.println("비밀번호 : "+pwd);
		pw.println("</body>");
		pw.println("</html>");
	}

}
