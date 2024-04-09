<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Staff.Master" AutoEventWireup="true" CodeBehind="EditStudent.aspx.cs" Inherits="StudentResult.EditStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <asp:Label ID="lblError" runat="server"></asp:Label>
            <div class="col-md-12 pt-2">
                <div class="row">
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-10">
                        <div class="card">
                            <div class="card-body">
                                <h4>Update Student Details</h4>
                                <div class="row">
                               <div class="col-md-6">
                                <div class="form-group pt-2">
                                    <label>Student Name <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtStudentName" CssClass="form-control" placeholder="Enter Student Name" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="reqTitle" Display="Dynamic" ForeColor="Red" ControlToValidate="txtStudentName" runat="server" ErrorMessage='Enter Student Name'></asp:RequiredFieldValidator>
                                </div>
                                 
                               <div class="form-group pt-2">
                                    <label>Student DOB <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtdobDate" CssClass="form-control" placeholder="Enter DOB" TextMode="Date" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ForeColor="Red" ControlToValidate="txtdobDate" runat="server" ErrorMessage='Enter Date'></asp:RequiredFieldValidator>
                                </div>
                                  <div class="form-group pt-2">
                                    <label>Class <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtClass" CssClass="form-control" placeholder="Enter Class"  runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" ForeColor="Red" ControlToValidate="txtClass" runat="server" ErrorMessage='Enter Class'></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group pt-2">
                                    <label>Email ID <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtEmailID" CssClass="form-control" placeholder="Enter EmailID" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" ForeColor="Red" ControlToValidate="txtEmailID" runat="server" ErrorMessage='Enter EmailID'></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailID"
    ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
    Display = "Dynamic" ErrorMessage = "Invalid email address"/>
                                </div>
                                    <div class="form-group pt-2">
                                    <label>Password <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Enter Password" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" ForeColor="Red" ControlToValidate="txtPassword" runat="server" ErrorMessage='Enter Password'></asp:RequiredFieldValidator>
                                </div>
                           </div>
                                <div class="col-md-6">
                                    <div class="form-group pt-2">
                                    <label>Student Reg No <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtRegNo" CssClass="form-control" placeholder="Enter Reg No" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ForeColor="Red" ControlToValidate="txtRegNo" runat="server" ErrorMessage='Enter Reg No'></asp:RequiredFieldValidator>
                                </div>
                                    <div class="form-group pt-2">
                                    <label>Batch<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtBatch" CssClass="form-control" placeholder="Enter Batch"  runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ForeColor="Red" ControlToValidate="txtBatch" runat="server" ErrorMessage='Enter Batch'></asp:RequiredFieldValidator>
                                </div>
                               
                                 <div class="form-group pt-2">
                                    <label>Section <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtSection" CssClass="form-control" placeholder="Enter Class" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" ForeColor="Red" ControlToValidate="txtSection" runat="server" ErrorMessage='Enter Section'></asp:RequiredFieldValidator>
                                </div>
                                 <div class="form-group pt-2">
                                    <label>Upload Image <span class="text-danger">*</span></label>
                                        <asp:FileUpload ID="FileUpload" runat="server" CssClass="form-control" />
                                     <asp:Label ID="lblUpload" runat="server"></asp:Label>
                                </div>
                                     <div class="form-group">
                                <label>Status<span class="text-danger">*</span></label>
                               <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" style="padding:17px !important;color:#000">
                                   <asp:ListItem Value="">---Select Status--</asp:ListItem>
                                   <asp:ListItem Value="Active">Active</asp:ListItem>
                                   <asp:ListItem Value="InActive">InActive</asp:ListItem>
                               </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlStatus" ErrorMessage="Choose Status" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                                    </div>
                                     <div class="text-center">
                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                                    <a href="ViewStudent.aspx" class="btn btn-secondary">Back</a>
                                </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
