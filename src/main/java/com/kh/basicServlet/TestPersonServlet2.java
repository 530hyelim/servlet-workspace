package com.kh.basicServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestPersonServlet2
 */
@WebServlet("/testPerson2.do")
public class TestPersonServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestPersonServlet2() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자가 입력한 값 가져오기
		//String name = request.getParameter("name");
		String color = request.getParameter("color");
		//String animal = request.getParameter("animal");
		//String foods[] = request.getParameterValues("food");
		
		// 2. 업무 로직
		// 사용자가 입력한 color를 바탕으로 DB 서버와 연동하여, 추천음식을 조회
		String recommend = "";
		switch(color) {
		case "빨강" : recommend = "짬뽕"; break;
		case "노랑" : recommend = "참외"; break;
		case "초록" : recommend = "시금치"; break;
		case "파랑" : recommend = "파워에이드"; break;
		}
		// JSP가 화면을 생성할 때 필요한 데이터들을 전달하기 위해 필요한 key+value 형태의 객체 데이터(attribute)
		request.setAttribute("recommend", recommend); // 저장하는 value는 Object 자료형
		
		// 3. html 작성을 jsp에게 위임하기
		/*
		 * 매개변수로 요청을 위임할 jsp의 경로를 추가
		 * request 내부에 context path가 있기 때문에 최상위 webapp 기준 절대경로 작성
		 * getRequestDispatcher("jsp의 주소 || 서블릿의 url패턴(/first, /second, /life)")
		 * 지정된 서블릿을 호출하여 요청처리를 위임하고, 최초 client가 요청했던 url에는 변화가 없다.
		 */
		RequestDispatcher dispatcher = request.getRequestDispatcher("/person/testPerson.jsp");
		dispatcher.forward(request, response); // 데이터 그대로 담아서 전송
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
