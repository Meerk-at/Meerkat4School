<%@ page import="com.meerkat.school.Course" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="images/favicon.ico">

    <title>Sticky Footer Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/mycss.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<!-- Begin page content -->
<div class="container-fluid">
    <div class="page-header">
        <h1 class="text-center">Meerk@ 4 School</h1>
    </div>
    <p class="lead text-center">Calculate the grades you need for its class in order to achieve the desired global grade.</p>
</div>
<g:form controller="calculate" action="index" role="form">
    <div class="container">
        <table class="table table-hover table-condensed">
            <thead>
            <tr>
                <th style="width: 15%">Δηλωμένο</th>
                <th style="width: 60%">Μάθημα</th>
                <th style="width: 25%">Βαθμός</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="course" in="${new Course().list()}">
                <tr>
                    <td class="vert-align">
                        <input type="checkbox" id="check${course.id}" onclick="var input = document.getElementById('grade${course.id}');
                        if (this.checked) {
                            input.disabled = false;
                            input.focus();
                        } else {
                            input.disabled = true;
                        }">
                    </td>
                    <td class="vert-align">${course.name}</td>
                    <td><input type="text" id='grade${course.id}' class="form-control" disabled placeholder="Βαθμός"></td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="form-horizontal">
            <div class="form-group">
                <label for="diplomatiki_grade" class="col-md-2 col-md-offset-4 control-label" style="vertical-align: middle">Διπλωματική</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" style="text-align: right" id="diplomatiki_grade"
                           placeholder="Βαθμός">
                </div>
            </div>
            <div class="form-group">
                <label for="overal_grade" class="col-md-2 col-md-offset-4 control-label" style="vertical-align: middle">Συνολικός Βαθμός</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" style="text-align: right" id="overal_grade"
                           placeholder="Βαθμός">
                </div>
            </div>
        </div>
        <button type="submit"  class="btn btn-primary btn-lg btn-block">
            Calculate grades for remaining courses
        </button>

    </div>
</g:form>
</body>
<div id="footer">
    <div class="container">
        <p class="text-muted">Meerk@ - Meerk@4School, a project for Electrical Engineers of AUTH.</p>
    </div>
</div>


<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>
</html>
