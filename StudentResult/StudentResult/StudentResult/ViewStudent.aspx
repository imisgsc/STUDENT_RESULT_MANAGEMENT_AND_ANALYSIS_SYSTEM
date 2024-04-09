<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Staff.Master" AutoEventWireup="true" CodeBehind="ViewStudent.aspx.cs" Inherits="StudentResult.ViewStudent" %>
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
                        <div class="col-md-2">
                            <asp:TextBox ID="txtRegNo"  class="form-control" placeholder="Search Reg No" runat="server"></asp:TextBox>
                        </div>
                          <div class="col-md-2">
                            <asp:TextBox ID="txtEmailID"  class="form-control" placeholder="Search Email ID" runat="server"></asp:TextBox>
                        </div>
                                 <div class="col-md-2">
                            <asp:TextBox ID="txtBatch"  class="form-control" placeholder="Search Batch" runat="server"></asp:TextBox>
                        </div>
                                 <div class="col-md-2">
                            <asp:TextBox ID="txtname"  class="form-control" placeholder="Search Name" runat="server"></asp:TextBox>
                        </div>
                       <div class="col-md-4 pt-2">
                            <asp:Button ID="btnSearch" class="btn btn-secondary btn-md" OnClick="btnSearch_Click" ValidationGroup="txtSearch" runat="server" Text="Search" />
                              <a href="AddStudent.aspx" class="btn btn-success btn-md">Add Student Profile</a>
                        </div>
                    </div>
                     </div>
                  
                     
                </div>
                    </div>
                <div class="pt-2">
                <div class="card">
                        <div class="box-tools float-right">
                    <div class="card-body">
                         <h3 class="card-title">List of Student Details</h3>
                        <div class="table-responsive">
                            <asp:Repeater ID="rptUsers" runat="server" OnItemCommand="rptUsers_ItemCommand">
                                <HeaderTemplate>
                                    <table class="table  table-bordered">
                                        <tr class="data text-light textr">
                                            <th class="text-center" style="width: 5%">S.No</th>
                                            <th class="text-center" style="width: 10%">Image</th>
                                            <th  class="text-center" style="width: 10%">Student Name</th>
                                            <th class="text-center" style="width: 20%">Register No</th>
                                            <th class="text-center" style="width: 5%">DOB</th>
                                            <th class="text-center" style="width: 5%">Batch</th>
                                            <th class="text-center" style="width: 5%">Class</th>
                                            <th class="text-center" style="width: 5%">Section</th>
                                            <th class="text-center" style="width: 5%">Status</th>
                                            <th class="text-center" style="width: 5%">Action</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr >
                                        <td class="text-center">
                                            <%# DataBinder.Eval(Container.DataItem,"slNo")%>
                                        </td>
                                        <td class="text-center">
                                             <img src="../Upload/<%# Eval("UploadFile")%>" style="width:60px;height:60px" class="rounded" />
                                        </td>
                                            <td class="text-center">
                                            <%# DataBinder.Eval(Container.DataItem,"Name") %>
                                        </td>
                                       <td class="text-center">
                                            <%# DataBinder.Eval(Container.DataItem,"RegNo") %>
                                        </td>
                                         <td class="text-center">
                                            <%# DataBinder.Eval(Container.DataItem,"DOB" , "{0 : dd MMM yyy }") %>
                                        </td>
                                         <td class="text-center">
                                            <%# DataBinder.Eval(Container.DataItem,"Batch") %>
                                        </td>
                                        <td class="text-center">
                                            <%# DataBinder.Eval(Container.DataItem,"Class") %>
                                        </td>
                                         <td class="text-center">
                                            <%# DataBinder.Eval(Container.DataItem,"Section") %>
                                        </td>
                                         <td class="text-center text-success">
                                           <b> <%# DataBinder.Eval(Container.DataItem,"Status") %></b>
                                        </td>
                                        <td class="text-center">
                                            <a href="EditStudent.aspx?mode=edit&Id=<%#(DataBinder.Eval(Container.DataItem,"Id")) %>"title="Edit profile " data-toggle="tooltip" data-placement="top" class="btn btn-default btn-sm btn-warning "><i class="fa fa-edit iconColor"></i></a>
                                            <asp:LinkButton ID="lnkDelete" ToolTip="Delete Access " CommandName="delete" CommandArgument='<%# Eval("Id") %>' class="btn btn-sm btn-danger" data-toggle="tooltip" data-placement="top" runat="server" Text='Delete Profile' OnClientClick='javascript:return confirm("Are you sure you want to delete?")'><i class="fa fa-trash iconColor"></i></asp:LinkButton>
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
