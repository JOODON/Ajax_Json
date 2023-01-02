<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <title>JSP AJAX</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"> </script>
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript">
        let request=new XMLHttpRequest();
        function searchFunction(){
            request.open("Post","./UserSearchServlet?userName="+encodeURIComponent(document.getElementById("userName").value),true);
            request.onreadystatechange=searchProcess;
            request.send(null);
        }
        function searchProcess(){
            let table=document.getElementById("ajaxTable");
            table.innerHTML="";
            if (request.readyState == 4 /*request.readyState == 200*/){
                let object = eval('(' + request.responseText + ')');
                let result=object.result;
                for (let i=0; i<result.length; i++){
                    let row=table.insertRow(0);
                    for (let j=0; j<result[i].length; j++){
                        let cell=row.insertCell(j);
                        cell.innerHTML=result[i][j].value;
                    }
                }
            }
        }
    </script>
</head>
<body>
    <br>
    <div class="container">
        <div class="form-group row pull-right">
            <div class="col-xs-8">
                <input class="form-control" type="text" size="20" id="userName" name="userName" onkeyup="searchFunction();">
            </div>
            <div class="col-xs-2">
                <button class="btn btn-primary" type="button" onclick="searchFunction();">검색</button>
            </div>
        </div>
        <table class="table" style="text-align: center; border: 1px solid #dddddd">
            <thead>
                <tr>
                    <th style="background-color: #fafafa; text-align: center">이름</th>
                    <th style="background-color: #fafafa; text-align: center">나이</th>
                    <th style="background-color: #fafafa; text-align: center">성별</th>
                    <th style="background-color: #fafafa; text-align: center">이메일</th>
                </tr>
            </thead>
            <tbody id="ajaxTable">
                <tr>
                    <td>주동호</td>
                    <td>23</td>
                    <td>남자</td>
                    <td>launcher37@naver.com</td>
                </tr>
            </tbody>
        </table>
    </div>

</body>
</html>