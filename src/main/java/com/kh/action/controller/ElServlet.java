package com.kh.action.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.model.vo.Person;

@WebServlet("/action/el.do")
public class ElServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ElServlet() {
        super();
    }
    
    // anchor, dispatcher, redirector 는 모두 doGet 메서드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 데이터를 저장할 수 있는 Servlet의 영역(scope)들
		 *  1. ServletContext (application scope)
		 *    - 어플리케이션 당 1개만 존재하는 객체
		 *    - 이 영역에 데이터를 추가하면 어플리케이션 전역에서 공유하면서 사용 가능
		 *    - ServletContext는 (직접 데이터를 지우거나) 서버가 멈추기 전까지 유지된다.
		 *    
		 *  2. HttpSession (session scope)
		 *    - DB 세션 : 접속한 계정 단위로 고유한 세션이 할당된다.
		 *    - Http 세션 : 접속한 사용자 별로 데이터를 저장할 수 있는 객체
		 *    - 개발자가 HttpSession 지속시간을 설정할 수 있다. (로그인->자동로그아웃)
		 *    - 이 영역에 데이터를 추가하면 모든 servlet에서 사용이 가능
		 *    - 값을 한 번 담으면 session의 지속시간이 끝나거나, 브라우저가 닫히거나, 서버가 종료될 때까지 데이터가 유지된다.
		 *    - 접속한 사용자 별로 아파치 톰캣이 만들어짐
		 *    - request 내부에 숨어있음
		 *    (쓰레드 상에서 세션이 생성되기 때문에 redirect 할 때 request가 소멸되더라도 자동으로 넘겨줌)
		 *    
		 *  3. HttpServletRequest (request scope)
		 *    - 클라이언트가 요청을 보낼 때 마다 새롭게 생성되는 객체
		 *    - 이 영역에 데이터를 담으면 현재 요청을 받은 서블릿과 포워딩 받는 서블릿/jsp에서 request에 담긴 데이터를
		 *      사용할 수 있다.
		 *    - 값이 한 번 담기면, 재 요청이 이루어지는 순간 이전 request가 소멸된다.
		 *  
		 *  4. PageContext (page scope)
		 *    - JSP 페이지에서만 사용 가능한 영역으로, 하나의 JSP 페이지에서만 공유할 데이터를 선언하는 영역
		 */
		// request scope에 데이터 담기
		request.setAttribute("classRoom", "G강의장");
		request.setAttribute("student", new Person("서혜림", 27, "여자"));
		
		// session scope에 데이터 담기
		HttpSession session = request.getSession();
		session.setAttribute("academy", "KH정보교육원");
		session.setAttribute("teacher", new Person("민경민", 20, "남자"));
		
		// application scope에 데이터 담기
		ServletContext application = request.getServletContext();
		application.setAttribute("scope", "application");
		
		request.getRequestDispatcher("/action/1_EL/01_el.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
