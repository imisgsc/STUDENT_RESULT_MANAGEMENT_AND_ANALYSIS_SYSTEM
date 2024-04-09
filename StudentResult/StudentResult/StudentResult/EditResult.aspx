<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Staff.Master" AutoEventWireup="true" CodeBehind="EditResult.aspx.cs" Inherits="StudentResult.EditResult" %>
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
                                <h4>Result Update</h4>
                                <div class="row">
                               <div class="col-md-6">
                                <div class="form-group pt-2">
                                    <label>Student Name <span class="text-danger">*</span></label>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                                            <ContentTemplate>
                                                <asp:DropDownList ID="ddlStudentName" runat="server" CssClass="form-control" Style="padding: 17px !important; color: #000"></asp:DropDownList>
                                     <asp:RequiredFieldValidator ID="reqTitle" Display="Dynamic" ForeColor="Red" ControlToValidate="ddlStudentName" runat="server" ErrorMessage='Enter Student Name'></asp:RequiredFieldValidator>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                  <div class="form-group pt-2">
                                    <label> Internal Ass <span class="text-danger">*</span></label>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtInternal" CssClass="form-control" placeholder="Enter Class"  runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" ForeColor="Red" ControlToValidate="txtInternal" runat="server" ErrorMessage='Enter Internal Ass'></asp:RequiredFieldValidator>
                                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtInternal"   
ErrorMessage="Enter value in specified range" ForeColor="Red" MaximumValue="25" MinimumValue="1"   
SetFocusOnError="True" Type=" Integer"></asp:RangeValidator>  
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                       </div>
                                    <div class="form-group pt-2">
                                    <label>University Ass <span class="text-danger">*</span></label>
                                        <asp:UpdatePanel ID="pnlUniveristy" runat="server" UpdateMode="Always">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtUniversity" CssClass="form-control" OnTextChanged="txtUniversity_TextChanged" AutoPostBack="true" placeholder="Enter Password" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" ForeColor="Red" ControlToValidate="txtUniversity" runat="server" ErrorMessage='Enter External Ass'></asp:RequiredFieldValidator>
                                                 <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtUniversity"   
ErrorMessage="Enter value in specified range" ForeColor="Red" MaximumValue="75" MinimumValue="1"   
SetFocusOnError="True" Type=" Integer"></asp:RangeValidator> 
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="txtUniversity" EventName="TextChanged" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                      </div>
                           </div>
                                <div class="col-md-6">
                                     <div class="form-group pt-2">
                                    <label>Sub Code <span class="text-danger">*</span></label>
                                         <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Always">
                                            <ContentTemplate>
                                                 <asp:TextBox ID="txtSubCode" CssClass="form-control" placeholder="Enter SUb Code" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ForeColor="Red" ControlToValidate="txtSubCode" runat="server" ErrorMessage='Enter Sub Code'></asp:RequiredFieldValidator>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        </div>
                                    <div class="form-group pt-2">
                                    <label>Total <span class="text-danger">*</span></label>
                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                                            <ContentTemplate>
<asp:TextBox ID="txtTotal" CssClass="form-control" placeholder="Enter Reg No" ReadOnly="true" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ForeColor="Red" ControlToValidate="txtTotal" runat="server" ErrorMessage='Enter Total'></asp:RequiredFieldValidator>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                         </div>
                                    <div class="form-group pt-2">
                                    <label>Percentage<span class="text-danger">*</span></label>
                                        <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Always">
                                            <ContentTemplate>
                                                 <asp:TextBox ID="txtPercentage" ReadOnly="true" CssClass="form-control" placeholder="Enter Batch"  runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ForeColor="Red" ControlToValidate="txtPercentage" runat="server" ErrorMessage='Enter Percentage'></asp:RequiredFieldValidator>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                   </div>
                                    </div>
                                     <div class="text-center">
                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                                    <a href="ViewResult.aspx" class="btn btn-secondary">Back</a>
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
