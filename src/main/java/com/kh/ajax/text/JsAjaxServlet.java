package com.kh.ajax.text;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax/ajaxTest.do")
public class JsAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JsAjaxServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("id");
		// setContentType 같은거 지정 안하면 text 형태로 메시지 전송됨
		response.getWriter().print("ajax response ㅎㅎ : " + userId);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// content type을 지정안해주면 ??로 출력됨. 한글 한자같은 유니코드 기반의 문자는 다 깨짐
		String userId = request.getParameter("id");
		String name = request.getParameter("name");
		PrintWriter out = response.getWriter();
		out.println("ajax post 요청 결과 : " + userId + ", " + name);
	}

}
