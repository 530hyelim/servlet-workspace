package com.kh.basicServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sendRedirect.do")
public class SendRedirectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendRedirectServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("sendRedirect 요청 들어옴");
		// servlet이 요청내용을 위임하는 두 번째 방법
		// sendRedirect (재연결)
		response.sendRedirect("testPerson1.do"); 
		// 이동시킬 url 주소를 작성 => url 주소창이 매개변수에 입력한 값으로 바뀜
		// request에 담겨있던 값들이 "소멸" (요청을 새로 보내는 개념) => 직접 쿼리스트링 작성해야함 getParameter로
		// testPerson1 서블릿에 대한 request 객체가 새롭게 생성됨 (안에 담겨있는 값은 null로 초기화됨)
		// 만약에 테이블 등록기능이 있으면 페이지 새로고침 할때마다 계속 테이블에 중복돼서 들어가기 때문에 CRUD의 CUD시 주로 사용
		// 게시판 등록과 관련된 로직은 여기서 수행하고 게시글 목록페이지로 리다이렉트 하는거임
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
