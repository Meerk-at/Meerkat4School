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
<div class="container-fluid" style="padding-top: 30px;padding-bottom: 30px">
    <div class="page-header">
        <h1 class="text-center">Meerk@ 4 School</h1>
    </div>
    <p class="lead text-center">Calculate the grades you need for its class in order to achieve the desired global grade.</p>
</div>
<g:uploadForm controller="calculate" action="index" role="form" style="padding-top: 20px">
    <div class="container">
        <g:each in="${ (1..<10) }" var="cur_sem">
        <div class = "row">
            <div class = "col-md-12 text-center">
                <h3 style="font-style: italic">${cur_sem}ο Εξάμηνο</h3>
            </div>
        </div>
        <table class="table table-hover table-condensed">
            <thead>
            <tr>
                <th style="width: 13%" class="text-center">Δηλωμένο</th>
                <th style="width: 72%" class="text-center">Μάθημα</th>
                <th style="width: 15%" class="text-center">Βαθμός</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="course" in="${new Course().list()}">
                <g:if test="${course.semester == cur_sem}">
                <tr  >
                    <input type="checkbox" style="display: none;" name="check${course.id}" class="checkbox-inline" id="check${course.id}" onchange="butCheckForm_onclick()">
                    <td class="vert-align" id="row${course.id}">
                        <img style="width: 20px" class="center-block" src="images/delete.png" alt="Όχι" id="img${course.id}" />
                    </td>
                    <td  class="vert-align">${course.name}</td>
                    <td><input type="text" name="grade${course.id}" id='grade${course.id}' class="form-control" disabled placeholder="Βαθμός"/></td>
                </tr>
                </g:if>
            </g:each>
            </tbody>
        </table>
    </g:each>

        <div class="form-horizontal">
            <div class="form-group">
                <label for="diplomatiki_grade" class="col-md-2 col-md-offset-4 control-label" style="vertical-align: middle">Διπλωματική</label>

                <div class="col-md-2">
                    <input type="text" class="form-control" name="diplwmatiki_grade" onchange="butCheckForm_onclick()" style="text-align: right" id="diplomatiki_grade"
                           placeholder="Βαθμός">
                </div>
            </div>

            <div class="form-group">
                <label for="overal_grade" class="col-md-2 col-md-offset-4 control-label" style="vertical-align: middle">Συνολικός Βαθμός</label>

                <div class="col-md-2">
                    <input type="text" class="form-control" name="overall_grade" style="text-align: right" onkeyup="butCheckForm_onclick()" id="overal_grade"
                           placeholder="Βαθμός">
                </div>
            </div>
        </div>
        <div id="error_div" class="container">
            <div style="color: #FF0000; font-style: italic" class="row">
                <div class="col-md-8 col-md-offset-2">
                    <h4 id="error_title">Για να υπολογίσετε τους βαθμούς πρέπει να ισχύουν τα παρακάτω:</h4>
                    <ul>
                        <li id="error_1">61 μαθήματα δηλωμένα</li>
                        <li id="error_2">Επιθυμητός συνολικός βαθμός συμπληρωμένος</li>
                    </ul>
                </div>
            </div>
        </div>
        <img src="${createLink(controller: 'simpleCaptcha', action: 'captcha')}"/>
        <label for="captcha">Type the letters above in the box below:</label>
        <g:textField name="captcha"/>
        <button type="submit" disabled id="my-submit-button" class="btn btn-primary btn-lg btn-block">
            Calculate grades for remaining courses
        </button>
    </div>
</g:uploadForm>
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
<script>

    function tableRowClick(){

        <g:each var="course" in="${new Course().list()}">
        var checkbox = document.getElementById('check${course.id}');
        var image = document.getElementById('img${course.id}');
        console.log(checkbox.checked);
        if (checkbox.checked) {
            image.src="http://localhost:8080/Meerkat4School/images/tick.png";
        }
        else {
            image.src="http://localhost:8080/Meerkat4School/images/delete.png";
        }
            document.getElementById('row'+${course.id}).onclick = function () {
                var checkbox = document.getElementById('check${course.id}');
                var input = document.getElementById('grade${course.id}');
                var image = document.getElementById('img${course.id}');
                checkbox.checked = !checkbox.checked;
                input.disabled = !input.disabled;
                console.log(checkbox.checked);
                if (checkbox.checked) {
                    image.src="http://localhost:8080/Meerkat4School/images/tick.png";
                }
                else {
                    image.src="http://localhost:8080/Meerkat4School/images/delete.png";
                }
                butCheckForm_onclick();
            };
        </g:each>
    }

    function butCheckForm_onclick(){
        var overGrade = document.getElementById('overal_grade');
        var error_list2 = document.getElementById('error_2');
        var counter = 0;
        console.log("mpika");
        <g:each var="course" in="${new Course().list()}">
        if (document.getElementById('check${course.id}').checked){
            counter = counter + 1;
        }
        </g:each>
        if (overGrade==null){
            error_list2.style.display='list-item';
            var submit = document.getElementById("my-submit-button");
            var error = document.getElementById('error_div');
            var error_list1 = document.getElementById('error_1');
            if (counter == 5) {
                error_list1.style.display='none';
            } else{
                error_list1.innerHTML="61 μαθήματα δηλωμένα. Έχετε επιλέξει ".concat(counter);
                error_list1.style.display='list-item';
            }
            submit.disabled = true;
        }else if (overGrade.value==""){
            error_list2.style.display='list-item';
            var submit = document.getElementById("my-submit-button");
            var error = document.getElementById('error_div');
            var error_list1 = document.getElementById('error_1');
            if (counter == 5) {
                error_list1.style.display='none';
            } else{
                error_list1.innerHTML="61 μαθήματα δηλωμένα. Έχετε επιλέξει ".concat(counter);
                error_list1.style.display='list-item';
            }
            error.style.display='block';
            submit.disabled = true;
        } else{
            error_list2.style.display='none';
            if (counter == 5){
                var submit = document.getElementById("my-submit-button");
                var error = document.getElementById('error_div');
                var error_list1 = document.getElementById('error_1');
                error_list1.style.display='none';
                submit.disabled = false;
                error.style.display='none';
            } else{
                var submit = document.getElementById("my-submit-button");
                var error = document.getElementById('error_div');
                var error_list1 = document.getElementById('error_1');
                error_list1.innerHTML="61 μαθήματα δηλωμένα. Έχετε επιλέξει ".concat(counter);
                error_list1.style.display='list-item';
                submit.disabled = true;
                error.style.display='block';
            }
        }
    }
    window.onload = butCheckForm_onclick();
    window.onload = tableRowClick();
</script>
</html>
