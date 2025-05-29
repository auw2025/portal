
Partial Class StudentRecord_V1
    Inherits System.Web.UI.Page

    Public ChartLabels As String = "['January', 'February', 'March', 'April', 'May', 'June', 'July', 'January', 'February', 'March', 'April', 'May', 'June', 'July']"
    Public ChartDataCWT1 As String = "[0.00, 10, 40.00, 60, 10.00, 80, 60, 0, 10, 40, 60, 10, 80, 60.00]"
    Public ChartDataCWT1AVG As String = "[28, 48, 40.50, 19, 40.00, 27, 40, 28, 48, 40, 19, 40, 27, 40.00]"
    Public ChartDataCWT2 As String = "[0, 10, 40, 60, 10, 80, 60, 0, 10, 40, 60, 100, 80, 60]"
    Public ChartDataCWT2AVG As String = "[28, 48, 40.75, 19, 40, 27, 40, 28, 48, 40, 19, 40, 27, 40]"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'If Request.Url.ToString = "https://www.tsss.edu.hk/sims_ex/StudentRecord.aspx" Then
        If Session("role") Is Nothing Then
            Response.Redirect("https://www.tsss.edu.hk/t.asp?msg=loginfail")
        Else
            setPageContent(checkUserRights())
        End If
        'Else
        'Session("role") = String.Empty
        'Session.Clear()
        'Session.Abandon()
        'Response.Redirect("https://www.tsss.edu.hk/t.asp?msg=loginfail")
        'End If
        loadCWGraphScript()
        'loadCWGraphScript2()
        'Me.LiteralCW2.Text = "['KKK', 'February', 'March', 'April', 'May', 'June', 'July', 'January', 'February', 'March', 'April', 'May', 'June', 'July']"

    End Sub

    Protected Function populateURLS(ByVal URLS As SortedList) As Boolean

        Dim d As Boolean = True
        Dim ds1 As New Data.DataSet
        Dim ds2 As New Data.DataSet
        ds1 = URLS.GetByIndex(0)
        ds2 = URLS.GetByIndex(1)
        Dim i As Integer = 0
        Do While (i < ds1.Tables(0).Rows.Count())
            If CStr(ds1.Tables(0).Rows(i).Item("web_function_id")) = "401" Then
                Me.LBtnViewStudent.Enabled = True
                d = False
            End If
            If CStr(ds1.Tables(0).Rows(i).Item("web_function_id")) = "402" Then
                Me.LBtnAddTutoring.Enabled = True
            End If
            If CStr(ds1.Tables(0).Rows(i).Item("web_function_id")) = "403" Then
                'Me.LBtnAddHomwork.Enabled = True
            End If
            If CStr(ds1.Tables(0).Rows(i).Item("web_function_id")) = "404" Then
                Me.LBtnAddCCA.Enabled = True
            End If
            i = i + 1
        Loop
        i = 0
        Do While (i < ds2.Tables(0).Rows.Count())
            If CStr(ds2.Tables(0).Rows(i).Item("web_function_id")) = "401" Then
                Me.LBtnViewStudent.Enabled = False
                d = True
            End If
            If CStr(ds2.Tables(0).Rows(i).Item("web_function_id")) = "402" Then
                Me.LBtnAddTutoring.Enabled = False
            End If
            If CStr(ds2.Tables(0).Rows(i).Item("web_function_id")) = "403" Then
                'Me.LBtnAddHomwork.Enabled = False
            End If
            If CStr(ds2.Tables(0).Rows(i).Item("web_function_id")) = "404" Then
                Me.LBtnAddCCA.Enabled = False
            End If
            i = i + 1
        Loop
        ds1.Dispose()
        ds2.Dispose()
        populateURLS = d

    End Function

    Protected Function checkUserRights() As Boolean

        Dim urole As String = Session("role")
        Dim denied As Boolean = True
        If urole = "ts" Then
            Dim mytsinfo As TeachingStaff = Session(urole)
            Me.LabelUserFullName.Text = mytsinfo.getTeacherFullName
            denied = populateURLS(mytsinfo.getListsOfUserRightsOnFunctions)
            mytsinfo = Nothing
        ElseIf urole = "nts" Then
            Dim myntsinfo As NonTeachingStaff = Session(urole)
            Me.LabelUserFullName.Text = myntsinfo.getNonTeacherFullName
            denied = populateURLS(myntsinfo.getListsOfUserRightsOnFunctions)
            myntsinfo = Nothing
        ElseIf urole = "s" Then
            's customization
        ElseIf urole = "p" Then
            'p customization
        End If
        checkUserRights = denied

    End Function

    Protected Sub setPageContent(ByVal function_denied As Boolean)

        'If function_denied Or Session(Session("role")).getUserName <> "ans" Then
        If function_denied Then
            Me.Panel1.Visible = False
            Me.LabelPR.Visible = True
        Else
            Session("tutor_code") = Session(Session("role")).getUserName
            Me.Panel1.Visible = True
            Me.LabelPR.Visible = False
            If Not Me.Page.IsPostBack Then
                If Not String.IsNullOrEmpty(Request.QueryString("pnb")) Then
                    Me.TextBox1.Text = Request.QueryString("pnb")
                    BtnViewStudentRecord_Click(Me.BtnViewStudentRecord, New EventArgs())
                End If
            End If
        End If



    End Sub

    Protected Sub LBtnLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBtnLogout.Click

        Response.Redirect("https://www.tsss.edu.hk/sims_ex/logout.aspx")

    End Sub

    Protected Sub LBtn01_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBtn01.Click

        Response.Redirect("https://www.tsss.edu.hk/sims_ex/Default.aspx")

    End Sub

    Protected Sub LBtnViewStudent_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBtnViewStudent.Click

        Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecord.aspx")

    End Sub

    Protected Sub BtnGet_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim sys_db As SysDB2 = New SysDB2
        Dim connstr As String
        Dim sqlstr As String
        connstr = sys_db.getKey(True)
        sqlstr = "SELECT tsss_id FROM Student WHERE a_year='" & Me.DropDownList1.SelectedValue & "' AND class='" & Me.DropDownList2.SelectedValue & "' AND class_no=" & Me.DropDownList3.SelectedValue
        Dim conn As Data.SqlClient.SqlConnection = New Data.SqlClient.SqlConnection(connstr)
        Dim comm As Data.SqlClient.SqlCommand = New Data.SqlClient.SqlCommand(sqlstr, conn)
        comm.CommandType = Data.CommandType.Text
        Dim da As Data.SqlClient.SqlDataAdapter = New Data.SqlClient.SqlDataAdapter(comm)
        Dim ds As Data.DataSet = New Data.DataSet("ds")
        da.Fill(ds)
        If CInt(ds.Tables(0).Rows.Count()) <> 1 Then
            Me.TextBox1.Text = "N/A"

            'If Session(Session("role")).getUserName = "kem" Or Session(Session("role")).getUserName = "dnl" Then
            'Me.LinkButton1.Visible = False
            'End If

        Else
            Me.TextBox1.Text = CStr(ds.Tables(0).Rows(0).Item("tsss_id"))

            'If Session(Session("role")).getUserName = "kem" Or Session(Session("role")).getUserName = "dnl" Then
            'Me.LinkButton1.Visible = True
            'End If

        End If
        ds.Dispose()
        da.Dispose()
        comm.Dispose()
        conn.Close()
        conn.Dispose()
        sys_db = Nothing
        Me.Panel2.Visible = False
        Me.BtnViewStudentRecord.Enabled = True

    End Sub

    Protected Sub BtnViewStudentRecord_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        'Page.ClientScript..RegisterStartupScript(Me.GetType(), "CallMyFunction", "DrawChart()", True)

        'If Session(Session("role")).getUserName = "kem" Or Session(Session("role")).getUserName = "dnl" Then
        Me.DropDownListKAA.Items.Clear()
        Me.DropDownListKAA.Items.Add("-- Select Year --")

        If Left(Me.TextBox1.Text, 2) = "24" Then
            Me.DropDownListKAA.Items.Add("24-25")
        ElseIf Left(Me.TextBox1.Text, 2) = "23" Then
            Me.DropDownListKAA.Items.Add("24-25")
            Me.DropDownListKAA.Items.Add("23-24")
        ElseIf Left(Me.TextBox1.Text, 2) = "22" Then
            Me.DropDownListKAA.Items.Add("24-25")
            Me.DropDownListKAA.Items.Add("23-24")
            Me.DropDownListKAA.Items.Add("22-23")
        ElseIf Left(Me.TextBox1.Text, 2) = "21" Then
            Me.DropDownListKAA.Items.Add("24-25")
            Me.DropDownListKAA.Items.Add("23-24")
            Me.DropDownListKAA.Items.Add("22-23")
            Me.DropDownListKAA.Items.Add("21-22")
        ElseIf Left(Me.TextBox1.Text, 2) = "20" Then
            Me.DropDownListKAA.Items.Add("24-25")
            Me.DropDownListKAA.Items.Add("23-24")
            Me.DropDownListKAA.Items.Add("22-23")
            Me.DropDownListKAA.Items.Add("21-22")
            Me.DropDownListKAA.Items.Add("20-21")
        ElseIf Left(Me.TextBox1.Text, 2) = "19" Then
            Me.DropDownListKAA.Items.Add("24-25")
            Me.DropDownListKAA.Items.Add("23-24")
            Me.DropDownListKAA.Items.Add("22-23")
            Me.DropDownListKAA.Items.Add("21-22")
            Me.DropDownListKAA.Items.Add("20-21")
            Me.DropDownListKAA.Items.Add("19-20")
        Else
            Me.DropDownListKAA.Items.Add("24-25")
            Me.DropDownListKAA.Items.Add("23-24")
            Me.DropDownListKAA.Items.Add("22-23")
            Me.DropDownListKAA.Items.Add("21-22")
            Me.DropDownListKAA.Items.Add("20-21")
            Me.DropDownListKAA.Items.Add("19-20")
            Me.DropDownListKAA.Items.Add("18-19")
        End If


        Me.DropDownListKAA0.Items.Clear()



        'Me.LabelYesterday1.Text = "(as of: " + DateTime.Today.AddDays(-1).ToString("dd/MM/yyyy") + ")"
        'Me.LabelYesterday2.Text = "(as of: " + DateTime.Today.AddDays(-1).ToString("dd/MM/yyyy") + ")"

        If Me.BtnViewStudentRecord.Text = "View this student" Then
            'System.Threading.Thread.Sleep(1000)
            If Me.TextBox1.Text = "N/A" Or Me.TextBox1.Text = "" Then
                Me.LabelWarning.Text = "Student not exist."
                Me.LabelWarning.Visible = True
                Me.BtnViewStudentRecord.Text = "View another student"
                Me.TextBox1.Enabled = False
                Me.LBtnGetTsssId.Enabled = False
                Me.Panel2.Visible = False
            Else
                Dim sys_db2 As SysDB = New SysDB
                Dim conn As Data.SqlClient.SqlConnection = New Data.SqlClient.SqlConnection(sys_db2.getKey(True))
                Dim comm As Data.SqlClient.SqlCommand = New Data.SqlClient.SqlCommand("webStudentCurrentInfo", conn)
                comm.CommandType = Data.CommandType.StoredProcedure
                Dim parameter_tsssidselected As Data.SqlClient.SqlParameter = New Data.SqlClient.SqlParameter("@tsss_id", Data.SqlDbType.NVarChar, 15)
                parameter_tsssidselected.Value = Me.TextBox1.Text
                comm.Parameters.Add(parameter_tsssidselected)
                Dim da1 As Data.SqlClient.SqlDataAdapter = New Data.SqlClient.SqlDataAdapter(comm)
                Dim ds1 As Data.DataSet = New Data.DataSet("ds1")
                da1.Fill(ds1)
                If CInt(ds1.Tables(0).Rows.Count()) <> 1 Then
                    Dim sys_db As SysDB2 = New SysDB2
                    comm.Connection.ConnectionString = sys_db.getKey(True)
                    comm.CommandText = "SELECT tsss_id FROM Student WHERE tsss_id='" & Me.TextBox1.Text & "'"
                    comm.CommandType = Data.CommandType.Text
                    Dim da0 As Data.SqlClient.SqlDataAdapter = New Data.SqlClient.SqlDataAdapter(comm)
                    Dim ds0 As Data.DataSet = New Data.DataSet("ds0")
                    da0.Fill(ds0)
                    If CInt(ds0.Tables(0).Rows.Count()) = 0 Then
                        Me.LabelWarning.Text = "Student not exist."
                        Me.LabelWarning.Visible = True
                        Me.BtnViewStudentRecord.Text = "View another student"
                        Me.TextBox1.Enabled = False
                        Me.LBtnGetTsssId.Enabled = False
                        Me.Panel2.Visible = False
                    Else
                        comm.Connection.ConnectionString = sys_db2.getKey(True)
                        comm.CommandText = "SELECT * FROM web_view_oldboys_profile WHERE tutor_code='" + Session("tutor_code") + "'"
                        comm.CommandType = Data.CommandType.Text
                        Dim da2 As Data.SqlClient.SqlDataAdapter = New Data.SqlClient.SqlDataAdapter(comm)
                        Dim ds2 As Data.DataSet = New Data.DataSet("ds2")
                        da2.Fill(ds2)
                        If CInt(ds2.Tables(0).Rows.Count()) = 1 Then
                            Me.Image1.Visible = True
                            'If System.IO.File.Exists("D:\Inetpub\wwwroot\sims_ex\studentprofilepic\" + Me.TextBox1.Text + ".jpg") Then
                            If System.IO.File.Exists("D:\Inetpub\wwwroot\sims_ex\uploaded_files\studentprofilepic\" + Me.TextBox1.Text + ".jpg") Then
                                'Me.Image1.ImageUrl = "studentprofilepic/" + Me.TextBox1.Text + ".jpg"
                                Me.Image1.ImageUrl = "https://www.tsss.edu.hk/sims_ex/0xE8e1h5ks7g2.aspx?floc=studentprofilepic\" + Me.TextBox1.Text + ".jpg"
                            Else
                                Me.Image1.ImageUrl = "studentprofilepic/nophoto.jpg"
                            End If
                            'Me.GridView_Student_PrevParts0.DataBind()
                            'Me.GridView_Student_PrevParts1.DataBind()
                            'Me.GridView_Student_PrevParts2.DataBind()
                            'Me.GridView_Student_PrevParts2.Visible = False
                            'Me.LabelCWbreakdown.Text = ""

                            'CheckCW()

                            Me.GridView_Student_CurrentParts_Right.DataBind()
                            Me.GridView_Student_CurrentParts.DataBind() '***
                            If Me.GridView_Student_CurrentParts.Rows.Count = 0 Then '***
                                Me.LabelNoCP.Visible = True '***
                            End If '***
                            Me.GridView_Student_CurrentParts2.DataBind() '***
                            If Me.GridView_Student_CurrentParts2.Rows.Count = 0 Then '***
                                Me.LabelNoCI.Visible = True '***
                            End If '***
                            Me.GridView_Student_CurrentParts3.DataBind() '***
                            If Me.GridView_Student_CurrentParts3.Rows.Count = 0 Then '***
                                Me.LabelNoCI.Visible = True '***
                            End If '***
                            Me.GridView_Student_CurrentParts4.DataBind() '***
                            If Me.GridView_Student_CurrentParts4.Rows.Count = 0 Then '***
                                Me.LabelNoCI.Visible = True '***
                            End If '***
                            If Me.LBtnShowPP.Text = "hide previous particulars" Then
                                Me.LabelEmpty1.Visible = True
                                Me.LabelEmpty2.Visible = True
                                Me.LabelEmpty3.Visible = True
                                Me.GridView_Student_PrevParts.DataBind() '***
                                If Me.GridView_Student_PrevParts.Rows.Count = 0 Then '***
                                    Me.LabelPrevParts.Visible = True
                                    Me.LabelNoPP.Visible = True '***
                                    Me.GridView_Student_PrevParts.Visible = False
                                Else
                                    Me.LabelPrevParts.Visible = True
                                    Me.GridView_Student_PrevParts.Visible = True
                                    Me.LabelNoPP.Visible = False '***
                                End If '***
                            Else
                                Me.LabelEmpty1.Visible = False
                                Me.LabelEmpty2.Visible = False
                                Me.LabelEmpty3.Visible = False
                                Me.LabelPrevParts.Visible = False
                                Me.LabelNoPP.Visible = False
                                Me.GridView_Student_PrevParts.Visible = False
                            End If
                            Me.GridView_Student_AWE.DataBind()
                            Me.GridView_Student_Elect.DataBind()
                            'Me.GridView_Student_AFInfoA_Score.DataBind() '***
                            'If Me.GridView_Student_AFInfoA_Score.Rows.Count = 0 Then '***
                            'Me.LabelNoARS.Visible = True '***
                            'End If '***
                            If Me.LBtnShowARPrevious.Text = "hide previous academic records" Then
                                Me.LabelStudentAFInfoA_Grade_Current.Text = "Current and Previous Academic Records (from Report Card)"
                                Me.LabelNoARG_Current.Visible = False
                                Me.GridView_Student_AFInfoA_Grade_Current.Visible = False
                                Me.GridView_Student_AFInfoA_Grade.DataBind() '***
                                If Me.GridView_Student_AFInfoA_Grade.Rows.Count = 0 Then '***
                                    Me.LabelNoARG.Visible = True '***
                                    Me.GridView_Student_AFInfoA_Grade.Visible = False
                                Else
                                    Me.GridView_Student_AFInfoA_Grade.Visible = True
                                    Me.LabelNoARG.Visible = False '***
                                End If '***
                            Else
                                Me.LabelStudentAFInfoA_Grade_Current.Text = "Current Academic Records (from Report Card)"
                                Me.LabelNoARG.Visible = False
                                Me.GridView_Student_AFInfoA_Grade.Visible = False
                                Me.GridView_Student_AFInfoA_Grade_Current.DataBind() '***
                                If Me.GridView_Student_AFInfoA_Grade_Current.Rows.Count = 0 Then '***
                                    Me.LabelNoARG_Current.Visible = True '***
                                    Me.GridView_Student_AFInfoA_Grade_Current.Visible = False
                                Else
                                    Me.GridView_Student_AFInfoA_Grade_Current.Visible = True
                                    Me.LabelNoARG_Current.Visible = False '***
                                End If '***
                            End If
                            Me.GridView_Student_CurrentOLE.DataBind() '***
                            If Me.GridView_Student_CurrentOLE.Rows.Count = 0 Then '***
                                Me.LabelNoCOLE.Visible = True '***
                            End If '***
                            If Me.LBtnShowPOLE.Text = "hide previous CCA Records" Then
                                Me.LabelEmpty4.Visible = True
                                Me.LabelEmpty5.Visible = True
                                Me.LabelEmpty6.Visible = True
                                Me.GridView_Student_PreviousOLE.DataBind() '***
                                If Me.GridView_Student_PreviousOLE.Rows.Count = 0 Then '***
                                    Me.LabelPOLE.Visible = True
                                    Me.LabelNoPOLE.Visible = True '***
                                    Me.GridView_Student_PreviousOLE.Visible = False
                                Else
                                    Me.LabelPOLE.Visible = True
                                    Me.GridView_Student_PreviousOLE.Visible = True
                                    Me.LabelNoPOLE.Visible = False '***
                                End If '***
                            Else
                                Me.LabelEmpty4.Visible = False
                                Me.LabelEmpty5.Visible = False
                                Me.LabelEmpty6.Visible = False
                                Me.LabelPOLE.Visible = False
                                Me.LabelNoPOLE.Visible = False
                                Me.GridView_Student_PreviousOLE.Visible = False
                            End If
                            Me.GridViewPAO.DataBind() '***
                            Me.GridView_Student_CAttend.DataBind() '***
                            If Me.GridView_Student_CAttend.Rows.Count = 0 Then '***
                                Me.LabelNoCAttend.Visible = True '***
                            End If '***
                            Me.GridView_Student_CAttendTotal.DataBind() '***
                            Me.GridViewDiscipline.DataBind()
                            Me.GridViewNextComments.DataBind()
                            Me.Panel3.Visible = True
                            Me.BtnViewStudentRecord.Text = "View another student"
                            Me.TextBox1.Enabled = False
                            Me.LBtnGetTsssId.Enabled = False
                            Me.Panel2.Visible = False
                        Else
                            Me.LabelWarning.Text = "You have no right to view the information of old boy"
                            Me.LabelWarning.Visible = True
                            Me.BtnViewStudentRecord.Text = "View another student"
                            Me.TextBox1.Enabled = False
                            Me.LBtnGetTsssId.Enabled = False
                            Me.Panel2.Visible = False
                        End If
                        ds2.Dispose()
                        da2.Dispose()
                    End If
                    ds0.Dispose()
                    da0.Dispose()
                    sys_db = Nothing
                Else
                    Dim class_s As String = CStr(ds1.Tables(0).Rows(0).Item("class"))
                    Dim class_no_s As String = CStr(ds1.Tables(0).Rows(0).Item("class_no"))
                    Dim ct1_s As String = CStr(ds1.Tables(0).Rows(0).Item("ct1"))
                    Dim ct2_s As String = CStr(ds1.Tables(0).Rows(0).Item("ct2"))
                    Dim pt_s As String = CStr(ds1.Tables(0).Rows(0).Item("tutor_code"))

                    Session("StudentClass") = class_s
                    Session("StudentClassNo") = class_no_s
                    Session("tsss_id") = Me.TextBox1.Text

                    Me.DropDownListKAA0.Items.Add("-- Select Year --")

                    'Current year Report Card


                    If Left(Session("StudentClass"), 1) = "6" Then
                        'Me.DropDownListKAA0.Items.Add("23-24 Mock")

                    Else

                        'Me.DropDownListKAA0.Items.Add("23-24 Term 1")
                        'Me.DropDownListKAA0.Items.Add("23-24 Year End")

                    End If

                    'Previous year Report Card

                    If Left(Me.TextBox1.Text, 2) = "24" Then
                        'Me.DropDownListKAA0.Items.Add("23-24 Year End")
                        'Me.DropDownListKAA0.Items.Add("23-24 Term 1")
                    ElseIf Left(Me.TextBox1.Text, 2) = "23" Then
                        Me.DropDownListKAA0.Items.Add("23-24 Year End")
                        Me.DropDownListKAA0.Items.Add("23-24 Term 1")
                    ElseIf Left(Me.TextBox1.Text, 2) = "22" Then
                        Me.DropDownListKAA0.Items.Add("23-24 Year End")
                        Me.DropDownListKAA0.Items.Add("23-24 Term 1")
                        Me.DropDownListKAA0.Items.Add("22-23 Year End")
                        Me.DropDownListKAA0.Items.Add("22-23 Term 1")
                    ElseIf Left(Me.TextBox1.Text, 2) = "21" Then
                        Me.DropDownListKAA0.Items.Add("23-24 Year End")
                        Me.DropDownListKAA0.Items.Add("23-24 Term 1")
                        Me.DropDownListKAA0.Items.Add("22-23 Year End")
                        Me.DropDownListKAA0.Items.Add("22-23 Term 1")
                        Me.DropDownListKAA0.Items.Add("21-22 Year End")
                        Me.DropDownListKAA0.Items.Add("21-22 Term 1")
                    ElseIf Left(Me.TextBox1.Text, 2) = "20" Then
                        Me.DropDownListKAA0.Items.Add("23-24 Year End")
                        Me.DropDownListKAA0.Items.Add("23-24 Term 1")
                        Me.DropDownListKAA0.Items.Add("22-23 Year End")
                        Me.DropDownListKAA0.Items.Add("22-23 Term 1")
                        Me.DropDownListKAA0.Items.Add("22-23 Year End")
                        Me.DropDownListKAA0.Items.Add("21-22 Year End")
                        Me.DropDownListKAA0.Items.Add("21-22 Term 1")
                        Me.DropDownListKAA0.Items.Add("20-21 Year End")
                        Me.DropDownListKAA0.Items.Add("20-21 Term 1")
                    ElseIf Left(Me.TextBox1.Text, 2) = "19" Then
                        Me.DropDownListKAA0.Items.Add("23-24 Year End")
                        Me.DropDownListKAA0.Items.Add("23-24 Term 1")
                        Me.DropDownListKAA0.Items.Add("22-23 Year End")
                        Me.DropDownListKAA0.Items.Add("22-23 Term 1")
                        Me.DropDownListKAA0.Items.Add("21-22 Year End")
                        Me.DropDownListKAA0.Items.Add("21-22 Term 1")
                        Me.DropDownListKAA0.Items.Add("20-21 Year End")
                        Me.DropDownListKAA0.Items.Add("20-21 Term 1")
                        Me.DropDownListKAA0.Items.Add("19-20 Year End")
                        Me.DropDownListKAA0.Items.Add("19-20 Term 1")
                    Else
                        Me.DropDownListKAA0.Items.Add("23-24 Year End")
                        Me.DropDownListKAA0.Items.Add("23-24 Term 1")
                        Me.DropDownListKAA0.Items.Add("22-23 Year End")
                        Me.DropDownListKAA0.Items.Add("22-23 Term 1")
                        Me.DropDownListKAA0.Items.Add("21-22 Year End")
                        Me.DropDownListKAA0.Items.Add("21-22 Term 1")
                        Me.DropDownListKAA0.Items.Add("20-21 Year End")
                        Me.DropDownListKAA0.Items.Add("20-21 Term 1")
                        Me.DropDownListKAA0.Items.Add("19-20 Year End")
                        Me.DropDownListKAA0.Items.Add("19-20 Term 1")
                    End If

                    'If Left(Session("StudentClass"), 1) = "5" Or Left(Session("StudentClass"), 1) = "2" Or Left(Session("StudentClass"), 1) = "3" Or Left(Session("StudentClass"), 1) = "1" Or Left(Session("StudentClass"), 1) = "4" Then
                    'Me.LinkButtonTTPM.Visible = True
                    'Else

                    'Me.LinkButtonTTPM.Visible = False
                    'End If

                    If Session("tutor_code").ToLower = ct1_s.ToLower Or Session("tutor_code").ToLower = ct2_s.ToLower Or Session("tutor_code").ToLower = pt_s.ToLower Or Session("tutor_code").ToUpper = ct1_s.ToUpper Or Session("tutor_code").ToUpper = ct2_s.ToUpper Or Session("tutor_code").ToUpper = pt_s.ToUpper Then
                        Me.Image1.Visible = True
                        'If System.IO.File.Exists("D:\Inetpub\wwwroot\sims_ex\studentprofilepic\" + Me.TextBox1.Text + ".jpg") Then
                        If System.IO.File.Exists("D:\Inetpub\wwwroot\sims_ex\uploaded_files\studentprofilepic\" + Me.TextBox1.Text + ".jpg") Then
                            'Me.Image1.ImageUrl = "studentprofilepic/" + Me.TextBox1.Text + ".jpg"
                            Me.Image1.ImageUrl = "https://www.tsss.edu.hk/sims_ex/0xE8e1h5ks7g2.aspx?floc=studentprofilepic\" + Me.TextBox1.Text + ".jpg"
                        Else
                            Me.Image1.ImageUrl = "studentprofilepic/nophoto.jpg"
                        End If
                        'Me.GridView_Student_PrevParts0.DataBind()
                        'Me.GridView_Student_PrevParts1.DataBind()
                        'Me.GridView_Student_PrevParts2.DataBind()
                        'Me.GridView_Student_PrevParts2.Visible = False
                        'Me.LabelCWbreakdown.Text = ""


                        'CheckCW()

                        Me.GridView_Student_CurrentParts_Right.DataBind()
                        Me.GridView_Student_CurrentParts.DataBind() '***
                        If Me.GridView_Student_CurrentParts.Rows.Count = 0 Then '***
                            Me.LabelNoCP.Visible = True '***
                        End If '***
                        Me.GridView_Student_CurrentParts2.DataBind() '***
                        If Me.GridView_Student_CurrentParts2.Rows.Count = 0 Then '***
                            Me.LabelNoCI.Visible = True '***
                        End If '***
                        Me.GridView_Student_CurrentParts3.DataBind() '***
                        If Me.GridView_Student_CurrentParts3.Rows.Count = 0 Then '***
                            Me.LabelNoCI.Visible = True '***
                        End If '***
                        Me.GridView_Student_CurrentParts4.DataBind() '***
                        If Me.GridView_Student_CurrentParts4.Rows.Count = 0 Then '***
                            Me.LabelNoCI.Visible = True '***
                        End If '***
                        If Me.LBtnShowPP.Text = "hide previous particulars" Then
                            Me.LabelEmpty1.Visible = True
                            Me.LabelEmpty2.Visible = True
                            Me.LabelEmpty3.Visible = True
                            Me.GridView_Student_PrevParts.DataBind() '***
                            If Me.GridView_Student_PrevParts.Rows.Count = 0 Then '***
                                Me.LabelPrevParts.Visible = True
                                Me.LabelNoPP.Visible = True '***
                                Me.GridView_Student_PrevParts.Visible = False
                            Else
                                Me.LabelPrevParts.Visible = True
                                Me.GridView_Student_PrevParts.Visible = True
                                Me.LabelNoPP.Visible = False '***
                            End If '***
                        Else
                            Me.LabelEmpty1.Visible = False
                            Me.LabelEmpty2.Visible = False
                            Me.LabelEmpty3.Visible = False
                            Me.LabelPrevParts.Visible = False
                            Me.LabelNoPP.Visible = False
                            Me.GridView_Student_PrevParts.Visible = False
                        End If
                        Me.GridView_Student_AWE.DataBind()
                        Me.GridView_Student_Elect.DataBind()
                        'Me.GridView_Student_AFInfoA_Score.DataBind() '***
                        'If Me.GridView_Student_AFInfoA_Score.Rows.Count = 0 Then '***
                        'Me.LabelNoARS.Visible = True '***
                        'End If '***
                        If Me.LBtnShowARPrevious.Text = "hide previous academic records" Then
                            Me.LabelStudentAFInfoA_Grade_Current.Text = "Current and Previous Academic Records (from Report Card)"
                            Me.LabelNoARG_Current.Visible = False
                            Me.GridView_Student_AFInfoA_Grade_Current.Visible = False
                            Me.GridView_Student_AFInfoA_Grade.DataBind() '***
                            If Me.GridView_Student_AFInfoA_Grade.Rows.Count = 0 Then '***
                                Me.LabelNoARG.Visible = True '***
                                Me.GridView_Student_AFInfoA_Grade.Visible = False
                            Else
                                Me.GridView_Student_AFInfoA_Grade.Visible = True
                                Me.LabelNoARG.Visible = False '***
                            End If '***
                        Else
                            Me.LabelStudentAFInfoA_Grade_Current.Text = "Current Academic Records (from Report Card)"
                            Me.LabelNoARG.Visible = False
                            Me.GridView_Student_AFInfoA_Grade.Visible = False
                            Me.GridView_Student_AFInfoA_Grade_Current.DataBind() '***
                            If Me.GridView_Student_AFInfoA_Grade_Current.Rows.Count = 0 Then '***
                                Me.LabelNoARG_Current.Visible = True '***
                                Me.GridView_Student_AFInfoA_Grade_Current.Visible = False
                            Else
                                Me.GridView_Student_AFInfoA_Grade_Current.Visible = True
                                Me.LabelNoARG_Current.Visible = False '***
                            End If '***
                        End If
                        Me.GridView_Student_CurrentOLE.DataBind() '***
                        If Me.GridView_Student_CurrentOLE.Rows.Count = 0 Then '***
                            Me.LabelNoCOLE.Visible = True '***
                        End If '***
                        If Me.LBtnShowPOLE.Text = "hide previous CCA Records" Then
                            Me.LabelEmpty4.Visible = True
                            Me.LabelEmpty5.Visible = True
                            Me.LabelEmpty6.Visible = True
                            Me.GridView_Student_PreviousOLE.DataBind() '***
                            If Me.GridView_Student_PreviousOLE.Rows.Count = 0 Then '***
                                Me.LabelPOLE.Visible = True
                                Me.LabelNoPOLE.Visible = True '***
                                Me.GridView_Student_PreviousOLE.Visible = False
                            Else
                                Me.LabelPOLE.Visible = True
                                Me.GridView_Student_PreviousOLE.Visible = True
                                Me.LabelNoPOLE.Visible = False '***
                            End If '***
                        Else
                            Me.LabelEmpty4.Visible = False
                            Me.LabelEmpty5.Visible = False
                            Me.LabelEmpty6.Visible = False
                            Me.LabelPOLE.Visible = False
                            Me.LabelNoPOLE.Visible = False
                            Me.GridView_Student_PreviousOLE.Visible = False
                        End If
                        Me.GridViewPAO.DataBind() '***
                        Me.GridView_Student_CAttend.DataBind() '***
                        If Me.GridView_Student_CAttend.Rows.Count = 0 Then '***
                            Me.LabelNoCAttend.Visible = True '***
                        End If '***
                        Me.GridView_Student_CAttendTotal.DataBind() '***
                        Me.GridViewDiscipline.DataBind()
                        Me.GridViewNextComments.DataBind()
                        Me.Panel3.Visible = True
                        Me.BtnViewStudentRecord.Text = "View another student"
                        Me.TextBox1.Enabled = False
                        Me.LBtnGetTsssId.Enabled = False
                        Me.Panel2.Visible = False
                    Else
                        Me.LabelWarning.Text = "You can only view the information of your personal tutees and students of your class."
                        Me.LabelWarning.Visible = True
                        Me.BtnViewStudentRecord.Text = "View another student"
                        Me.TextBox1.Enabled = False
                        Me.LBtnGetTsssId.Enabled = False
                        Me.Panel2.Visible = False
                        Dim i As Integer
                        comm.CommandText = "SELECT * FROM web_view_students_profile WHERE tutor_code='" + Session("tutor_code") + "'"
                        comm.CommandType = Data.CommandType.Text
                        Dim da3 As Data.SqlClient.SqlDataAdapter = New Data.SqlClient.SqlDataAdapter(comm)
                        Dim ds3 As Data.DataSet = New Data.DataSet("ds3")
                        da3.Fill(ds3)
                        For i = 0 To CInt(ds3.Tables(0).Rows.Count()) - 1
                            If class_s.ToLower = CStr(ds3.Tables(0).Rows(i).Item("class")) Then
                                Me.Image1.Visible = True
                                'If System.IO.File.Exists("D:\Inetpub\wwwroot\sims_ex\studentprofilepic\" + Me.TextBox1.Text + ".jpg") Then
                                If System.IO.File.Exists("D:\Inetpub\wwwroot\sims_ex\uploaded_files\studentprofilepic\" + Me.TextBox1.Text + ".jpg") Then
                                    'Me.Image1.ImageUrl = "studentprofilepic/" + Me.TextBox1.Text + ".jpg"
                                    Me.Image1.ImageUrl = "https://www.tsss.edu.hk/sims_ex/0xE8e1h5ks7g2.aspx?floc=studentprofilepic\" + Me.TextBox1.Text + ".jpg"
                                Else
                                    Me.Image1.ImageUrl = "studentprofilepic/nophoto.jpg"
                                End If
                                'Me.GridView_Student_PrevParts0.DataBind()
                                'Me.GridView_Student_PrevParts1.DataBind()
                                'Me.GridView_Student_PrevParts2.DataBind()
                                'Me.GridView_Student_PrevParts2.Visible = False
                                'Me.LabelCWbreakdown.Text = ""


                                'CheckCW()

                                Me.GridView_Student_CurrentParts_Right.DataBind()
                                Me.GridView_Student_CurrentParts.DataBind() '***
                                If Me.GridView_Student_CurrentParts.Rows.Count = 0 Then '***
                                    Me.LabelNoCP.Visible = True '***
                                End If '***
                                Me.GridView_Student_CurrentParts2.DataBind() '***
                                If Me.GridView_Student_CurrentParts2.Rows.Count = 0 Then '***
                                    Me.LabelNoCI.Visible = True '***
                                End If '***
                                Me.GridView_Student_CurrentParts3.DataBind() '***
                                If Me.GridView_Student_CurrentParts3.Rows.Count = 0 Then '***
                                    Me.LabelNoCI.Visible = True '***
                                End If '***
                                Me.GridView_Student_CurrentParts4.DataBind() '***
                                If Me.GridView_Student_CurrentParts4.Rows.Count = 0 Then '***
                                    Me.LabelNoCI.Visible = True '***
                                End If '***
                                If Me.LBtnShowPP.Text = "hide previous particulars" Then
                                    Me.LabelEmpty1.Visible = True
                                    Me.LabelEmpty2.Visible = True
                                    Me.LabelEmpty3.Visible = True
                                    Me.GridView_Student_PrevParts.DataBind() '***
                                    If Me.GridView_Student_PrevParts.Rows.Count = 0 Then '***
                                        Me.LabelPrevParts.Visible = True
                                        Me.LabelNoPP.Visible = True '***
                                        Me.GridView_Student_PrevParts.Visible = False
                                    Else
                                        Me.LabelPrevParts.Visible = True
                                        Me.GridView_Student_PrevParts.Visible = True
                                        Me.LabelNoPP.Visible = False '***
                                    End If '***
                                Else
                                    Me.LabelEmpty1.Visible = False
                                    Me.LabelEmpty2.Visible = False
                                    Me.LabelEmpty3.Visible = False
                                    Me.LabelPrevParts.Visible = False
                                    Me.LabelNoPP.Visible = False
                                    Me.GridView_Student_PrevParts.Visible = False
                                End If
                                Me.GridView_Student_AWE.DataBind()
                                Me.GridView_Student_Elect.DataBind()
                                'Me.GridView_Student_AFInfoA_Score.DataBind() '***
                                'If Me.GridView_Student_AFInfoA_Score.Rows.Count = 0 Then '***
                                'Me.LabelNoARS.Visible = True '***
                                'End If '***
                                If Me.LBtnShowARPrevious.Text = "hide previous academic records" Then
                                    Me.LabelStudentAFInfoA_Grade_Current.Text = "Current and Previous Academic Records (from Report Card)"
                                    Me.LabelNoARG_Current.Visible = False
                                    Me.GridView_Student_AFInfoA_Grade_Current.Visible = False
                                    Me.GridView_Student_AFInfoA_Grade.DataBind() '***
                                    If Me.GridView_Student_AFInfoA_Grade.Rows.Count = 0 Then '***
                                        Me.LabelNoARG.Visible = True '***
                                        Me.GridView_Student_AFInfoA_Grade.Visible = False
                                    Else
                                        Me.GridView_Student_AFInfoA_Grade.Visible = True
                                        Me.LabelNoARG.Visible = False '***
                                    End If '***
                                Else
                                    Me.LabelStudentAFInfoA_Grade_Current.Text = "Current Academic Records (from Report Card)"
                                    Me.LabelNoARG.Visible = False
                                    Me.GridView_Student_AFInfoA_Grade.Visible = False
                                    Me.GridView_Student_AFInfoA_Grade_Current.DataBind() '***
                                    If Me.GridView_Student_AFInfoA_Grade_Current.Rows.Count = 0 Then '***
                                        Me.LabelNoARG_Current.Visible = True '***
                                        Me.GridView_Student_AFInfoA_Grade_Current.Visible = False
                                    Else
                                        Me.GridView_Student_AFInfoA_Grade_Current.Visible = True
                                        Me.LabelNoARG_Current.Visible = False '***
                                    End If '***
                                End If
                                Me.GridView_Student_CurrentOLE.DataBind() '***
                                If Me.GridView_Student_CurrentOLE.Rows.Count = 0 Then '***
                                    Me.LabelNoCOLE.Visible = True '***
                                End If '***
                                If Me.LBtnShowPOLE.Text = "hide previous CCA Records" Then
                                    Me.LabelEmpty4.Visible = True
                                    Me.LabelEmpty5.Visible = True
                                    Me.LabelEmpty6.Visible = True
                                    Me.GridView_Student_PreviousOLE.DataBind() '***
                                    If Me.GridView_Student_PreviousOLE.Rows.Count = 0 Then '***
                                        Me.LabelPOLE.Visible = True
                                        Me.LabelNoPOLE.Visible = True '***
                                        Me.GridView_Student_PreviousOLE.Visible = False
                                    Else
                                        Me.LabelPOLE.Visible = True
                                        Me.GridView_Student_PreviousOLE.Visible = True
                                        Me.LabelNoPOLE.Visible = False '***
                                    End If '***
                                Else
                                    Me.LabelEmpty4.Visible = False
                                    Me.LabelEmpty5.Visible = False
                                    Me.LabelEmpty6.Visible = False
                                    Me.LabelPOLE.Visible = False
                                    Me.LabelNoPOLE.Visible = False
                                    Me.GridView_Student_PreviousOLE.Visible = False
                                End If
                                Me.GridViewPAO.DataBind() '***
                                Me.GridView_Student_CAttend.DataBind() '***
                                If Me.GridView_Student_CAttend.Rows.Count = 0 Then '***
                                    Me.LabelNoCAttend.Visible = True '***
                                End If '***
                                Me.GridView_Student_CAttendTotal.DataBind() '***
                                Me.GridViewDiscipline.DataBind()
                                Me.GridViewNextComments.DataBind()
                                Me.Panel3.Visible = True
                                Me.BtnViewStudentRecord.Text = "View another student"
                                Me.TextBox1.Enabled = False
                                Me.LBtnGetTsssId.Enabled = False
                                Me.Panel2.Visible = False
                                Me.LabelWarning.Visible = False
                                Exit For
                            End If
                        Next
                        ds3.Dispose()
                        da3.Dispose()
                    End If
                End If
                ds1.Dispose()
                da1.Dispose()
                comm.Dispose()
                conn.Close()
                conn.Dispose()
                sys_db2 = Nothing
            End If
        ElseIf Me.BtnViewStudentRecord.Text = "View another student" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecord.aspx")
            Me.Panel3.Visible = False
            Me.BtnViewStudentRecord.Text = "View this student"
            Me.TextBox1.Enabled = True
            Me.LBtnGetTsssId.Enabled = True
            Me.Panel2.Visible = False
            Me.TextBox1.Text = ""
            'Me.LabelNoElect.Visible = False '***
            Me.LabelNoCP.Visible = False '***
            Me.LabelNoCI.Visible = False '***
            Me.LabelNoPP.Visible = False '***
            'Me.LabelNoARS.Visible = False '***
            Me.LabelNoARG_Current.Visible = False '***
            Me.LabelNoARG.Visible = False '***
            Me.LabelNoCOLE.Visible = False '***
            Me.LabelNoPOLE.Visible = False '***
            Me.LabelNoCAttend.Visible = False '***
            Me.LabelWarning.Visible = False
            Me.LabelPrevParts.Visible = False
            Me.LabelPOLE.Visible = False
            Me.LabelEmpty1.Visible = False
            Me.LabelEmpty2.Visible = False
            Me.LabelEmpty3.Visible = False
            Me.LabelEmpty4.Visible = False
            Me.LabelEmpty5.Visible = False
            Me.LabelEmpty6.Visible = False
            Me.Image1.Visible = False
        End If

    End Sub

    Protected Sub LBtnGetTsssId_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Me.TextBox1.Text = ""
        Me.BtnViewStudentRecord.Enabled = False
        Me.Panel2.Visible = True

    End Sub

    Protected Sub LBtn03_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBtn03.Click

        Response.Redirect("https://www.tsss.edu.hk/sims_ex/Communication1.aspx")

    End Sub

    Protected Sub LBtn05_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBtn05.Click

        Response.Redirect("https://www.tsss.edu.hk/sims_ex/UserProfile.aspx")

    End Sub

    Protected Sub LBtnAddTutoring_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBtnAddTutoring.Click

        Response.Redirect("https://www.tsss.edu.hk/sims_ex/AddTutoringRecords.aspx")

    End Sub

    Protected Sub LBtn06_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBtn06.Click

        Response.Redirect("https://www.tsss.edu.hk/sims_ex/About.aspx")

    End Sub

    'Protected Sub LBtnAddHomwork_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBtnAddHomwork.Click

    'Response.Redirect("https://www.tsss.edu.hk/sims_ex/HomeworkRecords.aspx")

    'End Sub

    Protected Sub GridView_Student_CAttend_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView_Student_CAttend.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.Cells(1).Text = "False" Then
                e.Row.Cells(1).Text = ""
            ElseIf e.Row.Cells(1).Text = "True" Then
                e.Row.Cells(1).Text = "*"
            End If
            If e.Row.Cells(2).Text = "False" Then
                e.Row.Cells(2).Text = ""
            ElseIf e.Row.Cells(2).Text = "True" Then
                e.Row.Cells(2).Text = "*"
            End If
            If e.Row.Cells(3).Text = "False" Then
                e.Row.Cells(3).Text = ""
            ElseIf e.Row.Cells(3).Text = "True" Then
                e.Row.Cells(3).Text = "*"
            End If
            If e.Row.Cells(4).Text = "False" Then
                e.Row.Cells(4).Text = ""
            ElseIf e.Row.Cells(4).Text = "True" Then
                e.Row.Cells(4).Text = "*"
            End If
        End If
    End Sub

    Protected Sub LBtnAddCCA_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBtnAddCCA.Click

        Response.Redirect("https://www.tsss.edu.hk/sims_ex/CCARecords.aspx")

    End Sub

    Protected Sub LBtnShowARPrevious_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If Me.LBtnShowARPrevious.Text = "show previous academic records also" Then
            Me.LBtnShowARPrevious.Text = "hide previous academic records"
            Me.LabelStudentAFInfoA_Grade_Current.Text = "Current and Previous Academic Records (from Report Card)"
            Me.LabelNoARG_Current.Visible = False
            Me.GridView_Student_AFInfoA_Grade_Current.Visible = False
            Me.DropDownList4.Visible = True
            Me.GridView_Student_AFInfoA_Grade.DataBind() '***
            If Me.GridView_Student_AFInfoA_Grade.Rows.Count = 0 Then '***
                Me.LabelNoARG.Visible = True '***
                Me.GridView_Student_AFInfoA_Grade.Visible = False
            Else
                Me.GridView_Student_AFInfoA_Grade.Visible = True
                Me.LabelNoARG.Visible = False '***
            End If '***
        Else
            Me.LBtnShowARPrevious.Text = "show previous academic records also"
            Me.LabelStudentAFInfoA_Grade_Current.Text = "Current Academic Records (from Report Card)"
            Me.LabelNoARG.Visible = False
            Me.GridView_Student_AFInfoA_Grade.Visible = False
            Me.DropDownList4.Visible = False
            Me.GridView_Student_AFInfoA_Grade_Current.DataBind() '***
            If Me.GridView_Student_AFInfoA_Grade_Current.Rows.Count = 0 Then '***
                Me.LabelNoARG_Current.Visible = True '***
                Me.GridView_Student_AFInfoA_Grade_Current.Visible = False
            Else
                Me.GridView_Student_AFInfoA_Grade_Current.Visible = True
                Me.LabelNoARG_Current.Visible = False '***
            End If '***
        End If

    End Sub

    Protected Sub LBtnShowPP_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If Me.LBtnShowPP.Text = "show previous particulars" Then
            Me.LabelEmpty1.Visible = True
            Me.LabelEmpty2.Visible = True
            Me.LabelEmpty3.Visible = True
            Me.LBtnShowPP.Text = "hide previous particulars"
            Me.GridView_Student_PrevParts.DataBind() '***
            If Me.GridView_Student_PrevParts.Rows.Count = 0 Then '***
                Me.LabelPrevParts.Visible = True
                Me.LabelNoPP.Visible = True '***
                Me.GridView_Student_PrevParts.Visible = False
            Else
                Me.LabelPrevParts.Visible = True
                Me.GridView_Student_PrevParts.Visible = True
                Me.LabelNoPP.Visible = False '***
            End If '***
        Else
            Me.LabelEmpty1.Visible = False
            Me.LabelEmpty2.Visible = False
            Me.LabelEmpty3.Visible = False
            Me.LBtnShowPP.Text = "show previous particulars"
            Me.LabelPrevParts.Visible = False
            Me.LabelNoPP.Visible = False
            Me.GridView_Student_PrevParts.Visible = False
        End If

    End Sub

    Protected Sub LBtnShowPOLE_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If Me.LBtnShowPOLE.Text = "show previous CCA Records" Then
            Me.LabelEmpty4.Visible = True
            Me.LabelEmpty5.Visible = True
            Me.LabelEmpty6.Visible = True
            Me.LBtnShowPOLE.Text = "hide previous CCA Records"
            Me.GridView_Student_PreviousOLE.DataBind() '***
            If Me.GridView_Student_PreviousOLE.Rows.Count = 0 Then '***
                Me.LabelPOLE.Visible = True
                Me.LabelNoPOLE.Visible = True '***
                Me.GridView_Student_PreviousOLE.Visible = False
            Else
                Me.LabelPOLE.Visible = True
                Me.GridView_Student_PreviousOLE.Visible = True
                Me.LabelNoPOLE.Visible = False '***
            End If '***
        Else
            Me.LabelEmpty4.Visible = False
            Me.LabelEmpty5.Visible = False
            Me.LabelEmpty6.Visible = True
            Me.LBtnShowPOLE.Text = "show previous CCA Records"
            Me.LabelPOLE.Visible = False
            Me.LabelNoPOLE.Visible = False
            Me.GridView_Student_PreviousOLE.Visible = False
        End If

    End Sub

    Protected Sub GridView_Student_AFInfoA_Grade_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView_Student_AFInfoA_Grade.DataBound
        If Me.DropDownList4.SelectedValue = "ALL columns" Then
            Me.GridView_Student_AFInfoA_Grade.Columns(3).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(4).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(5).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(6).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(7).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(8).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(9).Visible = True
        ElseIf Me.DropDownList4.SelectedValue = "Running only" Then
            Me.GridView_Student_AFInfoA_Grade.Columns(3).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(4).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(5).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(6).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(7).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(8).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(9).Visible = True
        ElseIf Me.DropDownList4.SelectedValue = "Exam only" Then
            Me.GridView_Student_AFInfoA_Grade.Columns(3).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(4).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(5).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(6).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(7).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(8).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(9).Visible = False
        ElseIf Me.DropDownList4.SelectedValue = "CW only" Then
            Me.GridView_Student_AFInfoA_Grade.Columns(3).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(4).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(5).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(6).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(7).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(8).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(9).Visible = False
        ElseIf Me.DropDownList4.SelectedValue = "Exam + Running" Then
            Me.GridView_Student_AFInfoA_Grade.Columns(3).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(4).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(5).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(6).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(7).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(8).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(9).Visible = True
        ElseIf Me.DropDownList4.SelectedValue = "CW + Running" Then
            Me.GridView_Student_AFInfoA_Grade.Columns(3).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(4).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(5).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(6).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(7).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(8).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(9).Visible = True
        End If
    End Sub

    Protected Sub GridView_Student_AFInfoA_Grade_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView_Student_AFInfoA_Grade.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.Cells(3).Text = "U" Then
                e.Row.Cells(3).BackColor = Drawing.Color.FromArgb(255, 230, 230)
            ElseIf e.Row.Cells(3).Text = "F" Or e.Row.Cells(3).Text = "1" Then
                e.Row.Cells(3).BackColor = Drawing.Color.FromArgb(255, 240, 240)
            ElseIf e.Row.Cells(3).Text = "E" Or e.Row.Cells(3).Text = "2" Then
                e.Row.Cells(3).BackColor = Drawing.Color.FromArgb(240, 250, 255)
            ElseIf e.Row.Cells(3).Text = "D" Or e.Row.Cells(3).Text = "3" Then
                e.Row.Cells(3).BackColor = Drawing.Color.FromArgb(230, 245, 255)
            ElseIf e.Row.Cells(3).Text = "C" Or e.Row.Cells(3).Text = "4" Then
                e.Row.Cells(3).BackColor = Drawing.Color.FromArgb(215, 235, 255)
            ElseIf e.Row.Cells(3).Text = "B" Or e.Row.Cells(3).Text = "5" Then
                e.Row.Cells(3).BackColor = Drawing.Color.FromArgb(195, 230, 255)
            ElseIf e.Row.Cells(3).Text = "A" Or e.Row.Cells(3).Text = "5*" Or e.Row.Cells(3).Text = "5**" Then
                e.Row.Cells(3).BackColor = Drawing.Color.FromArgb(180, 215, 255)
            Else
                e.Row.Cells(3).BackColor = Drawing.Color.FromArgb(255, 255, 255)
            End If
            If e.Row.Cells(4).Text = "U" Then
                e.Row.Cells(4).BackColor = Drawing.Color.FromArgb(255, 230, 230)
            ElseIf e.Row.Cells(4).Text = "F" Or e.Row.Cells(4).Text = "1" Then
                e.Row.Cells(4).BackColor = Drawing.Color.FromArgb(255, 240, 240)
            ElseIf e.Row.Cells(4).Text = "E" Or e.Row.Cells(4).Text = "2" Then
                e.Row.Cells(4).BackColor = Drawing.Color.FromArgb(240, 250, 255)
            ElseIf e.Row.Cells(4).Text = "D" Or e.Row.Cells(4).Text = "3" Then
                e.Row.Cells(4).BackColor = Drawing.Color.FromArgb(230, 245, 255)
            ElseIf e.Row.Cells(4).Text = "C" Or e.Row.Cells(4).Text = "4" Then
                e.Row.Cells(4).BackColor = Drawing.Color.FromArgb(215, 235, 255)
            ElseIf e.Row.Cells(4).Text = "B" Or e.Row.Cells(4).Text = "5" Then
                e.Row.Cells(4).BackColor = Drawing.Color.FromArgb(195, 230, 255)
            ElseIf e.Row.Cells(4).Text = "A" Or e.Row.Cells(4).Text = "5*" Or e.Row.Cells(4).Text = "5**" Then
                e.Row.Cells(4).BackColor = Drawing.Color.FromArgb(180, 215, 255)
            Else
                e.Row.Cells(4).BackColor = Drawing.Color.FromArgb(255, 255, 255)
            End If
            If e.Row.Cells(5).Text = "U" Then
                e.Row.Cells(5).BackColor = Drawing.Color.FromArgb(255, 230, 230)
            ElseIf e.Row.Cells(5).Text = "F" Or e.Row.Cells(5).Text = "1" Then
                e.Row.Cells(5).BackColor = Drawing.Color.FromArgb(255, 240, 240)
            ElseIf e.Row.Cells(5).Text = "E" Or e.Row.Cells(5).Text = "2" Then
                e.Row.Cells(5).BackColor = Drawing.Color.FromArgb(240, 250, 255)
            ElseIf e.Row.Cells(5).Text = "D" Or e.Row.Cells(5).Text = "3" Then
                e.Row.Cells(5).BackColor = Drawing.Color.FromArgb(230, 245, 255)
            ElseIf e.Row.Cells(5).Text = "C" Or e.Row.Cells(5).Text = "4" Then
                e.Row.Cells(5).BackColor = Drawing.Color.FromArgb(215, 235, 255)
            ElseIf e.Row.Cells(5).Text = "B" Or e.Row.Cells(5).Text = "5" Then
                e.Row.Cells(5).BackColor = Drawing.Color.FromArgb(195, 230, 255)
            ElseIf e.Row.Cells(5).Text = "A" Or e.Row.Cells(5).Text = "5*" Or e.Row.Cells(5).Text = "5**" Then
                e.Row.Cells(5).BackColor = Drawing.Color.FromArgb(180, 215, 255)
            Else
                e.Row.Cells(5).BackColor = Drawing.Color.FromArgb(255, 255, 255)
            End If
            If e.Row.Cells(6).Text = "U" Then
                e.Row.Cells(6).BackColor = Drawing.Color.FromArgb(255, 230, 230)
            ElseIf e.Row.Cells(6).Text = "F" Or e.Row.Cells(6).Text = "1" Then
                e.Row.Cells(6).BackColor = Drawing.Color.FromArgb(255, 240, 240)
            ElseIf e.Row.Cells(6).Text = "E" Or e.Row.Cells(6).Text = "2" Then
                e.Row.Cells(6).BackColor = Drawing.Color.FromArgb(240, 250, 255)
            ElseIf e.Row.Cells(6).Text = "D" Or e.Row.Cells(6).Text = "3" Then
                e.Row.Cells(6).BackColor = Drawing.Color.FromArgb(230, 245, 255)
            ElseIf e.Row.Cells(6).Text = "C" Or e.Row.Cells(6).Text = "4" Then
                e.Row.Cells(6).BackColor = Drawing.Color.FromArgb(215, 235, 255)
            ElseIf e.Row.Cells(6).Text = "B" Or e.Row.Cells(6).Text = "5" Then
                e.Row.Cells(6).BackColor = Drawing.Color.FromArgb(195, 230, 255)
            ElseIf e.Row.Cells(6).Text = "A" Or e.Row.Cells(6).Text = "5*" Or e.Row.Cells(6).Text = "5**" Then
                e.Row.Cells(6).BackColor = Drawing.Color.FromArgb(180, 215, 255)
            Else
                e.Row.Cells(6).BackColor = Drawing.Color.FromArgb(255, 255, 255)
            End If
            If e.Row.Cells(7).Text = "U" Then
                e.Row.Cells(7).BackColor = Drawing.Color.FromArgb(255, 230, 230)
            ElseIf e.Row.Cells(7).Text = "F" Or e.Row.Cells(7).Text = "1" Then
                e.Row.Cells(7).BackColor = Drawing.Color.FromArgb(255, 240, 240)
            ElseIf e.Row.Cells(7).Text = "E" Or e.Row.Cells(7).Text = "2" Then
                e.Row.Cells(7).BackColor = Drawing.Color.FromArgb(240, 250, 255)
            ElseIf e.Row.Cells(7).Text = "D" Or e.Row.Cells(7).Text = "3" Then
                e.Row.Cells(7).BackColor = Drawing.Color.FromArgb(230, 245, 255)
            ElseIf e.Row.Cells(7).Text = "C" Or e.Row.Cells(7).Text = "4" Then
                e.Row.Cells(7).BackColor = Drawing.Color.FromArgb(215, 235, 255)
            ElseIf e.Row.Cells(7).Text = "B" Or e.Row.Cells(7).Text = "5" Then
                e.Row.Cells(7).BackColor = Drawing.Color.FromArgb(195, 230, 255)
            ElseIf e.Row.Cells(7).Text = "A" Or e.Row.Cells(7).Text = "5*" Or e.Row.Cells(7).Text = "5**" Then
                e.Row.Cells(7).BackColor = Drawing.Color.FromArgb(180, 215, 255)
            Else
                e.Row.Cells(7).BackColor = Drawing.Color.FromArgb(255, 255, 255)
            End If
            If e.Row.Cells(8).Text = "U" Then
                e.Row.Cells(8).BackColor = Drawing.Color.FromArgb(255, 230, 230)
            ElseIf e.Row.Cells(8).Text = "F" Or e.Row.Cells(8).Text = "1" Then
                e.Row.Cells(8).BackColor = Drawing.Color.FromArgb(255, 240, 240)
            ElseIf e.Row.Cells(8).Text = "E" Or e.Row.Cells(8).Text = "2" Then
                e.Row.Cells(8).BackColor = Drawing.Color.FromArgb(240, 250, 255)
            ElseIf e.Row.Cells(8).Text = "D" Or e.Row.Cells(8).Text = "3" Then
                e.Row.Cells(8).BackColor = Drawing.Color.FromArgb(230, 245, 255)
            ElseIf e.Row.Cells(8).Text = "C" Or e.Row.Cells(8).Text = "4" Then
                e.Row.Cells(8).BackColor = Drawing.Color.FromArgb(215, 235, 255)
            ElseIf e.Row.Cells(8).Text = "B" Or e.Row.Cells(8).Text = "5" Then
                e.Row.Cells(8).BackColor = Drawing.Color.FromArgb(195, 230, 255)
            ElseIf e.Row.Cells(8).Text = "A" Or e.Row.Cells(8).Text = "5*" Or e.Row.Cells(8).Text = "5**" Then
                e.Row.Cells(8).BackColor = Drawing.Color.FromArgb(180, 215, 255)
            Else
                e.Row.Cells(8).BackColor = Drawing.Color.FromArgb(255, 255, 255)
            End If
            If e.Row.Cells(9).Text = "U" Then
                e.Row.Cells(9).BackColor = Drawing.Color.FromArgb(255, 230, 230)
            ElseIf e.Row.Cells(9).Text = "F" Or e.Row.Cells(9).Text = "1" Then
                e.Row.Cells(9).BackColor = Drawing.Color.FromArgb(255, 240, 240)
            ElseIf e.Row.Cells(9).Text = "E" Or e.Row.Cells(9).Text = "2" Then
                e.Row.Cells(9).BackColor = Drawing.Color.FromArgb(240, 250, 255)
            ElseIf e.Row.Cells(9).Text = "D" Or e.Row.Cells(9).Text = "3" Then
                e.Row.Cells(9).BackColor = Drawing.Color.FromArgb(230, 245, 255)
            ElseIf e.Row.Cells(9).Text = "C" Or e.Row.Cells(9).Text = "4" Then
                e.Row.Cells(9).BackColor = Drawing.Color.FromArgb(215, 235, 255)
            ElseIf e.Row.Cells(9).Text = "B" Or e.Row.Cells(9).Text = "5" Then
                e.Row.Cells(9).BackColor = Drawing.Color.FromArgb(195, 230, 255)
            ElseIf e.Row.Cells(9).Text = "A" Or e.Row.Cells(9).Text = "5*" Or e.Row.Cells(9).Text = "5**" Then
                e.Row.Cells(9).BackColor = Drawing.Color.FromArgb(180, 215, 255)
            Else
                e.Row.Cells(9).BackColor = Drawing.Color.FromArgb(255, 255, 255)
            End If
        End If
    End Sub

    Protected Sub DropDownList4_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList4.SelectedIndexChanged
        If Me.DropDownList4.SelectedValue = "ALL columns" Then
            Me.GridView_Student_AFInfoA_Grade.Columns(3).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(4).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(5).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(6).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(7).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(8).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(9).Visible = True
        ElseIf Me.DropDownList4.SelectedValue = "Running only" Then
            Me.GridView_Student_AFInfoA_Grade.Columns(3).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(4).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(5).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(6).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(7).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(8).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(9).Visible = True
        ElseIf Me.DropDownList4.SelectedValue = "Exam only" Then
            Me.GridView_Student_AFInfoA_Grade.Columns(3).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(4).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(5).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(6).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(7).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(8).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(9).Visible = False
        ElseIf Me.DropDownList4.SelectedValue = "CW only" Then
            Me.GridView_Student_AFInfoA_Grade.Columns(3).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(4).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(5).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(6).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(7).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(8).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(9).Visible = False
        ElseIf Me.DropDownList4.SelectedValue = "Exam + Running" Then
            Me.GridView_Student_AFInfoA_Grade.Columns(3).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(4).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(5).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(6).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(7).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(8).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(9).Visible = True
        ElseIf Me.DropDownList4.SelectedValue = "CW + Running" Then
            Me.GridView_Student_AFInfoA_Grade.Columns(3).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(4).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(5).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(6).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(7).Visible = True
            Me.GridView_Student_AFInfoA_Grade.Columns(8).Visible = False
            Me.GridView_Student_AFInfoA_Grade.Columns(9).Visible = True
        End If
    End Sub

    Public Shared Function ConvertToBR(ByVal InputString As Object) As String

        Dim Pattern As String = "\n"
        If InputString.GetType.Equals(Pattern.GetType) Then
            Dim Rgx As New Regex(Pattern)
            Dim OutputString As String = Rgx.Replace(InputString, "<br/>")
            Return OutputString
        Else
            Return ""
        End If

    End Function

    Protected Sub GridViewPAO_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewPAO.DataBound

        If Me.GridViewPAO.Rows.Count = 0 Then
            Me.LabelPAO.Visible = False
            Me.LabelEmpty5.Visible = False
            Me.LabelEmpty6.Visible = False
        Else
            Me.LabelPAO.Visible = True
            'Me.LabelEmpty5.Visible = True
            Me.LabelEmpty6.Visible = True
        End If

    End Sub

    Protected Sub LBtnEditDR_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBtnEditDR.Click
        Response.Redirect("https://www.tsss.edu.hk/sims_ex/Discipline_Case.aspx")
    End Sub

    Protected Sub LBtnEditDS_Click(sender As Object, e As EventArgs) Handles LBtnEditDS.Click
        Response.Redirect("https://www.tsss.edu.hk/sims_ex/DetentionRecords.aspx")
    End Sub

    Protected Sub LBtnEditCoun_Click(sender As Object, e As EventArgs) Handles LBtnEditCoun.Click

        Response.Redirect("https://www.tsss.edu.hk/sims_ex/AddcRecords.aspx")
    End Sub



    Protected Sub loadCWGraphScript()
        Me.Label6.Text = "</span><script src='Chart/Chart.bundle.js'></script>" & vbCrLf &
"<script src='Chart/Chart.bundle.min.js'></script>" & vbCrLf &
"<script src='Chart/utils.js'></script>" & vbCrLf &
    "<script>" & vbCrLf &
        "var randomScalingFactor = function () { return Math.round(Math.random() * 100) };" & vbCrLf &
        "var color = Chart.helpers.color;" & vbCrLf &
        "" & vbCrLf &
        "var barChartData = {" & vbCrLf &
           " labels: " & Me.ChartLabels & ", " & vbCrLf &
"datasets: [" & vbCrLf &
                "{" & vbCrLf &
"label: 'T1 CW'," & vbCrLf &
"fillColor: 'rgba(220,220,220,1)'," & vbCrLf &
"strokeColor: 'rgba(220,220,220,1)'," & vbCrLf &
"pointColor: 'rgba(220,220,220,1)'," & vbCrLf &
"pointStrokeColor: '#fff'," & vbCrLf &
"pointHighlightFill: '#fff'," & vbCrLf &
"pointHighlightStroke: 'rgba(220,220,220,1)'," & vbCrLf &
                    "backgroundColor: color(window.chartColors.green).alpha(0.8).rgbString()," & vbCrLf &
                    "data: [0.00, 10, 40.00, 60, 10.00, 80, 60, 0, 10, 40, 60, 10, 80, 60.00]" & vbCrLf &
                   " }," & vbCrLf &
              "  {" & vbCrLf &
"label: 'T1 CW AVG'," & vbCrLf &
"fillColor: 'rgba(151,187,205,0.2)'," & vbCrLf &
"strokeColor: 'rgba(151,187,205,1)'," & vbCrLf &
"pointColor: 'rgba(151,187,205,1)'," & vbCrLf &
"pointStrokeColor: '#fff'," & vbCrLf &
"pointHighlightFill: '#fff'," & vbCrLf &
"pointHighlightStroke: 'rgba(151,187,205,1)'," & vbCrLf &
                    "backgroundColor: color(window.chartColors.green).alpha(0.4).rgbString()," & vbCrLf &
                    "data: [28, 48, 40.50, 19, 40.00, 27, 40, 28, 48, 40, 19, 40, 27, 40.00]" & vbCrLf &
                    "}," & vbCrLf &
                "{" & vbCrLf &
"label: 'T2 CW'," & vbCrLf &
"fillColor: 'rgba(220,220,220,1)'," & vbCrLf &
"strokeColor: 'rgba(220,220,220,1)'," & vbCrLf &
"pointColor: 'rgba(220,220,220,1)'," & vbCrLf &
"pointStrokeColor: '#fff'," & vbCrLf &
"pointHighlightFill: '#fff'," & vbCrLf &
"pointHighlightStroke: 'rgba(220,220,220,1)'," & vbCrLf &
                    "backgroundColor: color(window.chartColors.blue).alpha(0.8).rgbString()," & vbCrLf &
                    "data: [0, 10, 40, 60, 10, 80, 60, 0, 10, 40, 60, 100, 80, 60]" & vbCrLf &
                    "}," & vbCrLf &
               " {" & vbCrLf &
"label: 'T2 CW AVG'," & vbCrLf &
"fillColor: 'rgba(151,187,205,0.2)'," & vbCrLf &
"strokeColor: 'rgba(151,187,205,1)'," & vbCrLf &
"pointColor: 'rgba(151,187,205,1)'," & vbCrLf &
"pointStrokeColor: '#fff'," & vbCrLf &
"pointHighlightFill: '#fff'," & vbCrLf &
"pointHighlightStroke: 'rgba(151,187,205,1)'," & vbCrLf &
                    "backgroundColor: color(window.chartColors.blue).alpha(0.4).rgbString()," & vbCrLf &
                    "data: [28, 48, 40.75, 19, 40, 27, 40, 28, 48, 40, 19, 40, 27, 40]" & vbCrLf &
                    "}" & vbCrLf &
            "]" & vbCrLf &
        "}" & vbCrLf &
        "function DrawChart() {" & vbCrLf &
            "var ctx = document.getElementById('CW').getContext('2d');" & vbCrLf &
           " window.myBar = new Chart(ctx, {type: 'bar'," & vbCrLf &
                "data: barChartData," & vbCrLf &
                "options: {" & vbCrLf &
                    "scales: {yAxes: [{ticks: {beginAtZero: true, min: 0, max: 100}}]}," & vbCrLf &
                    "maintainAspectRatio: false," & vbCrLf &
                    "responsive: true}});" & vbCrLf &
        "}" & vbCrLf &
    "</script><span>"
    End Sub

    Protected Sub LBtnSubjectName_Click(sender As Object, e As EventArgs)

        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        'Me.SqlDataSource21.SelectParameters("tsss_id").DefaultValue = Me.TextBox1.Text
        'Me.SqlDataSource21.SelectParameters("subject_name").DefaultValue = sender.text
        'Me.SqlDataSource21.SelectParameters("terms").DefaultValue = gvRow.Cells(1).Text
        'Me.LabelCWbreakdown.Text = "Coursework Breakdown (" + gvRow.Cells(1).Text + ", " + sender.text + ")"
        'Me.GridView_Student_PrevParts2.DataBind()
        'Me.GridView_Student_PrevParts2.Visible = True

    End Sub

    Protected Sub LBtnEditSEN_Click(sender As Object, e As EventArgs) Handles LBtnEditSEN.Click
        Response.Redirect("https://www.tsss.edu.hk/sims_ex/SEN_View.aspx")

    End Sub

    'Protected Sub LinkButtonTTAM_Click(sender As Object, e As EventArgs) Handles LinkButtonTTAM.Click
    'Response.Redirect("https://www.tsss.edu.hk/sims_ex/0xE8e1h5ks7g2.aspx?floc=Timetable\2021-22\" + Me.TextBox1.Text + ".pdf")
    'Response.Redirect("https://www.tsss.edu.hk/sims_ex/0xE8e1h5ks7g2.aspx?floc=Timetable\2021-22\ByClass\" + Session("StudentClass") + ".pdf")
    'End Sub

    Protected Sub DropDownListKAA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownListKAA.SelectedIndexChanged
        If Me.DropDownListKAA.Text = "18-19" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordAFchart1819.aspx?pn=" + Me.TextBox1.Text)
        ElseIf Me.DropDownListKAA.Text = "19-20" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordAFchart1920.aspx?pn=" + Me.TextBox1.Text)
        ElseIf Me.DropDownListKAA.Text = "20-21" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordAFchart2021.aspx?pn=" + Me.TextBox1.Text)
        ElseIf Me.DropDownListKAA.Text = "21-22" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordAFchart2122.aspx?pn=" + Me.TextBox1.Text)
        ElseIf Me.DropDownListKAA.Text = "22-23" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordAFchart2223.aspx?pn=" + Me.TextBox1.Text)
        ElseIf Me.DropDownListKAA.Text = "23-24" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordAFchart2324.aspx?pn=" + Me.TextBox1.Text)
        ElseIf Me.DropDownListKAA.Text = "24-25" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordAFchart.aspx?pn=" + Me.TextBox1.Text)
        Else

        End If
    End Sub

    Protected Sub LinkButtonTTPM1_Click(sender As Object, e As EventArgs) Handles LinkButtonTTPM1.Click
        Response.Redirect("https://www.tsss.edu.hk/sims_ex/0xE8e1h5ks7g2.aspx?floc=Timetable\pm\" + Session("StudentClass") + ".pdf")
    End Sub

    Protected Sub LinkButtonTTPM2_Click(sender As Object, e As EventArgs) Handles LinkButtonTTPM2.Click
        Response.Redirect("https://www.tsss.edu.hk/sims_ex/0xE8e1h5ks7g2.aspx?floc=Timetable\pm\w37\" + Session("StudentClass") + ".pdf")
    End Sub

    Protected Sub LinkButtonTTSum1_Click(sender As Object, e As EventArgs) Handles LinkButtonTTSum1.Click
        Response.Redirect("https://www.tsss.edu.hk/sims_ex/0xE8e1h5ks7g2.aspx?floc=Timetable\studydate\f" + Left(Session("StudentClass"), 1) + ".pdf")
    End Sub

    Protected Sub LinkButtonTTSum2_Click(sender As Object, e As EventArgs) Handles LinkButtonTTSum2.Click
        Response.Redirect("https://www.tsss.edu.hk/sims_ex/0xE8e1h5ks7g2.aspx?floc=Timetable\studydate\w37\f" + Left(Session("StudentClass"), 1) + ".pdf")
    End Sub

    'Protected Sub LinkButtonORCf6mock_Click(sender As Object, e As EventArgs) Handles LinkButtonORCf6mock.Click
    'Response.Redirect("https://www.tsss.edu.hk/sims_ex/0xE8e1h5ks7g2.aspx?floc=F6MockRC\2021-22\" + Session("StudentClass") + "-" + Session("StudentClassNo") + "-" + Session("tsss_id") + ".pdf")
    'End Sub

    Protected Sub DropDownListKAA0_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownListKAA0.SelectedIndexChanged

        If Me.DropDownListKAA0.Text = "19-20 Term 1" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordOnlineReportCard.aspx?pn=" + Me.TextBox1.Text)
        ElseIf Me.DropDownListKAA0.Text = "19-20 Year End" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordOnlineReportCard_Test.aspx?pn=" + Me.TextBox1.Text)
        ElseIf Me.DropDownListKAA0.Text = "20-21 Term 1" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordOnlineReportCard20202021T1.aspx?pn=" + Me.TextBox1.Text)
        ElseIf Me.DropDownListKAA0.Text = "20-21 Year End" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordOnlineReportCard20202021T2.aspx?pn=" + Me.TextBox1.Text)
        ElseIf Me.DropDownListKAA0.Text = "21-22 Term 1" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordOnlineReportCard20212022T1.aspx?pn=" + Me.TextBox1.Text)
        ElseIf Me.DropDownListKAA0.Text = "21-22 Year End" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordOnlineReportCard20212022T2.aspx?pn=" + Me.TextBox1.Text)
        ElseIf Me.DropDownListKAA0.Text = "22-23 Term 1" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordOnlineReportCard20222023T1.aspx?pn=" + Me.TextBox1.Text)
        ElseIf Me.DropDownListKAA0.Text = "22-23 Mock" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/0xE8e1h5ks7g2.aspx?floc=F6MockRC\2022-23\" + Session("StudentClass") + "-" + Session("StudentClassNo") + "-" + Session("tsss_id") + ".pdf")
        ElseIf Me.DropDownListKAA0.Text = "22-23 Year End" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordOnlineReportCard20222023T2.aspx?pn=" + Me.TextBox1.Text)
        ElseIf Me.DropDownListKAA0.Text = "23-24 Term 1" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordOnlineReportCard20232024T1.aspx?pn=" + Me.TextBox1.Text)
        ElseIf Me.DropDownListKAA0.Text = "23-24 Year End" Then
            Response.Redirect("https://www.tsss.edu.hk/sims_ex/StudentRecordOnlineReportCard20232024T2.aspx?pn=" + Me.TextBox1.Text)
        Else

        End If
    End Sub

    Protected Sub LBtnEditMC_Click(sender As Object, e As EventArgs) Handles LBtnEditMC.Click

        Response.Redirect("https://www.tsss.edu.hk/sims_ex/MeritCard.aspx")
    End Sub
End Class