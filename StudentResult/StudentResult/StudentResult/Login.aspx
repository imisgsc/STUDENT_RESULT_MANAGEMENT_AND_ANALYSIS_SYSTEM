<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudentResult.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title></title>
    <!-- plugins:css -->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <style type="text/css">
        img{
	width: 100%;
}
.login {
    height: 900px;
    width: 100%;
    background: #f2eee3;
    position: relative;
     overflow: hidden;
}
.login_box {
    width: 1050px;
    height: 530px;
    position: absolute;
    top: 35%;
    left: 50%;
    transform: translate(-50%,-50%);
    background: #fff;
    border-radius: 10px;
    box-shadow: 1px 4px 22px -8px #0004;
    display: flex;
    overflow: hidden;
}
.login_box .left{
  width: 41%;
  height: 100%;
  padding: 25px 25px;

}
.login_box .right{
  width: 59%;
  height: 100%
}
.left .top_link a {
    color: #452A5A;
    font-weight: 400;
}
.left .top_link{
  height: 20px
}
.left .contact{
	display: flex;
    align-items: center;
    justify-content: center;
    align-self: center;
    height: 100%;
    width: 73%;
    margin: auto;
}
.left h3{
  text-align: center;
  margin-bottom: 40px;
}
.left input {
    border: none;
    width: 80%;
    margin: 15px 0px;
    border-bottom: 1px solid #4f30677d;
    padding: 7px 9px;
    width: 100%;
    overflow: hidden;
    background: transparent;
    font-weight: 600;
    font-size: 14px;
}
.left{
	/*background: linear-gradient(-45deg, #dcd7e0, #fff);*/
	background: linear-gradient(-45deg, #fff, #fff);
}
.submit {
    border: none;
    padding: 15px 70px;
    border-radius: 8px;
    display: block;
    margin: auto;
    margin-top: 120px;
    background: #583672;
    color: #fff;
    font-weight: bold;
    -webkit-box-shadow: 0px 9px 15px -11px rgba(88,54,114,1);
    -moz-box-shadow: 0px 9px 15px -11px rgba(88,54,114,1);
    box-shadow: 0px 9px 15px -11px rgba(88,54,114,1);
}
.right {
    background:url('Image/1.jpg');
	color: #fff;
	position: relative;
    background-repeat:no-repeat;
    background-size:cover;
}

.right .right-text{
  height: 100%;
  position: relative;
  transform: translate(0%, 45%);
}
.right-text h2{
  display: block;
  width: 100%;
  text-align: center;
  font-size: 50px;
  font-weight: 500;
}
.right-text h5{
  display: block;
  width: 100%;
  text-align: center;
  font-size: 19px;
  font-weight: 400;
}

.right .right-inductor{
  position: absolute;
  width: 70px;
  height: 7px;
  background: #fff0;
  left: 50%;
  bottom: 70px;
  transform: translate(-50%, 0%);
}
.top_link img {
    width: 28px;
    padding-right: 7px;
    margin-top: -3px;
}


@media only screen and (max-width: 600px) {
   img{
	width: 50%;
}
.login {
    height: 700px;
    width: 100%;
    background: #f2eee3;
    position: relative;
     overflow: hidden;
}
.login_box {
    width: 320px;
    height: 600px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    background: #fff;
    border-radius: 10px;
    box-shadow: 1px 4px 22px -8px #0004;
    display: flex;
    overflow: hidden;
}
.login_box .left{
  width: 100%;
  height: 100%;
  padding: 25px 25px;

}
.login_box .right{
  width: 50%;
  height: 100%
}
.left .top_link a {
    color: #452A5A;
    font-weight: 400;
}
.left .top_link{
  height: 20px
}
.left .contact{
	display: flex;
    align-items: center;
    justify-content: center;
    align-self: center;
    height: 100%;
    width: 73%;
    margin: auto;
}
.left h3{
  text-align: center;
  margin-bottom: 40px;
}
.left input {
    border: none;
    width: 80%;
    margin: 15px 0px;
    border-bottom: 1px solid #4f30677d;
    padding: 7px 9px;
    width: 100%;
    overflow: hidden;
    background: transparent;
    font-weight: 600;
    font-size: 14px;
}
.left{
	background: linear-gradient(-45deg, #dcd7e0, #fff);
}
.submit {
    border: none;
    padding: 15px 70px;
    border-radius: 8px;
    display: block;
    margin: auto;
    margin-top: 120px;
    background: #583672;
    color: #fff;
    font-weight: bold;
    -webkit-box-shadow: 0px 9px 15px -11px rgba(88,54,114,1);
    -moz-box-shadow: 0px 9px 15px -11px rgba(88,54,114,1);
    box-shadow: 0px 9px 15px -11px rgba(88,54,114,1);
}
.right {
    display:none;
	background:url('Image/1.jpg');
	/*background: url(https://cdn.dribbble.com/users/118246/screenshots/5343519/wifi.gif);*/
	color: #fff;
	position: relative;
}

.right .right-text{
  height: 100%;
  position: relative;
  transform: translate(0%, 45%);
}
.right-text h2{
  display: block;
  width: 100%;
  text-align: center;
  font-size: 50px;
  font-weight: 500;
}
.right-text h5{
  display: block;
  width: 100%;
  text-align: center;
  font-size: 19px;
  font-weight: 400;
}

.right .right-inductor{
  position: absolute;
  width: 70px;
  height: 7px;
  background: #fff0;
  left: 50%;
  bottom: 70px;
  transform: translate(-50%, 0%);
}
.top_link img {
    width: 28px;
    padding-right: 7px;
    margin-top: -3px;
}
}
    </style>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />

     <style type="text/css">
       form i {
    margin-left: -30px;
    cursor: pointer;
}
    </style>
</head>
<body>
    <div>
            <section class="login">
		<div class="login_box">
			<div class="left">
              
				<%--<div class="top_link"><a href="#"><img src="https://drive.google.com/u/0/uc?id=16U__U5dJdaTfNGobB_OpwAJ73vM50rPV&export=download" alt="">Return home</a></div>--%>
                <div class="text-center">
                    <img src="Image/Vidyasagar.gif" style="width:60%" />
                        </div>
				<div class="contact">
                     
					<form id="form1" runat="server" style="margin-top:-155px;">
                       
						<h3>SIGN IN</h3>
						<input id="txtusername" runat="server" placeholder="USERNAME"/>
                         <asp:RequiredFieldValidator ID="reqcompanyname" Display="Dynamic" ForeColor="Red" ControlToValidate="txtusername" runat="server" ErrorMessage='Enter Name'></asp:RequiredFieldValidator>
						<input id="txtpassword" runat="server" type="password" placeholder="PASSWORD"/>
                            <b> <i class="bi bi-eye-slash" id="togglePassword"></i></b>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ForeColor="Red" ControlToValidate="txtpassword" runat="server" ErrorMessage='Enter Password'></asp:RequiredFieldValidator>
                        <asp:label ID="lbl_errormsg" runat="server" Text="" ForeColor="Red"></asp:label>
						<asp:Button ID="btnSubmit" class="submit" OnClick="btnSubmit_Click" style=" background: #583672;" runat="server" Text="SUBMIT" />
                       <%-- <a href="Forgotpassword.aspx"  style="color: blue" >Forgot password ?</a>--%>
					</form>
				</div>
			</div>
			<div class="right">
				<div class="right-inductor"><img src="" alt=""></div>
			</div>
		</div>
	</section>
        </div>
 <script type="text/javascript">
     const togglePassword = document.querySelector("#togglePassword");
     const password = document.querySelector("#txtpassword");
     togglePassword.addEventListener("click", function () {
         // toggle the type attribute
         const type = password.getAttribute("type") === "password" ? "text" : "password";
         password.setAttribute("type", type);
         // toggle the icon
         this.classList.toggle("bi-eye");
     });
     // prevent form submit
 </script> 
</body>
</html>
