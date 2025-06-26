package com.kh.ajax.json;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.model.vo.Person;

@WebServlet("/ajax/json")
public class AjaxJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxJsonServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JSONArray arr = new JSONArray();
		JSONObject jobj = new JSONObject();
		arr.add("혜림");
		arr.add("경민");
		jobj.put("name", "서혜림"); // {name:"서혜림"}
		jobj.put("age", 27); // {name:"서혜림",age:27}
		response.setContentType("application/json; charset=UTF-8");
		//response.getWriter().print(arr);
		//response.getWriter().print(jobj); // 요기서는 아직까지 문자열 형태로 데이터 넘어감
		
		// 자바의 객체를 JSON 객체로 변환 (gson 라이브러리)
		List<Person> list = new ArrayList<>();
		list.add(new Person("황제성", 5, "남자"));
		list.add(new Person("쥴리아 로버츠", 15, "여자"));
		list.add(new Person("김고은", 25, "여자"));
		list.add(new Person("다프트펑크", 33, "남자"));
		
		String name = request.getParameter("searchId");
		Person p = null; // p는 자바의 객체
		for (Person person : list) {
			if (person.getName().equals(name)) {
				p = person;
				break;
			}
		}
//		Gson gson = new Gson();
//		String jsonStr = gson.toJson(p);
//		System.out.println(jsonStr);
		new Gson().toJson(p, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
