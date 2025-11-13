<%@ Page Language="VB" AutoEventWireup="true" CodeFile="StudentRecord_V2.aspx.vb" Inherits="StudentRecord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TSSS School Portal</title>
    <style type="text/css">
<!--
.style30 {
	font-size: small;
	color: #006699;
}
A.left:link
{
	COLOR: RoyalBlue;
}
A.left:visited
{
    COLOR: RoyalBlue;
}
A.left:active
{
    COLOR: RoyalBlue;
}
A.left:hover
{
    COLOR: #FF6600;
}
A.top:link
{
	text-decoration:none;
	COLOR: White;
}
A.top:visited
{
	text-decoration:none;
    COLOR: White;
}
A.top:active
{
	text-decoration:none;
    COLOR: White;
}
A.top:hover
{
	text-decoration:underline;
    COLOR: White;
}
.style31 {font-family: Arial, Helvetica, sans-serif}
.style32 {font-size: small; color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; }
.style35 {font-size: small}
.style43 {
	font-size: x-large;
	font-weight: bold;
	color: #003366;
}
.style44 {
	font-size: large;
	font-weight: bold;
	color: #003366;
}
.style45 {color: #000000}
.style46 {color: #0000FF}
.style63 {color: #006699; font-weight: bold; font-size: 12px; }
.style64 {font-size: 12px; color: #0066FF;}
.style65 {
	color: #FF6600;
	font-weight: bold;
}
.style73 {color: #006699}
.style75 {font-size: 12px; color: #0066FF; font-weight: bold; }
        .auto-style2 {
            height: 13px;
        }
        .auto-style4 {
            height: 15px;
        }
        -->
</style>
<!--<style>
canvas{
  width:1000px !important;
  height:450px !important;
}
.table-results, .table-results th,.table-results td {
    border: solid 1px #ccc;
    border-collapse: collapse;
}
.table-results td {
    padding: 20px;
}
</style>-->
</head>
<body>
    
    <!--
<script src='Chart/Chart.bundle.js'></script>
<script src='Chart/Chart.bundle.min.js'></script>
<script src='Chart/utils.js'></script>
    <script>
        var randomScalingFactor = function () { return Math.round(Math.random() * 100) };
        var color = Chart.helpers.color;

        var barChartData = {
            //labels: ["January", "February", "March", "April", "May", "June", "July", "January", "February", "March", "April", "May", "June", "July"],
            labels: <% =ChartLabels %>,
            datasets: [
                {
                    label: 'T1 CW',
                    fillColor: 'rgba(220,220,220,1)',
                    strokeColor: 'rgba(220,220,220,1)',
                    pointColor: 'rgba(220,220,220,1)',
                    pointStrokeColor: '#fff',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(220,220,220,1)',
                    backgroundColor: color(window.chartColors.green).alpha(0.8).rgbString(),
                    data: [0.00, 10, 40.00, 60, 10.00, 80, 60, 0, 10, 40, 60, 10, 80, 60.00]
                    //data: <% =ChartDataCWT1 %>
                    },
                {
                    label: 'T1 CW AVG',
                    fillColor: 'rgba(151,187,205,0.2)',
                    strokeColor: 'rgba(151,187,205,1)',
                    pointColor: 'rgba(151,187,205,1)',
                    pointStrokeColor: '#fff',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(151,187,205,1)',
                    backgroundColor: color(window.chartColors.green).alpha(0.4).rgbString(),
                    data: [28, 48, 40.50, 19, 40.00, 27, 40, 28, 48, 40, 19, 40, 27, 40.00]
                    //data: <% =ChartDataCWT1AVG %>
                    },
				{
				    label: 'T2 CW',
				    fillColor: 'rgba(220,220,220,1)',
				    strokeColor: 'rgba(220,220,220,1)',
				    pointColor: 'rgba(220,220,220,1)',
				    pointStrokeColor: '#fff',
				    pointHighlightFill: '#fff',
				    pointHighlightStroke: 'rgba(220,220,220,1)',
				    backgroundColor: color(window.chartColors.blue).alpha(0.8).rgbString(),
				    data: [0, 10, 40, 60, 10, 80, 60, 0, 10, 40, 60, 100, 80, 60]
				    //data: <% =ChartDataCWT2 %>
				    },
                {
                    label: 'T2 CW AVG',
                    fillColor: 'rgba(151,187,205,0.2)',
                    strokeColor: 'rgba(151,187,205,1)',
                    pointColor: 'rgba(151,187,205,1)',
                    pointStrokeColor: '#fff',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(151,187,205,1)',
                    backgroundColor: color(window.chartColors.blue).alpha(0.4).rgbString(),
                    data: [28, 48, 40.75, 19, 40, 27, 40, 28, 48, 40, 19, 40, 27, 40]
                    //data: <% =ChartDataCWT2AVG %>
                    }
            ]
        }
            function DrawChart() {
                var ctx = document.getElementById('CW').getContext('2d');
                window.myBar = new Chart(ctx, {type: 'bar',
                    data: barChartData,
                    options: {
                        scales: {yAxes: [{ticks: {beginAtZero: true, min: 0, max: 100}}]},
                        maintainAspectRatio: false,
		
                        responsive: true}});
            }
            
    </script>
        -->

        <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        
        
        
        <div>        <table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width: 74px"><span class="style31"><span class="style43"><a href="https://www.tsss.edu.hk/" target="_blank"><img src="schoollogo.jpg" style="width: 64px; height: 57px; border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;"></a></span></span></td>
    <td valign="middle"><span class="style31"><span class="style43">Tak Sun Secondary School</span> <span class="style44">- School Portal</span></span></td>
  </tr>
</table>
W<span class="style45">elcome~!</span> 
            <asp:Label ID="LabelUserFullName" runat="server" CssClass="style73" Text=" "></asp:Label><span class="style46"><span class="style73"></span> <span class="style45">-</span> </span> <span class="style65">[<asp:LinkButton ID="LBtnLogout" runat="server" CssClass="left">Logout</asp:LinkButton><a href="Logout.aspx" class="left"></a>]</span>
<br>
<br>
<table height="22" border="1" cellpadding="0" cellspacing="0" bordercolor="#006699">
  <tr>
    <td width="123" bgcolor="#6699FF"><div align="center" class="style32 style31">
        <div align="center">
                <asp:LinkButton ID="LBtn01" runat="server" CssClass="top">Home</asp:LinkButton>&nbsp;</div>
    </div></td>
    <td bgcolor="#6699FF" style="width: 138px"><div align="center" class="style32">
        <div align="center"><a href="communication.htm" class="top"></a>
            <asp:LinkButton ID="LBtn03" runat="server" CssClass="top">Communication</asp:LinkButton></div>
    </div></td>
    <td width="144" bgcolor="#006699"><div align="center" class="style32">
        <div align="center">
            <span style="color: white">Student Information</span>&nbsp;</div>
    </div></td>
    <td bgcolor="#6699FF" style="width: 125px"><div align="center" class="style32">
        <asp:LinkButton ID="LBtn05" runat="server" CssClass="top">User Profile</asp:LinkButton><a href="usersetting.htm" class="top  style35"> </a></div></td>
      <td bgcolor="#6699ff" style="width: 131px"><div align="center" class="style32">
          <asp:LinkButton ID="LBtn06" runat="server" CssClass="top">About the Portal</asp:LinkButton></div></td>
  </tr>
</table>
<hr style="font-size: 12pt">
<strong> </strong><table border="0" cellpadding="0" cellspacing="0" style="font-size: 12pt">
  <tr valign="top">
    <td colspan="3" style="height: 2116px"><table border="0" cellspacing="0" cellpadding="5">
        <tr>
          <td valign="top"><table width="118" border="1" cellpadding="5" cellspacing="0" bordercolor="#006699">
              <tr>
                <td width="104" valign="top" bgcolor="#E9E9E9" style="height: 289px"><p align="left" class="style31">
                    <strong>Student<br />
                        Information<br />
                    </strong>
                        <br>
                        <span class="left style35"><span class="left style35">
                            <asp:Panel ID="PanelMenu01" runat="server">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td valign="top" style="width: 18px">
                                            <img src="r.gif" /></td>
                                        <td>
                            <asp:LinkButton ID="LBtnViewStudent" runat="server" CssClass="left" Enabled="False" Font-Names="Arial, Helvetica, sans-serif">View Students' Records</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 18px">&nbsp;
                                            </td>
                                        <td>&nbsp;
                                            </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" style="width: 18px">
                                            <img src="r.gif" /></td>
                                        <td valign="top">
                                            <asp:LinkButton ID="LBtnAddTutoring" runat="server" CssClass="left" Enabled="False"
                                                Font-Names="Arial, Helvetica, sans-serif">Edit Tutoring Records</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td valign="top" style="width: 18px">
                                        </td>
                                        <td valign="top">&nbsp;
                                            </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 18px; height: 16px" valign="top">
                                            <img src="r.gif" /></td>
                                        <td style="height: 16px" valign="top">
                                            <asp:LinkButton ID="LBtnAddCCA" runat="server" CssClass="left" Enabled="False" Font-Names="Arial, Helvetica, sans-serif">Edit CCA Records</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 18px; height: 16px" valign="top">&nbsp;
                                            </td>
                                        <td style="height: 16px" valign="top">&nbsp;
                                            </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 18px; height: 16px" valign="top">
                                            <img src="r.gif" /></td>
                                        <td style="height: 16px" valign="top">
                                            <asp:LinkButton ID="LBtnEditDR" runat="server" CssClass="left" Font-Names="Arial, Helvetica, sans-serif">Edit Discipline Records</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 18px; height: 16px" valign="top">&nbsp;</td>
                                        <td style="height: 16px" valign="top">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 18px; height: 16px" valign="top"><span class="left style35">
                                            <img src="r.gif" />
                                            </span></td>
                                        <td class="auto-style2">
                                            <asp:LinkButton ID="LBtnEditDS" runat="server" CssClass="left" Font-Names="Arial, Helvetica, sans-serif">HW Detention Class Records</asp:LinkButton>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <td style="width: 18px; height: 16px" valign="top">&nbsp;</td>
                                        <td class="auto-style2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="height: 16px" valign="top"><span class="left style35">
                                            <img src="r.gif" />
                                            </span></td>
                                        <td class="auto-style2">
                                            <asp:LinkButton ID="LBtnEditCoun" runat="server" CssClass="left" Font-Names="Arial, Helvetica, sans-serif">Edit Counselling Records</asp:LinkButton>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <td style="height: 16px" valign="top">&nbsp;</td>
                                        <td style="height: 16px">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td valign="top" class="auto-style4"><span class="left style35">
                                            <img src="r.gif" />
                                            </span></td>
                                        <td class="auto-style4">
                                            <asp:LinkButton ID="LBtnEditSEN" runat="server" CssClass="left" Font-Names="Arial, Helvetica, sans-serif">View SEN Records</asp:LinkButton>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <td class="auto-style4" valign="top">&nbsp;</td>
                                        <td class="auto-style4">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="height: 16px" valign="top"><span class="left style35">
                                            <img src="r.gif" />
                                            </span></td>
                                        <td class="auto-style2">
                                            <asp:LinkButton ID="LBtnEditMC" runat="server" CssClass="left" Font-Names="Arial, Helvetica, sans-serif">Merit Card Records</asp:LinkButton>
                                        </td>
                                        
                                    </tr>
                                </table>
                            </asp:Panel>
                            &nbsp;<br />
                            <br />
                        </span>
                            <br>
                        <br>
                            &nbsp;</span><span class="style30"><br>
                        </span><br> 
                </p>                    </td>
              </tr>
          </table></td>
          <td valign="top"><p><strong>            </strong><strong>            
              <asp:Label ID="LabelTitle" runat="server" Text="View Students' Records"></asp:Label>
              <asp:Label ID="LabelPR" runat="server" ForeColor="Red" Text="(Permission Required)"></asp:Label></strong></p>
              <asp:Panel ID="Panel1" runat="server" Visible="False">
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                      <ContentTemplate>

                       
                         
                          <asp:Label ID="Label6" runat="server"></asp:Label>
                         

                          
                          

                          
                          <table>
                              <tr>
                                  <td valign="top">
                                      <strong>
                                      TsssID:<br />
                                      </strong>
                                      &nbsp;</td>
                                  <td valign="top">
                          <asp:TextBox ID="TextBox1" runat="server" Width="66px"></asp:TextBox><br />
                                      &nbsp;</td>
                                  <td valign="top">
                          <asp:LinkButton ID="LBtnGetTsssId" runat="server" ForeColor="Green" OnClick="LBtnGetTsssId_Click">get tsss id</asp:LinkButton><br />
                                      &nbsp;</td>
                                  <td colspan="3" rowspan="2">
                          <asp:Panel ID="Panel2" runat="server" BackColor="WhiteSmoke" BorderWidth="1px" BorderColor="Green" Visible="False">
                              <table>
                                  <tr>
                                      <td>
                                          <span style="font-size: 8pt">
                                          Academic Year:</span></td>
                                      <td>
                                          <span style="font-size: 8pt">
                                          Class:</span></td>
                                      <td>
                                          <span style="font-size: 8pt">
                                          Class no:</span></td>
                                      <td>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                              <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="a_year" DataValueField="a_year">
                              </asp:DropDownList></td>
                                      <td>
                                          <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="class" DataValueField="class">
                              </asp:DropDownList></td>
                                      <td>
                              <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="class_no" DataValueField="class_no">
                              </asp:DropDownList></td>
                                      <td>
                              <asp:Button ID="BtnGet" runat="server" Text="Get" OnClick="BtnGet_Click" /></td>
                                  </tr>
                              </table>
                              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DataArchiveConnectionString %>"
                                  SelectCommand="SELECT DISTINCT [a_year] FROM [Student] ORDER BY [a_year] DESC"></asp:SqlDataSource>
                              <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DataArchiveConnectionString %>"
                                  SelectCommand="SELECT DISTINCT [class] FROM [Student] WHERE [a_year] &lt;&gt; '2006/2007' AND[a_year] &lt;&gt; '2007/2008'  AND [a_year] &lt;&gt; '2008/2009'  AND [a_year] &lt;&gt; '2009/2010'  AND [a_year] &lt;&gt; '2010/2011'  AND [a_year] &lt;&gt; '2011/2012'ORDER BY [class]"></asp:SqlDataSource>
                              <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DataArchiveConnectionString %>"
                                  SelectCommand="SELECT DISTINCT [class_no] FROM [Student] ORDER BY [class_no]"></asp:SqlDataSource>
                          </asp:Panel>
                                      <br />
                                  </td>
                                  <td colspan="1" rowspan="2" valign="top">
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="3" style="height: 49px" valign="top">
                                      <asp:Button ID="BtnViewStudentRecord" runat="server" OnClick="BtnViewStudentRecord_Click" Text="View this student"/>
                                      &nbsp; 
                                      <br />
                                      <br />
                                      <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" Visible="False">
                                          <ProgressTemplate>
                                              <img src="loading2.gif" />
                                          </ProgressTemplate>
                                      </asp:UpdateProgress>
                                  </td>
                              </tr>
                          </table>

<asp:UpdatePanel ID="upSearch" runat="server">
    <ContentTemplate>

        <div style="border:1px solid #ccc;padding:12px;width:420px;">
            <strong>Student Search Box</strong><br /><br />

            <table>
                <tr>
                    <td>Surname&nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtSurname" runat="server" Width="130px" />
                    </td>
                </tr>
                <tr>
                    <td>Given name&nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtGivenName" runat="server" Width="130px" />
                    </td>
                </tr>
                <tr>
                    <td>Common English&nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtCommonEnglish" runat="server" Width="130px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-top:12px">
                        <asp:Button ID="btnSearchStudent"
                                    runat="server"
                                    Text="Search"
                                    OnClick="btnSearchStudent_Click" />
                    </td>
                </tr>
            </table>
        </div>

        <br />

        <!-- NEW: AllowPaging + PageSize + PageIndexChanging -->
        <asp:GridView ID="gvSearchResult"
                      runat="server"
                      AutoGenerateColumns="False"
                      CssClass="table-results"
                      DataKeyNames="tsss_id"
                      DataSourceID="SqlDataSourceSelectStudent"
                      EmptyDataText="No student found."
                      AllowPaging="True"
                      PageSize="10"
                      AllowSorting="True"
                      OnSorting="gvSearchResult_Sorting"
                      OnPageIndexChanging="gvSearchResult_PageIndexChanging"
                      OnSelectedIndexChanged="gvSearchResult_SelectedIndexChanged">

            <Columns>
                <asp:TemplateField HeaderText="TSSS-ID" SortExpression="tsss_id">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkPick"
                                        runat="server"
                                        CommandName="Select"
                                        Text='<%# Eval("tsss_id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="surname"        HeaderText="Surname"     SortExpression="surname" />
                <asp:BoundField DataField="name"           HeaderText="Given name"    SortExpression="name" />
                <asp:BoundField DataField="common_english" HeaderText="Common English"  SortExpression="common_english" />
                <asp:BoundField DataField="chinese_name"   HeaderText="Chinese Name"    SortExpression="chinese_name" />
                <asp:BoundField DataField="ClassName"      HeaderText="Class"   SortExpression="ClassName" />
                <asp:BoundField DataField="ClassNo"        HeaderText="Class No."   SortExpression="ClassNo" />
                <asp:BoundField DataField="year"           HeaderText="Year"    SortExpression="year" />
            </Columns>

        </asp:GridView>

    </ContentTemplate>

    <Triggers>
        <asp:PostBackTrigger ControlID="btnSearchStudent" />
    </Triggers>
</asp:UpdatePanel>

<asp:SqlDataSource ID="SqlDataSourceSelectStudent"
                   runat="server"
                   ConnectionString="<%$ ConnectionStrings:DataArchiveConnectionString %>"
                   SelectCommand="
        SELECT  tsss_id,
                surname,
                name,
                common_english,
                chinese_name,
                year,
                ClassName,
                ClassNo
        FROM    viewWebStudentList
        WHERE   (@surname = '' OR surname LIKE '%' + @surname + '%')
            AND (@gname   = '' OR name LIKE '%' + @gname + '%')
            AND (@commonEnglish = '' OR common_english LIKE '%' + @commonEnglish + '%')
        ORDER BY surname, name">

    <SelectParameters>
        <asp:ControlParameter ControlID="txtSurname"
                              Name="surname"
                              Type="String"
                              ConvertEmptyStringToNull="False"
                              DefaultValue="" />

        <asp:ControlParameter ControlID="txtGivenName"
                              Name="gname"
                              Type="String"
                              ConvertEmptyStringToNull="False"
                              DefaultValue="" />

        <asp:ControlParameter ControlID="txtCommonEnglish"
                              Name="commonEnglish"
                              Type="String"
                              ConvertEmptyStringToNull="False"
                              DefaultValue="" />
    </SelectParameters>
</asp:SqlDataSource>
<!-- =========================================================================== -->         
                          <!--
<script src='Chart/Chart.bundle.js'></script>
<script src='Chart/Chart.bundle.min.js'></script>
<script src='Chart/utils.js'></script>
<script>
        var randomScalingFactor = function () { return Math.round(Math.random() * 100) };
        var color = Chart.helpers.color;

        var barChartData = {
            //labels: ["January", "February", "March", "April", "May", "June", "July", "January", "February", "March", "April", "May", "June", "July"],
            labels: <% =ChartLabels%>,
        datasets: [
            {
                label: 'T1 CW',
                fillColor: 'rgba(220,220,220,1)',
                strokeColor: 'rgba(220,220,220,1)',
                pointColor: 'rgba(220,220,220,1)',
                pointStrokeColor: '#fff',
                pointHighlightFill: '#fff',
                pointHighlightStroke: 'rgba(220,220,220,1)',
                backgroundColor: color(window.chartColors.green).alpha(0.8).rgbString(),
                data: [0.00, 10, 40.00, 60, 10.00, 80, 60, 0, 10, 40, 60, 10, 80, 60.00]
                //data: <% =ChartDataCWT1 %>
            },
                {
                    label: 'T1 CW AVG',
                    fillColor: 'rgba(151,187,205,0.2)',
                    strokeColor: 'rgba(151,187,205,1)',
                    pointColor: 'rgba(151,187,205,1)',
                    pointStrokeColor: '#fff',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(151,187,205,1)',
                    backgroundColor: color(window.chartColors.green).alpha(0.4).rgbString(),
                    data: [28, 48, 40.50, 19, 40.00, 27, 40, 28, 48, 40, 19, 40, 27, 40.00]
                    //data: <% =ChartDataCWT1AVG %>
                },
				{
				    label: 'T2 CW',
				    fillColor: 'rgba(220,220,220,1)',
				    strokeColor: 'rgba(220,220,220,1)',
				    pointColor: 'rgba(220,220,220,1)',
				    pointStrokeColor: '#fff',
				    pointHighlightFill: '#fff',
				    pointHighlightStroke: 'rgba(220,220,220,1)',
				    backgroundColor: color(window.chartColors.blue).alpha(0.8).rgbString(),
				    data: [0, 10, 40, 60, 10, 80, 60, 0, 10, 40, 60, 100, 80, 60]
				    //data: <% =ChartDataCWT2 %>
				},
                {
                    label: 'T2 CW AVG',
                    fillColor: 'rgba(151,187,205,0.2)',
                    strokeColor: 'rgba(151,187,205,1)',
                    pointColor: 'rgba(151,187,205,1)',
                    pointStrokeColor: '#fff',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(151,187,205,1)',
                    backgroundColor: color(window.chartColors.blue).alpha(0.4).rgbString(),
                    data: [28, 48, 40.75, 19, 40, 27, 40, 28, 48, 40, 19, 40, 27, 40]
                    //data: <% =ChartDataCWT2AVG %>
                }
        ]
        }
        function DrawChart() {
            var ctx = document.getElementById('CW').getContext('2d');
            window.myBar = new Chart(ctx, {type: 'bar',
                data: barChartData,
                options: {
                    scales: {yAxes: [{ticks: {beginAtZero: true, min: 0, max: 100}}]},
                    maintainAspectRatio: false,
		
                    responsive: true}});
        }
            
    </script>
                              -->


                                      <asp:Label ID="LabelWarning" runat="server" ForeColor="Red" Text="You can only view the information of your personal tutees and students of your class." Visible="False"></asp:Label><asp:Panel ID="Panel3" runat="server" Visible="False" Direction="LeftToRight">
                              
                              <!--
                              <asp:LinkButton ID="LinkButtonTTSum1" runat="server" Font-Bold="True" Font-Size="XX-Large">--&gt; School Calendar Summary (12/4 - 8/5) &lt;--</asp:LinkButton>
                              <br />
                              <br />
                              <asp:LinkButton ID="LinkButtonTTSum2" runat="server" Font-Bold="True" Font-Size="XX-Large">--&gt; School Calendar Summary (10/5 - 11/6) &lt;--</asp:LinkButton>
                              <br />
                              <br />
                              <asp:LinkButton ID="LinkButtonTTPM1" runat="server" Font-Bold="True" Font-Size="XX-Large">--&gt; Special Timetable for Face to Face PM lessons (12/4 - 8/5) &lt;--</asp:LinkButton>
                              <br />
                              <br />
                              <asp:LinkButton ID="LinkButtonTTPM2" runat="server" Font-Bold="True" Font-Size="XX-Large">--&gt; Special Timetable for Face to Face PM lessons (10/5 - 11/6) &lt;--</asp:LinkButton>
                              <br />
                              <br />
                              -->

                              <asp:Label ID="LabelKAA" runat="server" Text="Key Area Analysis:   "></asp:Label>
                              <asp:DropDownList ID="DropDownListKAA" runat="server" AutoPostBack="True">
                                  <asp:ListItem Selected="True">---</asp:ListItem>
                                  <asp:ListItem>21-22</asp:ListItem>
                                  <asp:ListItem>20-21</asp:ListItem>
                                  <asp:ListItem>19-20</asp:ListItem>
                                  <asp:ListItem>18-19</asp:ListItem>
                              </asp:DropDownList>
                              <br />
                              <br />
                              <asp:Label ID="LabelKAA0" runat="server" Text="Online Report Card:   "></asp:Label>
                              <asp:DropDownList ID="DropDownListKAA0" runat="server" AutoPostBack="True">
                                  <asp:ListItem Selected="True">---</asp:ListItem>
                                  <asp:ListItem>21-22</asp:ListItem>
                                  <asp:ListItem>20-21</asp:ListItem>
                                  <asp:ListItem>19-20</asp:ListItem>
                                  <asp:ListItem>18-19</asp:ListItem>
                              </asp:DropDownList>
                              <br />
                              <br />
                              <asp:Label ID="LabelCurrentParts" runat="server" Font-Bold="True" Text="Current Particulars"></asp:Label>&nbsp;
                                          <asp:LinkButton ID="LBtnShowPP" runat="server" OnClick="LBtnShowPP_Click">show previous particulars</asp:LinkButton><br />
                              <asp:Label ID="LabelNoCP" runat="server" Font-Bold="True" ForeColor="Chocolate" Text=" - No Current Particulars"
                                  Visible="False" Width="198px"></asp:Label>&nbsp;
                                          <table>
                                              <tr>
                                                  <td valign="top">
                                                      &nbsp;<asp:Image ID="Image1" runat="server" BorderColor="Black" BorderStyle="Solid"
                                                          BorderWidth="1px" Height="165px" Visible="False" Width="124px" /></td>
                                                  <td valign="top">
                                                      &nbsp;&nbsp;
                                                  </td>
                                                  <td valign="top">
                                                      <asp:DetailsView ID="GridView_Student_CurrentParts" runat="server" AutoGenerateRows="False"
                                                          BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                                                          CellPadding="4" DataSourceID="SqlDataSource4" Font-Size="10pt" ForeColor="Black"
                                                          GridLines="Horizontal" Height="60px" Width="300px">
                                                          <FooterStyle BackColor="#CCCC99" />
                                                          <FieldHeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" Width="100px" />
                                                          <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                          <Fields>
                                                              <asp:BoundField DataField="a_year" HeaderText="a_year" SortExpression="a_year" Visible="False" />
                                                              <asp:BoundField DataField="tsss_id" HeaderText="TsssID" SortExpression="tsss_id" />
                                                              <asp:BoundField DataField="surname" HeaderText="Surname" SortExpression="surname" />
                                                              <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                                                              <asp:BoundField DataField="common_english" HeaderText="Common English" SortExpression="common_english" />
                                                              <asp:BoundField DataField="chinese_name" HeaderText="Chinese Name" SortExpression="chinese_name" />
                                                              <asp:BoundField DataField="class" HeaderText="Class" SortExpression="class" />
                                                              <asp:BoundField DataField="class_no" HeaderText="Class No" SortExpression="class_no" />
                                                              <asp:BoundField DataField="ct1" HeaderText="CT1" ReadOnly="True" SortExpression="ct1" />
                                                              <asp:BoundField DataField="ct2" HeaderText="CT2" ReadOnly="True" SortExpression="ct2" />
                                                          </Fields>
                                                          <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                          <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                          <AlternatingRowStyle BackColor="#F7F7DE" />
                                                      </asp:DetailsView>
                                                  </td>
                                                  <td valign="top">
                                                      &nbsp;&nbsp;
                                                  </td>
                                                  <td style="width: 3px" valign="top">
                                                      <asp:DetailsView ID="GridView_Student_CurrentParts_Right" runat="server" AutoGenerateRows="False"
                                                          BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                                                          CellPadding="4" DataSourceID="SqlDataSource4" Font-Size="10pt" ForeColor="Black"
                                                          GridLines="Horizontal" Height="60px" Width="300px">
                                                          <FooterStyle BackColor="#CCCC99" />
                                                          <RowStyle BackColor="White" />
                                                          <FieldHeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" Width="100px" />
                                                          <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                          <Fields>
                                                              <asp:BoundField DataField="tsss_id" HeaderText="tsss_id" SortExpression="tsss_id"
                                                                  Visible="False" />
                                                              <asp:BoundField DataField="tutor_code" HeaderText="Tutor" SortExpression="tutor_code" />
                                                              <asp:BoundField DataField="pre_tutor_code" HeaderText="Previous Tutor" SortExpression="pre_tutor_code" />
                                                              <asp:BoundField DataField="house" HeaderText="House" SortExpression="house" />
                                                              <asp:BoundField DataField="religion" HeaderText="Religion" SortExpression="religion" />
                                                              <asp:BoundField DataField="birth_date" HeaderText="Date of Birth" SortExpression="Date of Birth" DataFormatString="{0:dd/MM/yyyy}" />
                                                              <asp:BoundField DataField="TSSS_1st_day" DataFormatString="{0:dd/MM/yyyy}" HeaderText="1st Day in TSSS" ReadOnly="True" SortExpression="TSSS_1st_day" />
                                                              <asp:BoundField DataField="LeaveDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Leave Date" ReadOnly="True" SortExpression="LeaveDate" />
                                                              <asp:BoundField DataField="Leave_R" HeaderText="Leave Reason" ReadOnly="True" SortExpression="Leave_R" />
                                                          </Fields>
                                                          <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                          <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                          <AlternatingRowStyle BackColor="#F7F7DE" />
                                                      </asp:DetailsView>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td colspan="5" valign="top">
                                                      <asp:DetailsView ID="GridView_Student_CurrentParts_bottom1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource4" Font-Size="10pt" ForeColor="Black" GridLines="Horizontal" Height="60px" Width="764px">
                                                          <FooterStyle BackColor="#CCCC99" />
                                                          <RowStyle BackColor="White" />
                                                          <FieldHeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" Width="100px" />
                                                          <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                          <Fields>
                                                              <asp:BoundField DataField="tsss_id" HeaderText="tsss_id" SortExpression="tsss_id" Visible="False" />
                                                              <asp:BoundField DataField="HomeAddress" HeaderText="Home Address" SortExpression="HomeAddress" />
                                                              <asp:BoundField DataField="region" HeaderText="Region" SortExpression="region" />
                                                              <asp:BoundField DataField="area" HeaderText="Area" SortExpression="area" />
                                                          </Fields>
                                                          <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                          <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                          <AlternatingRowStyle BackColor="#F7F7DE" />
                                                      </asp:DetailsView>
                                                  </td>
                                              </tr>
                                          </table>
                              <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SIMSConnectionString %>"
                                  SelectCommand="webStudentCurrentInfo" SelectCommandType="StoredProcedure">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                                          <asp:Label ID="LabelEmpty1" runat="server" ForeColor="White" Text="<br />" Visible="False"></asp:Label><asp:Label ID="LabelPrevParts" runat="server" Font-Bold="True" Text="Previous Particulars"
                                  Width="200px" Visible="False"></asp:Label><br />
                              <asp:Label ID="LabelNoPP" runat="server" Font-Bold="True" ForeColor="Chocolate" Text=" - No Previous Particulars"
                                  Visible="False" Width="198px"></asp:Label><asp:GridView ID="GridView_Student_PrevParts" runat="server" BackColor="White"
                                  BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource5"
                                  ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="a_year,tsss_id" Font-Size="10pt" Visible="False">
                                      <FooterStyle BackColor="#CCCC99" />
                                      <Columns>
                                          <asp:BoundField DataField="a_year" HeaderText="Year" ReadOnly="True" SortExpression="a_year" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="tsss_id" HeaderText="TsssID" ReadOnly="True" SortExpression="tsss_id" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="surname" HeaderText="Surname" SortExpression="surname" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="common_english" HeaderText="Common English" SortExpression="common_english" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="chinese_name" HeaderText="Chinese Name" SortExpression="chinese_name" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="class" HeaderText="Class" SortExpression="class" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="class_no" HeaderText="Class No" SortExpression="class_no" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="ct1" HeaderText="CT1" SortExpression="ct1" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="ct2" HeaderText="CT2" SortExpression="ct2" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="tutor_code" HeaderText="Tutor" SortExpression="tutor_code" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="pre_tutor_code" HeaderText="Previous Tutor" SortExpression="pre_tutor_code" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="house" HeaderText="House" SortExpression="house" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="religion" HeaderText="Religion" SortExpression="religion" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="telephone" HeaderText="Tel No" SortExpression="telephone" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="mobile" HeaderText="Mobile" SortExpression="mobile" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                      </Columns>
                                      <RowStyle BackColor="#F7F7DE" />
                                      <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                      <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                      <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                      <AlternatingRowStyle BackColor="White" />
                                  </asp:GridView>
                              <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DataArchiveConnectionString %>"
                                  SelectCommand="webStudentOldParts" SelectCommandType="StoredProcedure">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                                          <asp:Label ID="LabelEmpty2" runat="server" ForeColor="White" Text="<br />" Visible="False"></asp:Label>
                                          <asp:Label ID="LabelEmpty3" runat="server" ForeColor="White" Text="<br />" Visible="False"></asp:Label>
                                          <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Main Contact Infomation"
                                              Width="200px"></asp:Label>
                              <asp:GridView ID="GridView_Student_CurrentParts5" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource19" Font-Bold="False" Font-Size="10pt" ForeColor="Black" GridLines="Vertical">
                                  <RowStyle BackColor="#F7F7DE" />
                                  <Columns>
                                      <asp:BoundField DataField="SMS_Prior" HeaderText="Phone" SortExpression="SMS_Prior" />
                                      <asp:BoundField DataField="Email_Prior" HeaderText="Email" SortExpression="Email_Prior"></asp:BoundField>
                                      <asp:BoundField DataField="Contact_Relation" HeaderText="Relationship" SortExpression="Contact_Relation"></asp:BoundField>
                                  </Columns>
                                  <FooterStyle BackColor="#CCCC99" />
                                  <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                  <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                  <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                  <AlternatingRowStyle BackColor="White" />
                              </asp:GridView>
                              <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:SIMSConnectionString %>" SelectCommand="SELECT SMS_Prior, Email_Prior, Contact_Relation FROM dbo.Student WHERE (tsss_id = @tsss_id)">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                              <br />
                              <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Other Contact Infomation" Width="200px"></asp:Label>
                              <br />
                                          <asp:Label ID="LabelNoCI" runat="server" Font-Bold="True"
                                                  ForeColor="Chocolate" Text=" - Not Avaliable, please click and check previous particulars." Visible="False"></asp:Label><asp:GridView ID="GridView_Student_CurrentParts2" runat="server" BackColor="White"
                                  BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource12"
                                  ForeColor="Black" GridLines="Vertical" Font-Bold="False" Font-Size="10pt" AutoGenerateColumns="False" DataKeyNames="tsss_id">
                                                      <RowStyle BackColor="#F7F7DE" />
                                                      <Columns>
                                                          <asp:BoundField DataField="tsss_id" HeaderText="tsss_id" ReadOnly="True" SortExpression="tsss_id" Visible="False" />
                                                          <asp:BoundField DataField="surname" HeaderText="Surname" SortExpression="surname">
                                                              <ItemStyle Width="75px" />
                                                              <HeaderStyle HorizontalAlign="Left" />
                                                          </asp:BoundField>
                                                          <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name">
                                                              <ItemStyle Width="150px" />
                                                              <HeaderStyle HorizontalAlign="Left" />
                                                          </asp:BoundField>
                                                          <asp:BoundField DataField="chinese_name" HeaderText="Chinese Name" SortExpression="chinese_name">
                                                              <ItemStyle Width="100px" />
                                                              <HeaderStyle HorizontalAlign="Left" />
                                                          </asp:BoundField>
                                                          <asp:BoundField DataField="tel" HeaderText="Tel No" SortExpression="tel" >
                                                              <ItemStyle Width="100px" />
                                                              <HeaderStyle HorizontalAlign="Left" />
                                                          </asp:BoundField>
                                                          <asp:BoundField DataField="mobile" HeaderText="Mobile" SortExpression="mobile" >
                                                              <ItemStyle Width="100px" />
                                                              <HeaderStyle HorizontalAlign="Left" />
                                                          </asp:BoundField>
                                                          <asp:TemplateField HeaderText="Email" SortExpression="email">
                                                              <EditItemTemplate>
                                                                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                                              </EditItemTemplate>
                                                              <ItemTemplate>
                                                                  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("email", "mailto:{0}") %>'
                                                                      Text='<%# Eval("email") %>'></asp:HyperLink>
                                                              </ItemTemplate>
                                                              <ItemStyle Width="200px" />
                                                              <HeaderStyle HorizontalAlign="Left" />
                                                          </asp:TemplateField>
                                                          <asp:BoundField DataField="remarks" HeaderText="Remarks" SortExpression="remarks">
                                                              <ItemStyle Width="150px" />
                                                              <HeaderStyle HorizontalAlign="Left" />
                                                          </asp:BoundField>
                                  </Columns>
                                  <FooterStyle BackColor="#CCCC99" />
                                  <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                  <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                  <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                  <AlternatingRowStyle BackColor="White" />
                              </asp:GridView>
                                          <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:SIMSConnectionString %>"
                                              SelectCommand="webStudentCurrentInfo2" SelectCommandType="StoredProcedure">
                                              <SelectParameters>
                                                  <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                              </SelectParameters>
                                          </asp:SqlDataSource>
                              <asp:GridView ID="GridView_Student_CurrentParts4" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="tsss_id" DataSourceID="SqlDataSource14" Font-Bold="False" Font-Size="10pt" ForeColor="Black" GridLines="Vertical" ShowHeader="False">
                                  <RowStyle BackColor="#F7F7DE" />
                                  <Columns>
                                      <asp:BoundField DataField="tsss_id" HeaderText="tsss_id" ReadOnly="True" SortExpression="tsss_id" Visible="False" />
                                      <asp:BoundField DataField="father_surname" HeaderText="surname" SortExpression="father_surname">
                                      <ItemStyle Width="75px" />
                                      </asp:BoundField>
                                      <asp:BoundField DataField="name" HeaderText="name" SortExpression="name">
                                      <ItemStyle Width="150px" />
                                      </asp:BoundField>
                                      <asp:BoundField DataField="chinese_name" HeaderText="chinese_name" SortExpression="chinese_name">
                                      <ItemStyle Width="100px" />
                                      </asp:BoundField>
                                      <asp:BoundField DataField="tel" HeaderText="tel" SortExpression="tel">
                                      <ItemStyle Width="100px" />
                                      </asp:BoundField>
                                      <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile">
                                      <ItemStyle Width="100px" />
                                      </asp:BoundField>
                                      <asp:TemplateField HeaderText="email" SortExpression="email">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("email", "mailto:{0}") %>' Text='<%# Eval("email") %>'></asp:HyperLink>
                                          </ItemTemplate>
                                          <ItemStyle Width="200px" />
                                      </asp:TemplateField>
                                      <asp:BoundField DataField="remarks" HeaderText="remarks" HtmlEncode="False" SortExpression="remarks">
                                      <ItemStyle Width="150px" />
                                      </asp:BoundField>
                                  </Columns>
                                  <FooterStyle BackColor="#CCCC99" />
                                  <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                  <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                  <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                  <AlternatingRowStyle BackColor="White" />
                              </asp:GridView>
                              <asp:GridView ID="GridView_Student_CurrentParts3" runat="server" BackColor="White"
                                  BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource13"
                                  ForeColor="Black" GridLines="Vertical" Font-Bold="False" Font-Size="10pt" AutoGenerateColumns="False" DataKeyNames="tsss_id" ShowHeader="False" >
                                              <RowStyle BackColor="#F7F7DE" />
                                              <Columns>
                                                  <asp:BoundField DataField="tsss_id" HeaderText="tsss_id" ReadOnly="True" SortExpression="tsss_id" Visible="False" />
                                                  <asp:BoundField DataField="mother_surname" HeaderText="surname" SortExpression="mother_surname" >
                                                      <ItemStyle Width="75px" />
                                                  </asp:BoundField>
                                                  <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" >
                                                      <ItemStyle Width="150px" />
                                                  </asp:BoundField>
                                                  <asp:BoundField DataField="chinese_name" HeaderText="chinese_name" SortExpression="chinese_name" >
                                                      <ItemStyle Width="100px" />
                                                  </asp:BoundField>
                                                  <asp:BoundField DataField="tel" HeaderText="tel" SortExpression="tel" >
                                                      <ItemStyle Width="100px" />
                                                  </asp:BoundField>
                                                  <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile" >
                                                      <ItemStyle Width="100px" />
                                                  </asp:BoundField>
                                                  <asp:TemplateField HeaderText="email" SortExpression="email">
                                                      <EditItemTemplate>
                                                          <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                                      </EditItemTemplate>
                                                      <ItemTemplate>
                                                          <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("email", "mailto:{0}") %>'
                                                              Text='<%# Eval("email") %>'></asp:HyperLink>
                                                      </ItemTemplate>
                                                      <ItemStyle Width="200px" />
                                                  </asp:TemplateField>
                                                  <asp:BoundField DataField="remarks" HeaderText="remarks" SortExpression="remarks" HtmlEncode="False">
                                                      <ItemStyle Width="150px" />
                                                  </asp:BoundField>
                                              </Columns>
                                              <FooterStyle BackColor="#CCCC99" />
                                              <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                              <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                              <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                              <AlternatingRowStyle BackColor="White" />
                                          </asp:GridView>
                                          <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:SIMSConnectionString %>"
                                              SelectCommand="webStudentCurrentInfo3" SelectCommandType="StoredProcedure">
                                              <SelectParameters>
                                                  <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                              </SelectParameters>
                                          </asp:SqlDataSource>
                                          <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:SIMSConnectionString %>"
                                              SelectCommand="webStudentCurrentInfo4" SelectCommandType="StoredProcedure">
                                              <SelectParameters>
                                                  <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                              </SelectParameters>
                                          </asp:SqlDataSource>
                                          &nbsp;&nbsp;
                                          <br />
                              <asp:Label ID="LabelStudentElect" runat="server" Font-Bold="True" Text="Current Elective Subjects" Width="300px"></asp:Label>
                              <asp:GridView ID="GridView_Student_Elect" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource16" Font-Size="10pt" ForeColor="Black" GridLines="Vertical">
                                  <EmptyDataTemplate>
                                      <asp:Label ID="LabelNoElect" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Chocolate" style="font-size: medium" Text=" - No Current Elective Subjects" Width="350px"></asp:Label>
                                  </EmptyDataTemplate>
                                  <FooterStyle BackColor="#CCCC99" />
                                  <Columns>
                                      <asp:BoundField DataField="tsss_id" HeaderText="tsss_id" SortExpression="tsss_id" Visible="False" />
                                      <asp:BoundField DataField="subject_name" HeaderText="Subject" SortExpression="subject_name" />
                                      <asp:BoundField DataField="grouping" HeaderText="grouping" SortExpression="grouping" Visible="False" />
                                  </Columns>
                                  <RowStyle BackColor="#F7F7DE" />
                                  <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                  <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                  <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                  <AlternatingRowStyle BackColor="White" />
                              </asp:GridView>
                              <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:SIMSConnectionString %>" SelectCommand="webStudentElectives" SelectCommandType="StoredProcedure">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                              <br />
                              <asp:Label ID="LabelStudentAFInfoA_Grade_Current" runat="server" Font-Bold="True" Text="Current Academic Records (from Report Card)"></asp:Label>
                              &nbsp;&nbsp;<asp:LinkButton ID="LBtnShowARPrevious" runat="server" OnClick="LBtnShowARPrevious_Click">show previous academic records also</asp:LinkButton>
                                          &nbsp;&nbsp;<asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True"
                                              Visible="False">
                                              <asp:ListItem Selected="True">ALL columns</asp:ListItem>
                                              <asp:ListItem>Running only</asp:ListItem>
                                              <asp:ListItem Value="Exam only"></asp:ListItem>
                                              <asp:ListItem Value="CW only"></asp:ListItem>
                                              <asp:ListItem>Exam + Running</asp:ListItem>
                                              <asp:ListItem>CW + Running</asp:ListItem>
                                          </asp:DropDownList><br />
                                          <asp:Label ID="LabelNoARG_Current" runat="server" Font-Bold="True" ForeColor="Chocolate"
                                              Text=" - No Current Academic Records" Visible="False" Width="267px"></asp:Label><asp:Label ID="LabelNoARG" runat="server" Font-Bold="True" ForeColor="Chocolate"
                                              Text=" - No Academic Records" Visible="False" Width="267px"></asp:Label><asp:GridView ID="GridView_Student_AFInfoA_Grade_Current" runat="server" BackColor="White"
                                  BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource15"
                                  ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Font-Size="10pt">
                                              <RowStyle BackColor="#F7F7DE" />
                                              <Columns>
                                                  <asp:BoundField DataField="a_year" HeaderText="Year" SortExpression="a_year" >
                                                      <HeaderStyle HorizontalAlign="Left" />
                                                  </asp:BoundField>
                                                  <asp:BoundField DataField="tsss_id" HeaderText="TsssID" SortExpression="tsss_id" >
                                                      <HeaderStyle HorizontalAlign="Left" />
                                                  </asp:BoundField>
                                                  <asp:BoundField DataField="subject_name" HeaderText="Subject" SortExpression="subject_name" >
                                                      <HeaderStyle HorizontalAlign="Left" />
                                                  </asp:BoundField>
                                                  <asp:BoundField DataField="q1_cw_grade" HeaderText="---" SortExpression="q1_cw_grade" >
                                                      <HeaderStyle HorizontalAlign="Left" />
                                                  </asp:BoundField>
                                                  <asp:BoundField DataField="q2_cw_grade" HeaderText="CW" SortExpression="q2_cw_grade" >
                                                      <HeaderStyle HorizontalAlign="Left" />
                                                  </asp:BoundField>
                                                  <asp:BoundField DataField="q2_exam_grade" HeaderText="Term1 Exam" SortExpression="q2_exam_grade" >
                                                      <HeaderStyle HorizontalAlign="Left" />
                                                  </asp:BoundField>
                                                  <asp:BoundField DataField="q3_cw_grade" HeaderText="---" SortExpression="q3_cw_grade" >
                                                      <HeaderStyle HorizontalAlign="Left" />
                                                  </asp:BoundField>
                                                  <asp:BoundField DataField="q4_cw_grade" HeaderText="CW" SortExpression="q4_cw_grade" >
                                                      <HeaderStyle HorizontalAlign="Left" />
                                                  </asp:BoundField>
                                                  <asp:BoundField DataField="q4_exam_grade" HeaderText="Final Exam" SortExpression="q4_exam_grade" >
                                                      <HeaderStyle HorizontalAlign="Left" />
                                                  </asp:BoundField>
                                                  <asp:BoundField DataField="running_grade" HeaderText="Running" SortExpression="running_grade" >
                                                      <HeaderStyle HorizontalAlign="Left" />
                                                  </asp:BoundField>
                                              </Columns>
                                              <FooterStyle BackColor="#CCCC99" />
                                              <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                              <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                              <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                              <AlternatingRowStyle BackColor="White" />
                                          </asp:GridView>
                                          <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:DataArchiveConnectionString %>"
                                              SelectCommand="webStudentAFInfoA_Grade_Current" SelectCommandType="StoredProcedure">
                                              <SelectParameters>
                                                  <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                              </SelectParameters>
                                          </asp:SqlDataSource>
                                          <asp:GridView ID="GridView_Student_AFInfoA_Grade" runat="server" BackColor="White"
                                  BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource7"
                                  ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Font-Size="10pt" Visible="False" AllowSorting="True">
    <RowStyle BackColor="#F7F7DE" />
                                          <Columns>
                                              <asp:BoundField DataField="a_year" HeaderText="Year" SortExpression="a_year" >
                                                  <HeaderStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="tsss_id" HeaderText="TsssID" SortExpression="tsss_id" >
                                                  <HeaderStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="subject_name" HeaderText="Subject" SortExpression="subject_name" >
                                                  <HeaderStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="q1_cw_grade" HeaderText="---" SortExpression="q1_cw_grade" >
                                                  <HeaderStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="q2_cw_grade" HeaderText="CW" SortExpression="q2_cw_grade" >
                                                  <HeaderStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="q2_exam_grade" HeaderText="Term1 Exam" SortExpression="q2_exam_grade" >
                                                  <HeaderStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="q3_cw_grade" HeaderText="---" SortExpression="q3_cw_grade" >
                                                  <HeaderStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="q4_cw_grade" HeaderText="CW" SortExpression="q4_cw_grade" >
                                                  <HeaderStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="q4_exam_grade" HeaderText="Final Exam" SortExpression="q4_exam_grade" >
                                                  <HeaderStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="running_grade" HeaderText="Running" SortExpression="running_grade" >
                                                  <HeaderStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                          </Columns><FooterStyle BackColor="#CCCC99" />
    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                          <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                          <AlternatingRowStyle BackColor="White" />
                                      </asp:GridView>
                              <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DataArchiveConnectionString %>"
                                  SelectCommand="webStudentAFInfoA_Grade" SelectCommandType="StoredProcedure">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                              <asp:Label ID="LabelStudentAFInfoA_Score" runat="server" Font-Bold="True" Text="Academic Records (Score)"
                                  Width="200px" Visible="False"></asp:Label><br />
                              <asp:Label ID="LabelNoARS" runat="server" Font-Bold="True" ForeColor="Chocolate"
                                  Text=" - No Academic Records (Score)" Visible="False" Width="267px"></asp:Label><asp:GridView ID="GridView_Student_AFInfoA_Score" runat="server" BackColor="White"
                                  BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource6"
                                  ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Font-Size="10pt" Visible="False">
                                      <FooterStyle BackColor="#CCCC99" />
                                      <Columns>
                                          <asp:BoundField DataField="a_year" HeaderText="a_year" SortExpression="a_year" />
                                          <asp:BoundField DataField="tsss_id" HeaderText="tsss_id" SortExpression="tsss_id" />
                                          <asp:BoundField DataField="subject_name" HeaderText="subject_name" SortExpression="subject_name" />
                                          <asp:BoundField DataField="q1_cw_score" HeaderText="q1_cw_score" ReadOnly="True"
                                              SortExpression="q1_cw_score" />
                                          <asp:BoundField DataField="q2_cw_score" HeaderText="q2_cw_score" ReadOnly="True"
                                              SortExpression="q2_cw_score" />
                                          <asp:BoundField DataField="q2_exam_score" HeaderText="q2_exam_score" ReadOnly="True"
                                              SortExpression="q2_exam_score" />
                                          <asp:BoundField DataField="q3_cw_score" HeaderText="q3_cw_score" ReadOnly="True"
                                              SortExpression="q3_cw_score" />
                                          <asp:BoundField DataField="q4_cw_score" HeaderText="q4_cw_score" ReadOnly="True"
                                              SortExpression="q4_cw_score" />
                                          <asp:BoundField DataField="q4_exam_score" HeaderText="q4_exam_score" ReadOnly="True"
                                              SortExpression="q4_exam_score" />
                                          <asp:BoundField DataField="running_score" HeaderText="running_score" ReadOnly="True"
                                              SortExpression="running_score" />
                                      </Columns>
                                      <RowStyle BackColor="#F7F7DE" />
                                      <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                      <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                      <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                      <AlternatingRowStyle BackColor="White" />
                                  </asp:GridView>
                              <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DataArchiveConnectionString %>"
                                  SelectCommand="webStudentAFInfoA_Score" SelectCommandType="StoredProcedure">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource><br />
                              <asp:Label ID="LabelCOLE" runat="server" Font-Bold="True" Text="Current CCA Records"></asp:Label>&nbsp;&nbsp;<asp:LinkButton ID="LBtnShowPOLE" runat="server" OnClick="LBtnShowPOLE_Click">show previous CCA Records</asp:LinkButton><br />
                              <asp:Label ID="LabelNoCOLE" runat="server" Font-Bold="True" ForeColor="Chocolate"
                                  Text=" - No Current CCA Records" Visible="False" Width="267px"></asp:Label><asp:GridView ID="GridView_Student_CurrentOLE" runat="server" BackColor="White"
                                  BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource8"
                                  ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Font-Size="10pt" DataKeyNames="tsss_id,code">
                                      <FooterStyle BackColor="#CCCC99" />
                                      <Columns>
                                          <asp:BoundField DataField="tsss_id" HeaderText="TsssID" ReadOnly="True" SortExpression="tsss_id" Visible="False" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="code" HeaderText="Code" ReadOnly="True" SortExpression="code" Visible="False" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="position/achievement" HeaderText="Position/Achievement"
                                              SortExpression="position/achievement" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="remarks" HeaderText="Remarks" SortExpression="remarks" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="organization" HeaderText="Organization" SortExpression="organization" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" >
                                              <HeaderStyle HorizontalAlign="Left" />
                                          </asp:BoundField>
                                      </Columns>
                                      <RowStyle BackColor="#F7F7DE" />
                                      <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                      <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                      <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                      <AlternatingRowStyle BackColor="White" />
                                  </asp:GridView>
                              <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:SIMSConnectionString %>"
                                  SelectCommand="webStudentCurrentOLE" SelectCommandType="StoredProcedure">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                                          <asp:Label ID="LabelEmpty4" runat="server" ForeColor="White" Text="<br />" Visible="False"></asp:Label><asp:Label ID="LabelPOLE" runat="server" Font-Bold="True" Text="Previous CCA Records"
                                              Width="200px"></asp:Label><br />
                                          <asp:Label ID="LabelNoPOLE" runat="server" Font-Bold="True" ForeColor="Chocolate"
                                              Text=" - No Previous CCA Records" Visible="False" Width="267px"></asp:Label><asp:GridView ID="GridView_Student_PreviousOLE" runat="server" BackColor="White"
                                  BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource9"
                                  ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Font-Size="10pt" DataKeyNames="a_year,tsss_id,club_code">
                                                  <FooterStyle BackColor="#CCCC99" />
                                                  <Columns>
                                                      <asp:BoundField DataField="a_year" HeaderText="Year" ReadOnly="True" SortExpression="a_year" >
                                                          <HeaderStyle HorizontalAlign="Left" />
                                                      </asp:BoundField>
                                                      <asp:BoundField DataField="tsss_id" HeaderText="TsssID" ReadOnly="True" SortExpression="tsss_id" Visible="False" >
                                                          <HeaderStyle HorizontalAlign="Left" />
                                                      </asp:BoundField>
                                                      <asp:BoundField DataField="club_code" HeaderText="Code" ReadOnly="True" SortExpression="club_code" Visible="False" >
                                                          <HeaderStyle HorizontalAlign="Left" />
                                                      </asp:BoundField>
                                                      <asp:BoundField DataField="club_name" HeaderText="Description" SortExpression="club_name" >
                                                          <HeaderStyle HorizontalAlign="Left" />
                                                      </asp:BoundField>
                                                      <asp:BoundField DataField="post" HeaderText="Position/Achievement" SortExpression="post" >
                                                          <HeaderStyle HorizontalAlign="Left" />
                                                      </asp:BoundField>
                                                      <asp:BoundField DataField="remark" HeaderText="Remarks" SortExpression="remark" >
                                                          <HeaderStyle HorizontalAlign="Left" />
                                                      </asp:BoundField>
                                                  </Columns>
                                                  <RowStyle BackColor="#F7F7DE" />
                                                  <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                  <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                  <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                  <AlternatingRowStyle BackColor="White" />
                                              </asp:GridView>
                                          <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:DataArchiveConnectionString %>"
                                  SelectCommand="SELECT [a_year], [tsss_id], [club_code], [club_name], [post], [remark] FROM [Student ECA Result] WHERE ([tsss_id] = @tsss_id) ORDER BY [a_year] DESC, [tsss_id], [pf_sub_category]">
                                              <SelectParameters>
                                                  <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                              </SelectParameters>
                                          </asp:SqlDataSource>
                                          <br />
                                          <br />
                                          <asp:Label ID="LabelAWE" runat="server" Font-Bold="True" Text="AWE Programme Records"
                                              Width="200px"></asp:Label><asp:GridView ID="GridView_Student_AWE" runat="server"
                                                  AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                                                  BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceAWE" Font-Size="10pt"
                                                  ForeColor="Black" GridLines="Vertical">
                                                  <RowStyle BackColor="#F7F7DE" />
                                                  <Columns>
                                                      <asp:BoundField DataField="a_year" HeaderText="Year" SortExpression="a_year" />
                                                      <asp:BoundField DataField="tsss_id" HeaderText="TsssID" SortExpression="tsss_id" Visible="False" />
                                                      <asp:BoundField DataField="AWE_name" HeaderText="Programme" SortExpression="AWE_name" />
                                                  </Columns>
                                                  <FooterStyle BackColor="#CCCC99" />
                                                  <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                  <EmptyDataTemplate>
                                                      <asp:Label ID="LabelNoAWE" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Chocolate"
                                                          Text=" - No AWE Programme Records" Width="267px"></asp:Label>
                                                  </EmptyDataTemplate>
                                                  <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                  <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                                  <AlternatingRowStyle BackColor="White" />
                                              </asp:GridView>
                                          <asp:SqlDataSource ID="SqlDataSourceAWE" runat="server" ConnectionString="<%$ ConnectionStrings:DataArchiveConnectionString %>"
                                              SelectCommand="webStudentAWE" SelectCommandType="StoredProcedure">
                                              <SelectParameters>
                                                  <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                              </SelectParameters>
                                          </asp:SqlDataSource>
                                          <asp:Label ID="LabelEmpty5" runat="server" ForeColor="White" Text="<br />" Visible="False"></asp:Label><br />
                                          <asp:Label ID="LabelPAO" runat="server" Font-Bold="True" Text="Performance/Awards Gained Outside School"
                                              Width="424px"></asp:Label><asp:GridView ID="GridViewPAO" runat="server" AutoGenerateColumns="False"
                                                  BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                                                  CellPadding="4" DataSourceID="SqlDataSourcePAO" Font-Size="10pt" ForeColor="Black"
                                                  GridLines="Vertical">
                                                  <RowStyle BackColor="#F7F7DE" />
                                                  <Columns>
                                                      <asp:BoundField DataField="tsss_id" HeaderText="TsssID" SortExpression="tsss_id" Visible="False" />
                                                      <asp:BoundField DataField="a_year" HeaderText="Year" SortExpression="a_year" />
                                                      <asp:TemplateField HeaderText="Programmes" SortExpression="PAO_name">
                                                          <EditItemTemplate>
                                                              <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PAO_name") %>'></asp:TextBox>
                                                          </EditItemTemplate>
                                                          <ItemTemplate>
                                                              <asp:Label ID="Label2" runat="server" Text='<%# ConvertToBR(Eval("PAO_name")) %>'></asp:Label>
                                                          </ItemTemplate>
                                                      </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Description" SortExpression="PAO_details">
                                                          <EditItemTemplate>
                                                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PAO_details") %>'></asp:TextBox>
                                                          </EditItemTemplate>
                                                          <ItemTemplate>
                                                              <asp:Label ID="Label1" runat="server" Text='<%# ConvertToBR(Eval("PAO_details")) %>'></asp:Label>
                                                          </ItemTemplate>
                                                      </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Role of Participation" SortExpression="PAO_role">
                                                          <EditItemTemplate>
                                                              <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PAO_role") %>'></asp:TextBox>
                                                          </EditItemTemplate>
                                                          <ItemTemplate>
                                                              <asp:Label ID="Label3" runat="server" Text='<%# ConvertToBR(Eval("PAO_role")) %>'></asp:Label>
                                                          </ItemTemplate>
                                                      </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Organisation" SortExpression="PAO_org">
                                                          <EditItemTemplate>
                                                              <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("PAO_org") %>'></asp:TextBox>
                                                          </EditItemTemplate>
                                                          <ItemTemplate>
                                                              <asp:Label ID="Label4" runat="server" Text='<%# ConvertToBR(Eval("PAO_org")) %>'></asp:Label>
                                                          </ItemTemplate>
                                                      </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Awards/Certs/Achievements" SortExpression="PAO_result">
                                                          <EditItemTemplate>
                                                              <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("PAO_result") %>'></asp:TextBox>
                                                          </EditItemTemplate>
                                                          <ItemTemplate>
                                                              <asp:Label ID="Label5" runat="server" Text='<%# ConvertToBR(Eval("PAO_result")) %>'></asp:Label>
                                                          </ItemTemplate>
                                                      </asp:TemplateField>
                                                  </Columns>
                                                  <FooterStyle BackColor="#CCCC99" />
                                                  <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                  <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                  <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                                  <AlternatingRowStyle BackColor="White" />
                                              </asp:GridView>
                                          <asp:SqlDataSource ID="SqlDataSourcePAO" runat="server" ConnectionString="<%$ ConnectionStrings:DataArchiveConnectionString %>"
                                              SelectCommand="SELECT [tsss_id], [a_year], [PAO_name], [PAO_details], [PAO_role], [PAO_org], [PAO_result] FROM [Student PAO Result] WHERE ([tsss_id] = @tsss_id) ORDER BY [autokey]">
                                              <SelectParameters>
                                                  <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                              </SelectParameters>
                                          </asp:SqlDataSource>
                                          <asp:Label ID="LabelEmpty6" runat="server" ForeColor="White" Text="<br />" Visible="False"></asp:Label>
                                          <asp:Label ID="LabelCAttend" runat="server" Font-Bold="True" Text="Current Attendance Records"
                                              Width="200px"></asp:Label><br />
                                          <asp:Label ID="LabelNoCAttend" runat="server" Font-Bold="True"
                                                  ForeColor="Chocolate" Text=" - No Current Attendance Records" Visible="False"
                                                  Width="267px"></asp:Label><asp:GridView ID="GridView_Student_CAttend" runat="server" BackColor="White"
                                  BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource10"
                                  ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Font-Size="10pt" >
                                                      <FooterStyle BackColor="#CCCC99" />
                                                      <RowStyle BackColor="#F7F7DE" />
                                                      <Columns>
                                                          <asp:BoundField DataField="Date" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Date" SortExpression="Date" >
                                                              <HeaderStyle HorizontalAlign="Left" />
                                                          </asp:BoundField>
                                                          <asp:BoundField DataField="Absent" HeaderText="Absent" SortExpression="Absent">
                                                              <ItemStyle HorizontalAlign="Center" />
                                                              <HeaderStyle HorizontalAlign="Left" />
                                                          </asp:BoundField>
                                                          <asp:BoundField DataField="HalfAbsent" HeaderText="HalfAbsent" SortExpression="HalfAbsent">
                                                              <ItemStyle HorizontalAlign="Center" />
                                                              <HeaderStyle HorizontalAlign="Left" />
                                                          </asp:BoundField>
                                                          <asp:BoundField DataField="EarlyLeave" HeaderText="EarlyLeave" SortExpression="EarlyLeave" Visible="False">
                                                              <ItemStyle HorizontalAlign="Center" />
                                                              <HeaderStyle HorizontalAlign="Left" />
                                                          </asp:BoundField>
                                                          <asp:BoundField DataField="Late" HeaderText="Late" SortExpression="Late">
                                                              <ItemStyle HorizontalAlign="Center" />
                                                              <HeaderStyle HorizontalAlign="Left" />
                                                          </asp:BoundField>
                                                          <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" >
                                                              <HeaderStyle HorizontalAlign="Left" />
                                                          </asp:BoundField>
                                                      </Columns>
                                                      <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                      <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                      <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                      <AlternatingRowStyle BackColor="White" />
                                                  </asp:GridView>
                                          <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:SIMSConnectionString %>"
                                  SelectCommand="SELECT [tsss_id], [Date], [Absent], [HalfAbsent], [EarlyLeave], [Late], [Remarks] FROM [Attendance] WHERE ([tsss_id] = @tsss_id) ORDER BY [Date]">
                                              <SelectParameters>
                                                  <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                              </SelectParameters>
                                          </asp:SqlDataSource>
                                          <br />
                                          <asp:GridView ID="GridView_Student_CAttendTotal" runat="server" BackColor="White"
                                  BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource11"
                                  ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Font-Size="10pt" >
                                              <FooterStyle BackColor="#CCCC99" />
                                              <RowStyle BackColor="#F7F7DE" />
                                              <Columns>
                                                  <asp:BoundField DataField="Absent_Total" HeaderText="Absent Total" SortExpression="Absent_Total">
                                                      <ItemStyle HorizontalAlign="Right" />
                                                      <HeaderStyle HorizontalAlign="Left" />
                                                  </asp:BoundField>
                                                  <asp:BoundField DataField="EarlyLeave_Total" HeaderText="EarlyLeave Total" SortExpression="EarlyLeave_Total" Visible="False">
                                                      <ItemStyle HorizontalAlign="Right" />
                                                      <HeaderStyle HorizontalAlign="Left" />
                                                  </asp:BoundField>
                                                  <asp:BoundField DataField="Late_Total" HeaderText="Late Total" SortExpression="Late_Total">
                                                      <ItemStyle HorizontalAlign="Right" />
                                                      <HeaderStyle HorizontalAlign="Left" />
                                                  </asp:BoundField>
                                              </Columns>
                                              <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                              <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                              <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                              <AlternatingRowStyle BackColor="White" />
                                                  </asp:GridView>
                                          <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:SIMSConnectionString %>"
                                  SelectCommand="SELECT tsss_id, SUM(CONVERT (INTEGER, Absent)) + (SUM(CONVERT (REAL, HalfAbsent))/2) AS Absent_Total, SUM(CONVERT (INTEGER, EarlyLeave)) AS EarlyLeave_Total, SUM(CONVERT (INTEGER, Late)) AS Late_Total FROM dbo.Attendance WHERE (tsss_id = @tsss_id) GROUP BY tsss_id">
                                              <SelectParameters>
                                                  <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                              </SelectParameters>
                                          </asp:SqlDataSource>
                              <br />
                              <asp:Label ID="LabelCDiscipline" runat="server" Font-Bold="True" Text="Current Discipline Records" Width="200px"></asp:Label>
                              <asp:GridView ID="GridViewDiscipline" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="8" DataSourceID="SqlDataSource17" Font-Size="10pt" ForeColor="Black" GridLines="Vertical">
                                  <RowStyle BackColor="#F7F7DE" />
                                  <Columns>
                                      <asp:BoundField DataField="tsss_id" HeaderText="tsss_id" SortExpression="tsss_id" Visible="False"></asp:BoundField>
                                      <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" Visible="False" />
                                      <asp:BoundField DataField="class_no" HeaderText="class_no" SortExpression="class_no" Visible="False"></asp:BoundField>
                                      <asp:BoundField DataField="disp" HeaderText="name" ReadOnly="True" SortExpression="disp" Visible="False"></asp:BoundField>
                                      <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category"></asp:BoundField>
                                      <asp:BoundField DataField="date_closed" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Date Closed" SortExpression="date_closed"></asp:BoundField>
                                      <asp:BoundField DataField="pic" HeaderText="PIC" SortExpression="pic"></asp:BoundField>
                                      <asp:BoundField DataField="minor" HeaderText="Minor Demerit" SortExpression="minor"></asp:BoundField>
                                      <asp:BoundField DataField="demerit" HeaderText="Demerit" SortExpression="demerit"></asp:BoundField>
                                      <asp:BoundField DataField="major" HeaderText="Major Demerit" SortExpression="major"></asp:BoundField>
                                      <asp:BoundField DataField="d_case_no" HeaderText="Case No." ReadOnly="True" SortExpression="d_case_no"></asp:BoundField>
                                      <asp:BoundField DataField="date_happened" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Date Happened" SortExpression="date_happened" />
                                      <asp:BoundField DataField="brief_desc" HeaderText="Description" SortExpression="brief_desc" />
                                      <asp:BoundField DataField="venue_happened" HeaderText="Venue Happened" SortExpression="venue_happened" />
                                  </Columns>
                                  <FooterStyle BackColor="#CCCC99" />
                                  <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                  <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                  <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                  <AlternatingRowStyle BackColor="White" />
                                  <EmptyDataTemplate>
                                      <asp:Label ID="LabelNoCP0" runat="server" Font-Bold="True" ForeColor="Chocolate" style="font-size: medium" Text=" - No Current Discipline Records" Width="250px"></asp:Label>
                                  </EmptyDataTemplate>
                              </asp:GridView>
                              <asp:SqlDataSource ID="SqlDataSource17" runat="server" ConnectionString="<%$ ConnectionStrings:SIMSConnectionString %>" SelectCommand="SELECT dbo.Student.tsss_id, dbo.Student.class, dbo.Student.class_no, dbo.Student.surname + N' ' + dbo.Student.name AS disp, dbo.Discipline_Case_Students.category, dbo.Discipline_Case_Students.date_closed, dbo.Discipline_Case_Students.pic, dbo.Discipline_Case_Students.minor, dbo.Discipline_Case_Students.demerit, dbo.Discipline_Case_Students.major, dbo.Discipline_Case.d_case_no, dbo.Discipline_Case.date_happened, dbo.Discipline_Case.brief_desc, dbo.Discipline_Case.venue_happened FROM dbo.Discipline_Case INNER JOIN dbo.Discipline_Case_Students ON dbo.Discipline_Case.d_case_no = dbo.Discipline_Case_Students.d_case_no INNER JOIN dbo.Student ON dbo.Discipline_Case_Students.tsss_id = dbo.Student.tsss_id WHERE (dbo.Student.tsss_id = @tsss_id) ORDER BY dbo.Student.class, dbo.Student.class_no, disp, dbo.Discipline_Case_Students.category">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                              <br />
                              <asp:Label ID="LabelCDCounselling" runat="server" Font-Bold="True" Text="Current Career Counselling Records" Width="281px"></asp:Label>
                              <strong><span style="font-size: 11pt">
                              <asp:GridView ID="GridViewNextComments" runat="server" AutoGenerateColumns="False" DataKeyNames="tsss_id" DataSourceID="SqlDataSource18" ShowHeader="False">
                                  <Columns>
                                      <asp:TemplateField HeaderText="c_comment_nextyear" SortExpression="c_comment_nextyear">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox6" runat="server" Height="55px" Rows="4" Text='<%# Bind("C_comment_nextyear") %>' TextMode="MultiLine" Width="425px"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:TextBox ID="TextBox7" runat="server" BackColor="LightYellow" ForeColor="Black" Height="55px" ReadOnly="True" Rows="4" Text='<%# Bind("C_comment_nextyear") %>' TextMode="MultiLine" Width="425px"></asp:TextBox>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:BoundField DataField="tsss_id" HeaderText="tsss_id" ReadOnly="True" SortExpression="tsss_id" Visible="False" />
                                  </Columns>
                              </asp:GridView>
                              <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConnectionString="<%$ ConnectionStrings:SIMSConnectionString %>" DeleteCommand="DELETE FROM [C_NextComments] WHERE [tsss_id] = @tsss_id" InsertCommand="INSERT INTO [C_NextComments] ([c_comment_nextyear], [tsss_id]) VALUES (@c_comment_nextyear, @tsss_id)" SelectCommand="SELECT [c_comment_nextyear], [tsss_id] FROM [C_NextComments] WHERE ([tsss_id] = @tsss_id)" UpdateCommand="UPDATE [C_NextComments] SET [c_comment_nextyear] = @c_comment_nextyear WHERE [tsss_id] = @tsss_id">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="TextBox1" Name="tsss_id" PropertyName="Text" Type="String" />
                                  </SelectParameters>
                                  <DeleteParameters>
                                      <asp:Parameter Name="tsss_id" Type="String" />
                                  </DeleteParameters>
                                  <UpdateParameters>
                                      <asp:Parameter Name="c_comment_nextyear" />
                                      <asp:Parameter Name="tsss_id" Type="String" />
                                  </UpdateParameters>
                                  <InsertParameters>
                                      <asp:Parameter Name="c_comment_nextyear" />
                                      <asp:Parameter Name="tsss_id" Type="String" />
                                  </InsertParameters>
                              </asp:SqlDataSource>
                              </span></strong>
                          </asp:Panel>
                          &nbsp;
                      </ContentTemplate>
                  </asp:UpdatePanel>
              </asp:Panel>
            <strong><br>
            </strong>
            <br>            </td>
        </tr>
    </table></td>
  </tr>
</table>    
        </div>
    </form>
</body>
</html>
