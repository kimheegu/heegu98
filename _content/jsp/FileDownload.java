package test1;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownload
 */
@WebServlet("/download.do")
public class FileDownload extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
		//매개변수 request와 response를 넣은 doHandle 메서드 실행
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//한글 작업 필요하므로 utf-8
		response.setContentType("text/html; charset=utf-8");
		//파일 유형 설정
		String file_repo = "C:\\file_repo";
		//C:file_repo 경로를 file_repo에 넣음
		String fileName=(String) request.getParameter("fileName");
		//서블릿 호출할 때 보낸 fileName의 값을 String으로 형변환후 fileName에 넣음
		System.out.println("fileName="+fileName);
		//fileName 출력
		OutputStream out = response.getOutputStream();
		//출력을 위해 OutputStream형의 out 생성
		String downFile = file_repo+"\\"+fileName;
		//downFile에 file_repo\\fileName 값 넣음
		File f = new File(downFile);
		//downFile을 받아 파일형 f를 만듬
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition","attachment; fileName="+fileName);
		FileInputStream in = new FileInputStream(f);
		//f를 받아 FileInputStream형 in에 값을 넣음
		byte[] buffer = new byte[1024 * 8];
		//바이트형의 배열 buffer를 1024*8바이트씩 받아 만듬
		while(true) {
			int count = in.read(buffer);
			//in 값을 1024*8바이트 씩 읽은 값을 count에 대입
			if(count == -1)
				break;
			//만약 count값이 -1일때 while문 탈출
			out.write(buffer,0,count);
			//읽은 값 저장
		}
		in.close();
		out.close();
		
	}

}
