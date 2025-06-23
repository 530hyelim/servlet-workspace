package com.kh.basicServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LifeCycle
 */
@WebServlet("/life")
public class LifeCycle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /*
     * Servlet의 생명주기
     *  - was 구동 내내 딱 하나의 객체만 생성된다
     *  - 최초 client 호출 시 객체가 생성된다
     */
    public LifeCycle() {
        super();
        System.out.println("서블릿 객체 생성");
    }
    
    @Override
    public void init() throws ServletException {
    	System.out.println("init 메서드 호출");
    }
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// 사용자의 요청 처리방식 가져오기
    	String method = req.getMethod(); // "GET" / "POST"
    	System.out.println("service() : " + method);
    	if (method.equals("GET")) doGet(req, resp);
    	else doPost(req, resp); // valve를 통해 받아오는 데이터
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
