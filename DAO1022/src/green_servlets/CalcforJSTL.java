package green_servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/CalcforJSTL")
public class CalcforJSTL extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("v1"));
		System.out.println(request.getParameter("op"));
		System.out.println(request.getParameter("v2"));
		
		int result;
		int a = Integer.parseInt(request.getParameter("v1"));
		int b = Integer.parseInt(request.getParameter("v2"));
		
		if(request.getParameter("op").equals("+")) {
			RequestDispatcher rd = request.getRequestDispatcher("jstl/1.jsp");
			request.setAttribute("result1", a+b);
			rd.forward(request, response);
			result = a+b;
			System.out.println(result);
		}
		if(request.getParameter("op").equals("-")) {
			RequestDispatcher rd = request.getRequestDispatcher("jstl/2.jsp");
			request.setAttribute("result2", a-b);
			rd.forward(request, response);
			result = a-b;
			System.out.println(result);
		}
		if(request.getParameter("op").equals("*")) {
			RequestDispatcher rd = request.getRequestDispatcher("jstl/3.jsp");
			request.setAttribute("result3", a*b);
			rd.forward(request, response);
			
			result = a*b;
			System.out.println(result);
		}
		if(request.getParameter("op").equals("/")) {
			RequestDispatcher rd = request.getRequestDispatcher("jstl/4.jsp");
			request.setAttribute("result4", a/b);
			rd.forward(request, response);
			
			result = a/b;
			System.out.println(result);
		}
	}

}
