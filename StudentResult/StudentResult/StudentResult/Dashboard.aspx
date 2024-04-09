<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Staff.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="StudentResult.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .card .card-body {
            background: #fff;
            padding: 20px;
            box-shadow: unset !important;
            border-radius: 16px;
            border: none !important;
            background-color: none !important;
            /* border-top: 2px solid #179E66;*/
        }
    </style>
    <link href="Content/Chart.css" rel="stylesheet" />
    <link href="Content/Chart.min.css" rel="stylesheet" />
     <script src="Content/chart.min.js"></script>
    <script src="Content/chart.js"></script>
    <script>
        window.onload = function () {
            var Chart1 = document.getElementById('Chart1');
            var Chart1 = new Chart(Chart1, {
                type: 'pie',
                data: {
                    labels: <%= PresentWeek1 %> ,
                    datasets: [{
                        data: <%= PresentWeek %> ,
                        backgroundColor: [
                            'rgba(255, 99, 132)',
                            'rgba(153, 102, 255)',
                            'rgba(255, 205, 86)',
                            'rgba(75, 192, 192)',
                            'rgba(54, 162, 235)',
                            'rgba(153, 102, 255)'

                        ],
                        borderColor: [
                            'rgba(255, 99, 132)',
                            'rgba(153, 102, 255)',
                            'rgba(255, 205, 86)',
                            'rgba(75, 192, 192)',
                            'rgba(54, 162, 235)',
                            'rgba(153, 102, 255)'

                        ],
                        borderWidth: 1
                    }]
                },
                options: {

                    scales: {
                        y: [{
                            ticks: {
                                display: false
                            }
                        }]
                    }

                }
            });

            var Chart2 = document.getElementById('NewChart2');
            var Chart2 = new Chart(Chart2, {
                data: {
                    labels: <%= PresentWeek3 %> ,
                    datasets: [{
                        type: 'bar',
                        label: 'No of Student Pass',
                        data: <%= PresentWeek2 %>,
                        backgroundColor: [
                            'rgba(255, 99, 132)',
                            'rgba(255, 159, 64)',
                            'rgba(255, 205, 86)',
                            'rgba(75, 192, 192)',
                            'rgba(54, 162, 235)',
                            'rgba(153, 102, 255)',
                        ],
                        borderColor: [
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        },
                        legend: {
                            display: false
                        }

                    }
                }
            });

            var Chart3 = document.getElementById('DataChart3');
            var Chart3 = new Chart(Chart3, {
                data: {
                    labels: <%= PresentWeek5 %> ,
                    datasets: [{
                        type: 'bar',
                        label: 'No of Student Fail',
                        data: <%= PresentWeek4 %>,
                        backgroundColor: [
                            'rgba(255, 99, 132)',
                            'rgba(255, 159, 64)',
                            'rgba(255, 205, 86)',
                            'rgba(75, 192, 192)',
                            'rgba(54, 162, 235)',
                            'rgba(153, 102, 255)',
                        ],
                        borderColor: [
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        },
                        legend: {
                            display: false
                        }

                    }
                }
            });
        }
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <asp:Label ID="lblError" runat="server"></asp:Label>
            <div class="col-md-12 pt-2">
               <div class="row">
              <div class="col-xl-4">
                <div class="card stretch-card mb-3">
                  <div class="card-body d-flex flex-wrap justify-content-between">
                    <div>
                      <h4 class="font-weight-semibold mb-1 text-black"> Total No of Students </h4>
                      <%--<h6 class="text-muted">Average Weekly Profit</h6>--%>
                        <h1><i class="fa fa-tag text-info" style="width:50px !important"></i></h1>
                    </div>
                    <h3 class="text-success font-weight-bold"><asp:Label ID="lblStudent" runat="server"></asp:Label></h3>
                  </div>
                </div>
                  </div>
                     <div class="col-xl-4">
                <div class="card stretch-card mb-3">
                  <div class="card-body d-flex flex-wrap justify-content-between">
                    <div>
                      <h4 class="font-weight-semibold mb-1 text-black"> No of Students Pass</h4>
                      <%--<h6 class="text-muted">Weekly Customer Orders</h6>--%>
                        <h1><i class="fa fa-tags text-success" style="width:50px !important"></i></h1>
                    </div>
                    <h3 class="text-success font-weight-bold"><asp:Label ID="lblPass" runat="server"></asp:Label></h3>
                  </div>
                </div>
                         </div>
                     <div class="col-xl-4">
                <div class="card stretch-card mb-3">
                  <div class="card-body d-flex flex-wrap justify-content-between">
                    <div>
                      <h4 class="font-weight-semibold mb-1 text-black"> No of Students Fail </h4>
                      <%--<h6 class="text-muted">System bugs and issues</h6>--%>
                         <h1><i class="fa fa-tasks text-danger" style="width:50px !important"></i></h1>
                    </div>
                    <h3 class="text-danger font-weight-bold"><asp:Label ID="lblFail" runat="server"></asp:Label></h3>
                  </div>
                </div>
              </div>
              
            </div>


              <div class="row">
                  <div class="col-sm-12">
                      <div class="row">
                          <div class="col-md-4">
                              <div class="card">
                                  <div class="card border-0">
                                      <div class="card-body">
                                          <div class="card-title">Status Wise</div>
                                          <div class="d-flex flex-wrap">
                                              <canvas id="Chart1" width="200" height="200"></canvas>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <div class="col-md-8">
                              <div class="card">
                                  <div class="card border-0">
                                      <div class="card-body">
                                          <div class="card-title">Subject Code Wise Pass Details</div>
                                          <div class="d-flex flex-wrap">
                                              <canvas id="NewChart2"  height="140"></canvas>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <div class="col-md-7 mt-3">
                              <div class="card">
                                  <div class="card border-0">
                                      <div class="card-body">
                                          <div class="card-title">Subject Code Wise Fail Details</div>
                                          <div class="d-flex flex-wrap">
                                              <canvas id="DataChart3"  height="200"></canvas>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                           <div class="col-md-5 mt-3">
                              <div class="card">
                                  <div class="card border-0">
                                      <div class="card-body">
                                          <div class="card-title">Subject Code Wise Topper List</div>
                                          <div class="d-flex flex-wrap">
                                            <div class="table-responsive">
                            <asp:Repeater ID="rptUsers" runat="server">
                                <HeaderTemplate>
                                    <table class="table  table-bordered">
                                        <tr class="data text-light textr">
                                            <th class="text-center" style="width: 5%">S.No</th>
                                            <th class="text-center" style="width: 5%">Sub Code</th>
                                            <th class="text-center" style="width: 5%">Name</th>
                                            <th class="text-center" style="width: 5%">Marks</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr >
                                        <td class="text-center">
                                           <%# Container.ItemIndex + 1 %>
                                        </td>
                                        <td class="text-center">
                                            <%# DataBinder.Eval(Container.DataItem,"Sub_Code") %>
                                        </td>
                                         <td class="text-center">
                                            <%# DataBinder.Eval(Container.DataItem,"StudentName") %>
                                        </td>
                                         <td class="text-center text-success">
                                           <b> <%# DataBinder.Eval(Container.DataItem,"Total") %></b>
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
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
            </div>
        </div>
    </div>
        </div>
</asp:Content>
