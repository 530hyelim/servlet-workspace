package com.kh.basicServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestPersonServlet1
 */
@WebServlet("/testPerson1.do") // 정적/동적을 구분하기 위함
public class TestPersonServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestPersonServlet1() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자의 요청방식이 Get 방식인 경우 실행되는 메서드
		/*
		 * 1. HttpServletRequest
		 * 	- 클라이언트가 요청 시 전달한 데이터가 담겨있는 객체
		 * 	- 사용자가 입력한 값, 요청 시 전송 방식, ip 주소, url 정보, 기타 ...
		 * 
		 * 2. HttpServletResponse
		 * 	- 응답 정보를 담아줄 객체
		 *  - 응답 정보로 동적 html 페이지를 생성하여 반환
		 */
		// 1. 사용자가 입력한 값 가져오기
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		String animal = request.getParameter("animal");
		//String food = request.getParameter("food"); // 한 개의 데이터만 가져올 수 있음
		String foods[] = request.getParameterValues("food");
		
		System.out.println("name = " + name);
		System.out.println("color = " + color);
		System.out.println("animal = " + animal);
		System.out.println("foods = " + Arrays.toString(foods));
		
		// 2. 응답 메세지 작성하기 (html/xml/json/txt)
		response.setContentType("text/html; charset=utf-8"); // 응답 데이터의 형식, 인코딩 타입 (필수!!)
		PrintWriter out = response.getWriter(); // outputStream 출력스트림
		out.println("<!DOCTYPE html>");
		out.println("<html>");
			out.println("<head>");
				out.println("<title>개취 검사 결과</title>");
			out.println("</head>");
			out.println("<body>");
				out.println("<h1>개인 취향조사 결과</h1>");
				out.println("<p>" + name + "님의 개인 취향 검사 결과는</p>");
				out.println("<p>" + color + "색을 좋아합니다.</p>");
				out.println("<p>좋아하는 동물은 " + animal + "입니다.</p>");
				out.println("<p>좋아하는 음식은 " + Arrays.toString(foods) + "입니다.</p>");
			out.println("</body>");
		out.println("</html>");
		// 순수 서블릿으로 데이터 바인딩을 하는 것은 불편하다. 가독성, 유지보수 좋지 않음.
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * POST 방식의 요청 시 데이터는 HTTP BODY 영역에 "인코딩"되어 넘어온다.
		 * POST 방식의 기본 인코딩 설정은 ISO-8859-1로, utf-8이 아님.
		 * 따라서 Request의 인코딩 타입을 utf-8로 변경해줘야 한다.
		 */
		request.setCharacterEncoding("UTF-8");
		
		// 1. 사용자가 입력한 값 가져오기
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		String animal = request.getParameter("animal");
		String foods[] = request.getParameterValues("food");
		
		System.out.println("name = " + name);
		System.out.println("color = " + color);
		System.out.println("animal = " + animal);
		System.out.println("foods = " + Arrays.toString(foods));
		
		// 2. 응답 메세지 작성하기
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
			out.println("<head>");
				out.println("<title>개취 검사 결과</title>");
			out.println("</head>");
			out.println("<body>");
				out.println("<h1>개인 취향조사 결과</h1>");
				out.println("<p>" + name + "님의 개인 취향 검사 결과는</p>");
				out.println("<p>" + color + "색을 좋아합니다.</p>");
				out.println("<p>좋아하는 동물은 " + animal + "입니다.</p>");
				out.println("<p>좋아하는 음식은 " + Arrays.toString(foods) + "입니다.</p>");
			out.println("</body>");
		out.println("</html>");
	}

}
