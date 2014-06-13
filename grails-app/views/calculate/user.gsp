<%--
  Created by IntelliJ IDEA.
  User: jim
  Date: 6/13/14
  Time: 3:43 PM
--%>

<%@ page import="com.meerkat.school.Course" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../images/favicon.ico">

    <title>Sticky Footer Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../css/mycss.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div class="container-fluid" style="padding-top: 30px;padding-bottom: 30px">
    <div class="page-header">
        <h1 class="text-center">Results</h1>
    </div>
    <h2 class="lead text-center">User: Overall Grade: ${user.overall}</h2>
    <g:each in="${user.grades}" var="grade">
        <p>Grade: ${grade.course} + ${grade.final_grade}</p>
    </g:each>
    <p>Thesis: ${user.diplwmatiki}</p>
</div>

<div id="footer">
    <div class="container">
        <p class="text-muted">Meerk@ - Meerk@4School, a project for Electrical Engineers of AUTH.</p>
    </div>
</div>


</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="../../js/bootstrap.min.js"></script>

</html>