package com.kh.ajax.text;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax/text")
public class AjaxTextServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxTextServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		int num = Integer.parseInt(request.getParameter("num"));
		// getParameter로 뽑아오는 값은 무조건 String임
		String flag = request.getParameter("flag");
		response.setContentType("text/plain; charset=utf-8"); // 디폴트라서 특별히 설정할 필요는 없음
		PrintWriter out = response.getWriter();
		out.println("<h1>"+name+"</h1>");
		out.println(num);
		out.println(flag);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
