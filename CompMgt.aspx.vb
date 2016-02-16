#Region "Imports"

Imports System.Data.SqlClient
Imports System.Security.Principal
Imports System.Web.UI.Page
Imports System.IO
Imports System.Net.Mail

#End Region

Partial Class CompMgt
    Inherits System.Web.UI.Page
    Dim pubUser As String
    Dim pubGridCount As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim sUser() As String = Split(User.Identity.Name, "\")
        Dim sDomain As String = sUser(0)
        Dim sUserId As String = sUser(1)

        pubUser = UCase(sUserId)
        pubGridCount = 0

        If Not IsPostBack Then
            GridView1.DataSourceID = "ObjectDataSource1"
            MultiView1.ActiveViewIndex = 0
            GetLastUpdateDateTime()
        End If

    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        Select Case e.CommandName
            Case "Select"
                'Label57.Text = Trim(e.CommandArgument)

                'MultiView1.ActiveViewIndex = 3
        End Select
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        TextBox1.Text = ""

        If DropDownList1.SelectedItem.Text.Trim = "Desktop" Or DropDownList1.SelectedItem.Text.Trim = "Laptop" Then
            ImageButton1.Visible = True
            UpdateCsvSelectedError()
        Else
            ImageButton1.Visible = False
        End If

        If DropDownList2.SelectedIndex = 0 Then

            Select Case DropDownList1.SelectedIndex
                Case 0
                    GridView1.DataSourceID = "ObjectDataSource1"
                Case 1
                    Label3.Text = "D"
                    GridView1.DataSourceID = "ObjectDataSource2"
                Case 2
                    Label3.Text = "L"
                    GridView1.DataSourceID = "ObjectDataSource2"
                Case 3
                    GridView1.DataSourceID = "ObjectDataSource48"
                Case 4
                    GridView1.DataSourceID = "ObjectDataSource3"
                Case 5
                    GridView1.DataSourceID = "ObjectDataSource94"
                Case 6
                    GridView1.DataSourceID = "ObjectDataSource5"
                Case 7
                    Label3.Text = "192.168.12"
                    GridView1.DataSourceID = "ObjectDataSource4"
                Case 8
                    Label3.Text = "192.168.13"
                    GridView1.DataSourceID = "ObjectDataSource4"
                Case 9
                    GridView1.DataSourceID = "ObjectDataSource37"
                Case 10
                    GridView1.DataSourceID = "ObjectDataSource80"

            End Select

        Else
            Select Case DropDownList1.SelectedIndex
                Case 0
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource59"
                        Case 2
                            GridView1.DataSourceID = "AnyUpdateWithError"
                        Case 3
                            GridView1.DataSourceID = "AnyUpdateNeeded"
                        Case 4
                            GridView1.DataSourceID = "AnyUpdateWithNoStatus"
                        Case 5
                            GridView1.DataSourceID = "AnyDownloadStatus"
                        Case 6
                            GridView1.DataSourceID = "AnyPendingReboot"
                        Case 7
                            GridView1.DataSourceID = "AnySavStatus"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource66"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource73"
                        Case 10
                            GridView1.DataSourceID = "AnyInactive"
                        Case 11
                            GridView1.DataSourceID = "AnyUnregisteredIP"
                        Case 12
                            GridView1.DataSourceID = "AnyUnregisteredDevice"
                        Case 13
                            GridView1.DataSourceID = "AnyUnregisteredMac"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource108"
                    End Select

                Case 1
                    Label3.Text = "D"
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource60"
                        Case 2
                            GridView1.DataSourceID = "DesktopLaptopUpdateWithError"
                        Case 3
                            GridView1.DataSourceID = "DesktopLaptopUpdatesNeeded"
                        Case 4
                            GridView1.DataSourceID = "DesktopLaptopUpdatesWithNoStatus"
                        Case 5
                            GridView1.DataSourceID = "DesktopLaptopDownloadStatus"
                        Case 6
                            GridView1.DataSourceID = "DesktopLaptopPendingReboot"
                        Case 7
                            GridView1.DataSourceID = "DesktopLaptopSavStatus"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource67"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource74"
                        Case 10
                            GridView1.DataSourceID = "DesktopLaptopInactive"
                        Case 11
                            GridView1.DataSourceID = "DesktopLaptopUnregisteredIP"
                        Case 12
                            GridView1.DataSourceID = "DesktopLaptopUnregisteredDevice"
                        Case 13
                            GridView1.DataSourceID = "DesktopLaptopUnregisteredMac"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource109"
                    End Select

                Case 2
                    Label3.Text = "L"
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource60"
                        Case 2
                            GridView1.DataSourceID = "DesktopLaptopUpdateWithError"
                        Case 3
                            GridView1.DataSourceID = "DesktopLaptopUpdatesNeeded"
                        Case 4
                            GridView1.DataSourceID = "DesktopLaptopUpdatesWithNoStatus"
                        Case 5
                            GridView1.DataSourceID = "DesktopLaptopDownloadStatus"
                        Case 6
                            GridView1.DataSourceID = "DesktopLaptopPendingReboot"
                        Case 7
                            GridView1.DataSourceID = "DesktopLaptopSavStatus"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource67"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource74"
                        Case 10
                            GridView1.DataSourceID = "DesktopLaptopInactive"
                        Case 11
                            GridView1.DataSourceID = "DesktopLaptopUnregisteredIP"
                        Case 12
                            GridView1.DataSourceID = "DesktopLaptopUnregisteredDevice"
                        Case 13
                            GridView1.DataSourceID = "DesktopLaptopUnregisteredMac"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource109"
                    End Select

                Case 3
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource61"
                        Case 2
                            GridView1.DataSourceID = "ObjectDataSource52"
                        Case 3
                            GridView1.DataSourceID = "ObjectDataSource53"
                        Case 4
                            GridView1.DataSourceID = "ObjectDataSource54"
                        Case 5
                            GridView1.DataSourceID = "ObjectDataSource55"
                        Case 6
                            GridView1.DataSourceID = "ObjectDataSource56"
                        Case 7
                            GridView1.DataSourceID = "ObjectDataSource57"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource68"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource75"
                        Case 10
                            GridView1.DataSourceID = "ObjectDataSource51"
                        Case 11
                            GridView1.DataSourceID = "ObjectDataSource49"
                        Case 12
                            GridView1.DataSourceID = "ObjectDataSource50"
                        Case 13
                            GridView1.DataSourceID = "ObjectDataSource58"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource110"
                    End Select

                Case 4
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource62"
                        Case 2
                            GridView1.DataSourceID = "ObjectDataSource9"
                        Case 3
                            GridView1.DataSourceID = "ObjectDataSource10"
                        Case 4
                            GridView1.DataSourceID = "ObjectDataSource11"
                        Case 5
                            GridView1.DataSourceID = "ObjectDataSource12"
                        Case 6
                            GridView1.DataSourceID = "ObjectDataSource13"
                        Case 7
                            GridView1.DataSourceID = "ObjectDataSource14"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource69"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource76"
                        Case 10
                            GridView1.DataSourceID = "ObjectDataSource8"
                        Case 11
                            GridView1.DataSourceID = "ObjectDataSource6"
                        Case 12
                            GridView1.DataSourceID = "ObjectDataSource7"
                        Case 13
                            GridView1.DataSourceID = "ObjectDataSource15"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource111"
                    End Select
                Case 5
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource95"
                        Case 2
                            GridView1.DataSourceID = "ObjectDataSource96"
                        Case 3
                            GridView1.DataSourceID = "ObjectDataSource97"
                        Case 4
                            GridView1.DataSourceID = "ObjectDataSource98"
                        Case 5
                            GridView1.DataSourceID = "ObjectDataSource99"
                        Case 6
                            GridView1.DataSourceID = "ObjectDataSource100"
                        Case 7
                            GridView1.DataSourceID = "ObjectDataSource101"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource102"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource103"
                        Case 10
                            GridView1.DataSourceID = "ObjectDataSource104"
                        Case 11
                            GridView1.DataSourceID = "ObjectDataSource105"
                        Case 12
                            GridView1.DataSourceID = "ObjectDataSource106"
                        Case 13
                            GridView1.DataSourceID = "ObjectDataSource107"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource112"
                    End Select

                Case 6
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource63"
                        Case 2
                            GridView1.DataSourceID = "ObjectDataSource19"
                        Case 3
                            GridView1.DataSourceID = "ObjectDataSource20"
                        Case 4
                            GridView1.DataSourceID = "ObjectDataSource21"
                        Case 5
                            GridView1.DataSourceID = "ObjectDataSource22"
                        Case 6
                            GridView1.DataSourceID = "ObjectDataSource23"
                        Case 7
                            GridView1.DataSourceID = "ObjectDataSource24"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource70"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource77"
                        Case 10
                            GridView1.DataSourceID = "ObjectDataSource18"
                        Case 11
                            GridView1.DataSourceID = "ObjectDataSource16"
                        Case 12
                            GridView1.DataSourceID = "ObjectDataSource17"
                        Case 13
                            GridView1.DataSourceID = "ObjectDataSource25"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource116"
                    End Select

                Case 7
                    Label3.Text = "192.168.12"
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource64"
                        Case 2
                            GridView1.DataSourceID = "ObjectDataSource29"
                        Case 3
                            GridView1.DataSourceID = "ObjectDataSource30"
                        Case 4
                            GridView1.DataSourceID = "ObjectDataSource31"
                        Case 5
                            GridView1.DataSourceID = "ObjectDataSource32"
                        Case 6
                            GridView1.DataSourceID = "ObjectDataSource33"
                        Case 7
                            GridView1.DataSourceID = "ObjectDataSource34"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource71"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource78"
                        Case 10
                            GridView1.DataSourceID = "ObjectDataSource28"
                        Case 11
                            GridView1.DataSourceID = "ObjectDataSource26"
                        Case 12
                            GridView1.DataSourceID = "ObjectDataSource27"
                        Case 13
                            GridView1.DataSourceID = "ObjectDataSource35"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource113"
                    End Select

                Case 8
                    Label3.Text = "192.168.13"
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource64"
                        Case 2
                            GridView1.DataSourceID = "ObjectDataSource29"
                        Case 3
                            GridView1.DataSourceID = "ObjectDataSource30"
                        Case 4
                            GridView1.DataSourceID = "ObjectDataSource31"
                        Case 5
                            GridView1.DataSourceID = "ObjectDataSource32"
                        Case 6
                            GridView1.DataSourceID = "ObjectDataSource33"
                        Case 7
                            GridView1.DataSourceID = "ObjectDataSource34"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource71"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource78"
                        Case 10
                            GridView1.DataSourceID = "ObjectDataSource28"
                        Case 11
                            GridView1.DataSourceID = "ObjectDataSource26"
                        Case 12
                            GridView1.DataSourceID = "ObjectDataSource27"
                        Case 13
                            GridView1.DataSourceID = "ObjectDataSource35"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource113"
                    End Select

                Case 9
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource65"
                        Case 2
                            GridView1.DataSourceID = "ObjectDataSource41"
                        Case 3
                            GridView1.DataSourceID = "ObjectDataSource42"
                        Case 4
                            GridView1.DataSourceID = "ObjectDataSource43"
                        Case 5
                            GridView1.DataSourceID = "ObjectDataSource44"
                        Case 6
                            GridView1.DataSourceID = "ObjectDataSource45"
                        Case 7
                            GridView1.DataSourceID = "ObjectDataSource46"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource72"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource79"
                        Case 10
                            GridView1.DataSourceID = "ObjectDataSource40"
                        Case 11
                            GridView1.DataSourceID = "ObjectDataSource38"
                        Case 12
                            GridView1.DataSourceID = "ObjectDataSource39"
                        Case 13
                            GridView1.DataSourceID = "ObjectDataSource47"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource114"
                    End Select
                Case 10
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource81"
                        Case 2
                            GridView1.DataSourceID = "ObjectDataSource82"
                        Case 3
                            GridView1.DataSourceID = "ObjectDataSource83"
                        Case 4
                            GridView1.DataSourceID = "ObjectDataSource84"
                        Case 5
                            GridView1.DataSourceID = "ObjectDataSource85"
                        Case 6
                            GridView1.DataSourceID = "ObjectDataSource86"
                        Case 7
                            GridView1.DataSourceID = "ObjectDataSource87"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource88"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource89"
                        Case 10
                            GridView1.DataSourceID = "ObjectDataSource90"
                        Case 11
                            GridView1.DataSourceID = "ObjectDataSource91"
                        Case 12
                            GridView1.DataSourceID = "ObjectDataSource92"
                        Case 13
                            GridView1.DataSourceID = "ObjectDataSource93"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource115"
                    End Select

            End Select

        End If
        GridView1.DataBind()
        UpdateCsvSelectedError()

    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged
        TextBox1.Text = ""
        Select Case DropDownList2.SelectedIndex
            Case 4
                If DropDownList1.SelectedItem.Text.Trim = "Servers" Then
                    ImageButton1.Visible = False
                Else
                    ImageButton1.Visible = True
                End If

                UpdateCsvSelectedError()
            Case 5
                If DropDownList1.SelectedItem.Text.Trim = "Servers" Then
                    ImageButton1.Visible = False
                Else
                    ImageButton1.Visible = True
                End If

                UpdateCsvSelectedError()
            Case 6
                If DropDownList1.SelectedItem.Text.Trim = "Servers" Then
                    ImageButton1.Visible = False
                Else
                    ImageButton1.Visible = True
                End If

                UpdateCsvSelectedError()
            Case 14
                If DropDownList1.SelectedItem.Text.Trim = "Servers" Then
                    ImageButton1.Visible = False
                Else
                    ImageButton1.Visible = True
                End If

                UpdateCsvSelectedError()

            Case Else
                ImageButton1.Visible = False
        End Select

        If DropDownList2.SelectedIndex = 0 Then
            Select Case DropDownList1.SelectedIndex
                Case 0
                    GridView1.DataSourceID = "ObjectDataSource1"
                Case 1
                    Label3.Text = "D"
                    GridView1.DataSourceID = "ObjectDataSource2"
                Case 2
                    Label3.Text = "L"
                    GridView1.DataSourceID = "ObjectDataSource2"
                Case 3
                    GridView1.DataSourceID = "ObjectDataSource48"
                Case 4
                    GridView1.DataSourceID = "ObjectDataSource3"
                Case 5
                    GridView1.DataSourceID = "ObjectDataSource94"
                Case 6
                    GridView1.DataSourceID = "ObjectDataSource5"
                Case 7
                    Label3.Text = "192.168.12"
                    GridView1.DataSourceID = "ObjectDataSource4"
                Case 8
                    Label3.Text = "192.168.13"
                    GridView1.DataSourceID = "ObjectDataSource4"
                Case 9
                    GridView1.DataSourceID = "ObjectDataSource37"
                Case 10
                    GridView1.DataSourceID = "ObjectDataSource80"
            End Select
        Else
            Select Case DropDownList1.SelectedIndex
                Case 0
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource59"
                        Case 2
                            GridView1.DataSourceID = "AnyUpdateWithError"
                        Case 3
                            GridView1.DataSourceID = "AnyUpdateNeeded"
                        Case 4
                            GridView1.DataSourceID = "AnyUpdateWithNoStatus"
                        Case 5
                            GridView1.DataSourceID = "AnyDownloadStatus"
                        Case 6
                            GridView1.DataSourceID = "AnyPendingReboot"
                        Case 7
                            GridView1.DataSourceID = "AnySavStatus"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource66"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource73"
                        Case 10
                            GridView1.DataSourceID = "AnyInactive"
                        Case 11
                            GridView1.DataSourceID = "AnyUnregisteredIP"
                        Case 12
                            GridView1.DataSourceID = "AnyUnregisteredDevice"
                        Case 13
                            GridView1.DataSourceID = "AnyUnregisteredMac"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource108"
                    End Select

                Case 1
                    Label3.Text = "D"
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource60"
                        Case 2
                            GridView1.DataSourceID = "DesktopLaptopUpdateWithError"
                        Case 3
                            GridView1.DataSourceID = "DesktopLaptopUpdatesNeeded"
                        Case 4
                            GridView1.DataSourceID = "DesktopLaptopUpdatesWithNoStatus"
                        Case 5
                            GridView1.DataSourceID = "DesktopLaptopDownloadStatus"
                        Case 6
                            GridView1.DataSourceID = "DesktopLaptopPendingReboot"
                        Case 7
                            GridView1.DataSourceID = "DesktopLaptopSavStatus"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource67"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource74"
                        Case 10
                            GridView1.DataSourceID = "DesktopLaptopInactive"
                        Case 11
                            GridView1.DataSourceID = "DesktopLaptopUnregisteredIP"
                        Case 12
                            GridView1.DataSourceID = "DesktopLaptopUnregisteredDevice"
                        Case 13
                            GridView1.DataSourceID = "DesktopLaptopUnregisteredMac"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource109"
                    End Select

                Case 2
                    Label3.Text = "L"
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource60"
                        Case 2
                            GridView1.DataSourceID = "DesktopLaptopUpdateWithError"
                        Case 3
                            GridView1.DataSourceID = "DesktopLaptopUpdatesNeeded"
                        Case 4
                            GridView1.DataSourceID = "DesktopLaptopUpdatesWithNoStatus"
                        Case 5
                            GridView1.DataSourceID = "DesktopLaptopDownloadStatus"
                        Case 6
                            GridView1.DataSourceID = "DesktopLaptopPendingReboot"
                        Case 7
                            GridView1.DataSourceID = "DesktopLaptopSavStatus"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource67"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource74"
                        Case 10
                            GridView1.DataSourceID = "DesktopLaptopInactive"
                        Case 11
                            GridView1.DataSourceID = "DesktopLaptopUnregisteredIP"
                        Case 12
                            GridView1.DataSourceID = "DesktopLaptopUnregisteredDevice"
                        Case 13
                            GridView1.DataSourceID = "DesktopLaptopUnregisteredMac"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource109"
                    End Select

                Case 3
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource61"
                        Case 2
                            GridView1.DataSourceID = "ObjectDataSource52"
                        Case 3
                            GridView1.DataSourceID = "ObjectDataSource53"
                        Case 4
                            GridView1.DataSourceID = "ObjectDataSource54"
                        Case 5
                            GridView1.DataSourceID = "ObjectDataSource55"
                        Case 6
                            GridView1.DataSourceID = "ObjectDataSource56"
                        Case 7
                            GridView1.DataSourceID = "ObjectDataSource57"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource68"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource75"
                        Case 10
                            GridView1.DataSourceID = "ObjectDataSource51"
                        Case 11
                            GridView1.DataSourceID = "ObjectDataSource49"
                        Case 12
                            GridView1.DataSourceID = "ObjectDataSource50"
                        Case 13
                            GridView1.DataSourceID = "ObjectDataSource58"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource110"
                    End Select

                Case 4
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource62"
                        Case 2
                            GridView1.DataSourceID = "ObjectDataSource9"
                        Case 3
                            GridView1.DataSourceID = "ObjectDataSource10"
                        Case 4
                            GridView1.DataSourceID = "ObjectDataSource11"
                        Case 5
                            GridView1.DataSourceID = "ObjectDataSource12"
                        Case 6
                            GridView1.DataSourceID = "ObjectDataSource13"
                        Case 7
                            GridView1.DataSourceID = "ObjectDataSource14"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource69"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource76"
                        Case 10
                            GridView1.DataSourceID = "ObjectDataSource8"
                        Case 11
                            GridView1.DataSourceID = "ObjectDataSource6"
                        Case 12
                            GridView1.DataSourceID = "ObjectDataSource7"
                        Case 13
                            GridView1.DataSourceID = "ObjectDataSource15"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource111"
                    End Select
                Case 5
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource95"
                        Case 2
                            GridView1.DataSourceID = "ObjectDataSource96"
                        Case 3
                            GridView1.DataSourceID = "ObjectDataSource97"
                        Case 4
                            GridView1.DataSourceID = "ObjectDataSource98"
                        Case 5
                            GridView1.DataSourceID = "ObjectDataSource99"
                        Case 6
                            GridView1.DataSourceID = "ObjectDataSource100"
                        Case 7
                            GridView1.DataSourceID = "ObjectDataSource101"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource102"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource103"
                        Case 10
                            GridView1.DataSourceID = "ObjectDataSource104"
                        Case 11
                            GridView1.DataSourceID = "ObjectDataSource105"
                        Case 12
                            GridView1.DataSourceID = "ObjectDataSource106"
                        Case 13
                            GridView1.DataSourceID = "ObjectDataSource107"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource112"
                    End Select
                Case 6
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource63"
                        Case 2
                            GridView1.DataSourceID = "ObjectDataSource19"
                        Case 3
                            GridView1.DataSourceID = "ObjectDataSource20"
                        Case 4
                            GridView1.DataSourceID = "ObjectDataSource21"
                        Case 5
                            GridView1.DataSourceID = "ObjectDataSource22"
                        Case 6
                            GridView1.DataSourceID = "ObjectDataSource23"
                        Case 7
                            GridView1.DataSourceID = "ObjectDataSource24"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource70"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource77"
                        Case 10
                            GridView1.DataSourceID = "ObjectDataSource18"
                        Case 11
                            GridView1.DataSourceID = "ObjectDataSource16"
                        Case 12
                            GridView1.DataSourceID = "ObjectDataSource17"
                        Case 13
                            GridView1.DataSourceID = "ObjectDataSource25"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource116"
                    End Select

                Case 7
                    Label3.Text = "192.168.12"
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource64"
                        Case 2
                            GridView1.DataSourceID = "ObjectDataSource29"
                        Case 3
                            GridView1.DataSourceID = "ObjectDataSource30"
                        Case 4
                            GridView1.DataSourceID = "ObjectDataSource31"
                        Case 5
                            GridView1.DataSourceID = "ObjectDataSource32"
                        Case 6
                            GridView1.DataSourceID = "ObjectDataSource33"
                        Case 7
                            GridView1.DataSourceID = "ObjectDataSource34"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource71"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource78"
                        Case 10
                            GridView1.DataSourceID = "ObjectDataSource28"
                        Case 11
                            GridView1.DataSourceID = "ObjectDataSource26"
                        Case 12
                            GridView1.DataSourceID = "ObjectDataSource27"
                        Case 13
                            GridView1.DataSourceID = "ObjectDataSource35"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource113"
                    End Select

                Case 8
                    Label3.Text = "192.168.13"
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource64"
                        Case 2
                            GridView1.DataSourceID = "ObjectDataSource29"
                        Case 3
                            GridView1.DataSourceID = "ObjectDataSource30"
                        Case 4
                            GridView1.DataSourceID = "ObjectDataSource31"
                        Case 5
                            GridView1.DataSourceID = "ObjectDataSource32"
                        Case 6
                            GridView1.DataSourceID = "ObjectDataSource33"
                        Case 7
                            GridView1.DataSourceID = "ObjectDataSource34"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource71"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource78"
                        Case 10
                            GridView1.DataSourceID = "ObjectDataSource28"
                        Case 11
                            GridView1.DataSourceID = "ObjectDataSource26"
                        Case 12
                            GridView1.DataSourceID = "ObjectDataSource27"
                        Case 13
                            GridView1.DataSourceID = "ObjectDataSource35"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource113"
                    End Select

                Case 9
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource65"
                        Case 2
                            GridView1.DataSourceID = "ObjectDataSource41"
                        Case 3
                            GridView1.DataSourceID = "ObjectDataSource42"
                        Case 4
                            GridView1.DataSourceID = "ObjectDataSource43"
                        Case 5
                            GridView1.DataSourceID = "ObjectDataSource44"
                        Case 6
                            GridView1.DataSourceID = "ObjectDataSource45"
                        Case 7
                            GridView1.DataSourceID = "ObjectDataSource46"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource72"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource79"
                        Case 10
                            GridView1.DataSourceID = "ObjectDataSource40"
                        Case 11
                            GridView1.DataSourceID = "ObjectDataSource38"
                        Case 12
                            GridView1.DataSourceID = "ObjectDataSource39"
                        Case 13
                            GridView1.DataSourceID = "ObjectDataSource47"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource114"
                    End Select
                Case 10
                    Select Case DropDownList2.SelectedIndex
                        Case 1
                            GridView1.DataSourceID = "ObjectDataSource81"
                        Case 2
                            GridView1.DataSourceID = "ObjectDataSource82"
                        Case 3
                            GridView1.DataSourceID = "ObjectDataSource83"
                        Case 4
                            GridView1.DataSourceID = "ObjectDataSource84"
                        Case 5
                            GridView1.DataSourceID = "ObjectDataSource85"
                        Case 6
                            GridView1.DataSourceID = "ObjectDataSource86"
                        Case 7
                            GridView1.DataSourceID = "ObjectDataSource87"
                        Case 8
                            GridView1.DataSourceID = "ObjectDataSource88"
                        Case 9
                            GridView1.DataSourceID = "ObjectDataSource89"
                        Case 10
                            GridView1.DataSourceID = "ObjectDataSource90"
                        Case 11
                            GridView1.DataSourceID = "ObjectDataSource91"
                        Case 12
                            GridView1.DataSourceID = "ObjectDataSource92"
                        Case 13
                            GridView1.DataSourceID = "ObjectDataSource93"
                        Case 14
                            GridView1.DataSourceID = "ObjectDataSource114"
                    End Select
            End Select

        End If
        GridView1.DataBind()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Label3.Text = "%" & UCase(TextBox1.Text.Trim) & "%"
        GridView1.DataSourceID = "ObjectDataSource36"
        GridView1.DataBind()
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub UpdateCsvSelectedError()

        Dim strConnStr As String
        strConnStr = "Data Source=SESLSVRHO;User ID=scheme;Password=Er1c550n2;initial catalog=SES"
        Dim MySqlConn As New SqlConnection(strConnStr)

        Dim cmdUpdate As New SqlCommand

        cmdUpdate.CommandText = "update and_csv_selected_error set selected_device = '" & _
                                    DropDownList1.SelectedItem.Text.Trim & "', selected_error = '" & _
                                    DropDownList2.SelectedItem.Text.Trim & "' where userid = '" & pubUser.Trim & "'"

        cmdUpdate.Connection = MySqlConn
        cmdUpdate.Connection.Open()
        cmdUpdate.ExecuteNonQuery()
        MySqlConn.Close()

    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            pubGridCount = pubGridCount + 1
            If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "updates_needed")) Then
                If Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "updates_needed")) = 0 Then
                    e.Row.Cells(7).Text = ""
                End If
            End If
            If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "updates_with_nostatus")) Then
                If Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "updates_with_nostatus")) = 0 Then
                    e.Row.Cells(8).Text = ""
                End If
            End If

        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(0).Text = "Count :"
            ' for the Footer, display the running totals
            e.Row.Cells(1).Text = pubGridCount.ToString("d")

            e.Row.Cells(1).HorizontalAlign = HorizontalAlign.Center
            e.Row.Font.Bold = True

            e.Row.Cells(10).Text = "Last Update:"
            e.Row.Cells(11).Text = Label5.Text.Trim

            'e.Row.Cells(5).Font.Name = "Verdana"
            'e.Row.Cells(5).Font.Size = 10

        End If


    End Sub

    Private Sub GetLastUpdateDateTime()

        Dim ConnStr As String
        Dim sSql As String

        ConnStr = "Data Source=SESLSVRHO;User ID=scheme;Password=Er1c550n2;initial catalog=SES"
        Dim MySqlConn As New SqlConnection(ConnStr)
        MySqlConn.Open()
        Try

            sSql = "Select update_date, update_time from and_csv_lastupdate"

            Dim MySqlCmd As New SqlCommand(sSql, MySqlConn)
            Dim mReader As SqlDataReader

            mReader = MySqlCmd.ExecuteReader()
            If mReader.HasRows Then
                While mReader.Read()
                    Label5.Text = Format(mReader("update_date"), "dd MMM yyyy") & "  " & Format(mReader("update_time"), "hh:mm")
                End While
            End If

        Catch ex As Exception

        Finally
            MySqlConn.Close()
        End Try

    End Sub

End Class
