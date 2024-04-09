<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Staff.Master" AutoEventWireup="true" CodeBehind="StudentResult.aspx.cs" Inherits="StudentResult.StudentResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <asp:Panel ID="pnlMSG" runat="server" Visible="false">
                    <div class="alert alert-success alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <h4><i class="icon fa fa-ban"></i>Alert!</h4>
                        <asp:Label ID="lblMSG" runat="server" Text=""></asp:Label>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlerror" runat="server" Visible="false">
                    <div class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <h4><i class="icon fa fa-ban"></i>Alert!</h4>
                        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                    </div>
                </asp:Panel>
                <div class="pt-2">
                 <div class="card">
                     <div class="card-body">
                           <div class="row">
                        <div class="col-md-3" style="display:none !important">
                            <asp:TextBox ID="txtStudentname"  class="form-control" placeholder="Search StudentName" runat="server"></asp:TextBox>
                        </div>
                          <div class="col-md-2" style="display:none !important">
                            <asp:TextBox ID="txtStatus"  class="form-control" placeholder="Search by Status" runat="server"></asp:TextBox>
                        </div>
                                 <div class="col-md-3">
                            <asp:TextBox ID="txtSubCode"  class="form-control" placeholder="Search by Sub Code" runat="server"></asp:TextBox>
                        </div>
                       <div class="col-md-4 pt-2">
                            <asp:Button ID="btnSearch" class="btn btn-secondary btn-md" OnClick="btnSearch_Click" ValidationGroup="txtSearch" runat="server" Text="Search" />
                        </div>
                    </div>
                     </div>
                  
                     
                </div>
                    </div>
                <div class="pt-2">
                <div class="card">
                        <div class="box-tools float-right">
                    <div class="card-body">
                         <h3 class="card-title">List of Exam Result</h3>
                        <div class="table-responsive">
                            <asp:Repeater ID="rptUsers" runat="server" OnItemCommand="rptUsers_ItemCommand">
                                <HeaderTemplate>
                                    <table class="table  table-bordered">
                                        <tr class="data text-light textr">
                                            <th class="text-center" style="width: 5%">S.No</th>
                                            <th class="text-center" style="width: 10%">Marksheet</th>
                                            <th  class="text-center" style="width: 10%">Student Name</th>
                                            <th class="text-center" style="width: 10%">Sem / Sub Code</th>
                                            <th class="text-center" style="width: 5%">Intern </th>
                                            <th class="text-center" style="width: 5%">Univer Marks</th>
                                            <th class="text-center" style="width: 5%">Total</th>
                                            <th class="text-center" style="width: 5%">Status</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr >
                                        <td class="text-center">
                                            <%# DataBinder.Eval(Container.DataItem,"slNo")%>
                                        </td>
                                        <td class="text-center">
                                            <asp:Panel ID="pnlUploadMark" runat="server" Visible='<%#((Eval("UploadMarkSheet").ToString()!=""))%>'>
                                            <%-- <img src="../MUpload/<%# Eval("UploadMarkSheet")%>" style="width:60px;height:60px" class="rounded" />--%>
                                            <a href="../MUpload/<%# Eval("UploadMarkSheet")%>" target="_blank">
                                                 <i class="mdi mdi-file-pdf"></i> 
                                            </a>
                                                </asp:Panel>
                                        </td>
                                            <td class="text-center text-primary">
                                            <b><%# DataBinder.Eval(Container.DataItem,"StudentName") %></b>
                                        </td>
                                        <td class="text-center text-success">
                                          <b>  <%# DataBinder.Eval(Container.DataItem,"Semester") %> | <br />
                                            <%# DataBinder.Eval(Container.DataItem,"Sub_Code") %></b>
                                        </td>
                                         <td class="text-center">
                                            <%# DataBinder.Eval(Container.DataItem,"InternMarks") %>
                                        </td>
                                        <td class="text-center">
                                            <%# DataBinder.Eval(Container.DataItem,"UniversityMarks") %>
                                        </td>
                                         <td class="text-center">
                                            <%# DataBinder.Eval(Container.DataItem,"Total") %> %
                                        </td>
                                         <td class="text-center text-success">
                                             
                                           <b>  <%# db.IsActive(DataBinder.Eval(Container.DataItem,"OutComeStatus").ToString())%> </b>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>

                            </asp:Repeater>
                            <asp:Panel ID="pnlNoRecord" Visible="false" runat="server">
                                <h3 class="text-danger text-bold text-center">No Record Found</h3>
                            </asp:Panel>
                        </div>

                        <div class="box-footer clearfix">
                            <ul class="page">
                                <!--<li><a href="#">&laquo;</a></li>-->
                                <asp:Repeater ID="rptPager" runat="server">
                                    <ItemTemplate>
                                        <li>
                                            <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                                                CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'
                                                OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <!--<li><a href="#">&raquo;</a></li>-->
                            </ul>
                        </div>
                        <%--Style="padding: 8px; margin: 2px; background: lightgray; border: solid 1px #666; color: black; font-weight: bold"--%>
                    </div>
                </div>
            </div>
                    </div>
        </div>
    </div>
    </div>
</asp:Content>
