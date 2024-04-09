<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Staff.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="StudentResult.StudentProfile" %>
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
                    <div class="col-md-5">
                       
                        <div class="card">
                            <div class="card-body">
                                <h4>Student Profile</h4>
                                 <div class="form-group text-center pt-2">
                                    <asp:Image ID="pnlImage" runat="server" style="width:85px;height:85px"  CssClass="rounded-3"  />
                                </div>
                                <div class="form-group ">
                                     <b class="text-primary"> <label > Name :</label></b>
                                    <asp:Label ID="lblname" runat="server" Font-Bold="true" CssClass="text-primary"></asp:Label>
                                </div>
                                <div class="form-group">
                                     <b class="text-primary"> <label > Reg No :</label></b>
                                    <asp:Label ID="lblReg" runat="server" Font-Bold="true" CssClass="text-primary"></asp:Label>
                                </div>
                                <div class="form-group ">
                                       <b class="text-primary"><label > DOB :</label></b>
                                    <asp:Label ID="lblDOB" runat="server" Font-Bold="true" CssClass="text-primary"></asp:Label>
                                </div>
                               <div class="form-group" >
                                      <b class="text-primary"> <label > Batch :</label></b>
                                    <asp:Label ID="lblBatch" runat="server" Font-Bold="true" CssClass="text-primary"></asp:Label>
                                </div>
                             
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="card">
                            <div class="card-body">
                                 <div class="form-group ">
                                      <b class="text-primary"> <label > Class :</label></b>
                                    <asp:Label ID="lblClass" runat="server" Font-Bold="true" CssClass="text-primary"></asp:Label>
                                </div>
                                 <div class="form-group">
                                      <b class="text-primary"> <label > Section :</label></b>
                                    <asp:Label ID="lblSection" runat="server" Font-Bold="true" CssClass="text-primary"></asp:Label>
                                </div>
                                 <div class="form-group">
                                      <b class="text-primary"> <label > Email ID :</label></b>
                                    <asp:Label ID="lblEmail" runat="server" Font-Bold="true" CssClass="text-primary"></asp:Label>
                                </div>
                                 <div class="form-group">
                                      <b class="text-primary"> <label > Password :</label></b>
                                    <asp:Label ID="lblpassword" runat="server" Font-Bold="true" CssClass="text-primary"></asp:Label>
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
