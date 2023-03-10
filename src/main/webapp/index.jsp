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
        let searchrequest=new XMLHttpRequest();
        let registerrequest=new XMLHttpRequest();
        function searchFunction(){
            searchrequest.open("Post","./UserSearchServlet?userName="+encodeURIComponent(document.getElementById("userName").value),true);
            searchrequest.onreadystatechange=searchProcess;
            searchrequest.send(null);
        }
        function searchProcess(){
            let table=document.getElementById("ajaxTable");
            table.innerHTML="";
            if (searchrequest.readyState == 4 && searchrequest.status==200){
                let object = eval('(' + searchrequest.responseText + ')');
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
        function registerFunction(){
            registerrequest.open("Post","./UserRegisterServlet?userName="+encodeURIComponent(document.getElementById("registerName").value)
                +"&userAge="+encodeURIComponent(document.getElementById("registerAge").value)
                +"&userGender="+encodeURIComponent($('input[name=registerGender]:checked').val())
                +"&userEmail="+encodeURIComponent(document.getElementById("registerEmail").value),true);
            registerrequest.onreadystatechange=registerProcess;
            registerrequest.send(null);
        }
        function registerProcess(){
            if (registerrequest.readyState == 4 && registerrequest.status==200){
                let result=registerrequest.responseText;
                if (result !=1){
                    alert("????????? ?????? ???????????????");
                }
                else {
                    let userName=document.getElementById("userName");
                    let registerUserName=document.getElementById("registerName");
                    let registerUserAge=document.getElementById("registerAge");
                    let registerUserEmail=document.getElementById("registerEmail");
                    userName.value="";
                    registerUserName.value="";
                    registerUserAge.value="";
                    registerUserEmail.value="";
                    searchFunction();
                }
            }
        }
        window.onload=function (){
            searchFunction();
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
                <button class="btn btn-primary" type="button" onclick="searchFunction();">??????</button>
            </div>
        </div>
        <table class="table" style="text-align: center; border: 1px solid #dddddd">
            <thead>
                <tr>
                    <th style="background-color: #fafafa; text-align: center">??????</th>
                    <th style="background-color: #fafafa; text-align: center">??????</th>
                    <th style="background-color: #fafafa; text-align: center">??????</th>
                    <th style="background-color: #fafafa; text-align: center">?????????</th>
                </tr>
            </thead>
            <tbody id="ajaxTable">
                <tr>
                    <td>?????????</td>
                    <td>23</td>
                    <td>??????</td>
                    <td>launcher37@naver.com</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="container">
        <table class="table" style="text-align: center ; border: 1px solid #dddddd">
            <thead>
                <tr>
                    <th colspan="2" style="background-color: #fafafa; text-align: center">?????? ?????? ??????</th>
                </tr>
            </thead>
            <tbody>
            <tr>
                <td style="background-color: #fafafa; text-align: center"><h5>??????</h5></td>
                <td><input class="form-control" type="text" id="registerName" size="20"></td>
            </tr>
            <tr>
                <td style="background-color: #fafafa; text-align: center"><h5>??????</h5></td>
                <td><input class="form-control" type="text" id="registerAge" size="20"></td>
            </tr>
            <tr>
                <td style="background-color: #fafafa; text-align: center"><h5>??????</h5></td>
                <td>
                    <div class="form-group" style="text-align: center; margin: 0 auto;">
                        <div class="btn-group" data-toggle="buttons">
                            <label class="btn btn-primary active">
                                <input type="radio" name="registerGender" autocomplete="off" value="??????" checked>??????
                            </label>
                            <label class="btn btn-primary ">
                                <input type="radio" name="registerGender" autocomplete="off" value="??????" >??????
                            </label>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="background-color: #fafafa; text-align: center"><h5>?????????</h5></td>
                <td><input class="form-control" type="text" id="registerEmail" name="userEmail" size="200"></td>
            </tr>
            <tr>
                <td colspan="2"><button class="btn btn-primary pull-right" onclick="registerFunction()" type="button">??????</button></td>
            </tr>
            </tbody>

        </table>
    </div>
</body>
</html>