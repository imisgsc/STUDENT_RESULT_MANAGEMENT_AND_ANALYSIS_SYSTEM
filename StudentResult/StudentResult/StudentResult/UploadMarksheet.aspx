<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Staff.Master" AutoEventWireup="true" CodeBehind="UploadMarksheet.aspx.cs" Inherits="StudentResult.UploadMarksheet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <asp:Label ID="lblError" runat="server"></asp:Label>
            <div class="col-md-12 pt-2">
                <div class="row">
                     
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4">
                       
                        <div class="card">
                             
                            <div class="card-body">
                                <h4>Student Batch Creation</h4>
                            
                                  
                                 <div class="form-group pt-2">
                                    <label>Upload Mark sheet <span class="text-danger">*</span></label>
                                        <asp:FileUpload ID="FileUpload" runat="server" CssClass="form-control" />
                                     <asp:Label ID="lblUpload" runat="server" style="display:none !important"></asp:Label>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" ForeColor="Red" ControlToValidate="FileUpload" runat="server" ErrorMessage='Upload Image'></asp:RequiredFieldValidator>
                                </div>
                                 <div class="text-center">
                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                                    <a href="ViewResult.aspx" class="btn btn-secondary">Back</a>
                                </div>
                                    </div>
                                    
                                   
                        </div>
                    </div>
                    <div class="col-md-4">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
