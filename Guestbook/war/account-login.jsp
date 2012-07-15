<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="guestbook.UserServlet" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<html>
<head>

<!-- Begin AC integration -->
<script type="text/javascript" src="https://www.accountchooser.com/ac.js">
loginUrl: 'account-login.jsp',
signupUrl: 'account-create.jsp',
homeUrl: 'guestbook.jsp',
userStatusUrl: 'userstatus'
</script>
<!-- End AC integration -->

<link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
</head>

<body>
	<%
	if (session.getAttribute("email") != null) {
	// The user is already signed in. let them sign out.
    %>
	<p>
		Hello,
		<%= UserServlet.getUserIdentifier(session) %>! (You can <a
			href="/signout">sign out</a>.)
	</p>
	<%
		} else {
	    // we didn't come here from a sign-in formpost, display the form
	%>
	<p>
		Hello! Sign in to include your name with greetings you post.
	</p>
	<p>
	   Or, <a href="/account-create.jsp">Sign Up</a> if you don't have a username.
	</p>
	<form name="login" action="/user" method="post">
	    <input type="hidden" name="form" value="login">
		<table>
			<tr>
				<td>username:</td>
				<td><input type="text" id="email" name="email"></td>
			</tr>
			<tr>
				<td>password:</td>
				<td><input type="password" id="password"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="login"></td>
			</tr>
		</table>
	</form>
	<%
    }
%>
	
</body>
</html>