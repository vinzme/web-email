<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SelectAndEmail.aspx.vb" Inherits="SelectAndEmail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
<script> 
if(!window.opener){ 
newWin=window.open (this.location,'newwindow','toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,fullscreen=no,directories=no,status=no') 
newWin.moveTo(0,0); 
newWin.resizeTo(screen.availWidth,screen.availHeight) 
window.opener='a'; 
window.close(); 
}
</script>                
</head>
<body style="background-color: honeydew">
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource29" ForeColor="#333333" GridLines="None" Width="100%">
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="False" />
                    </ItemTemplate>                        
                </asp:TemplateField>            
                <asp:BoundField DataField="computer_name" HeaderText="Computer" SortExpression="computer_name" />
                <asp:BoundField DataField="source" HeaderText="Source" SortExpression="source" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="desktop_laptop_tag" HeaderText="Tag" SortExpression="desktop_laptop_tag" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="desktop_laptop_user" HeaderText="Description"
                    SortExpression="desktop_laptop_user" />
                <asp:BoundField DataField="client_ipaddress1" HeaderText="Ip Address" SortExpression="client_ipaddress1" />
                <asp:BoundField DataField="installed_na_percent" HeaderText="Installed Na Percent"
                    SortExpression="installed_na_percent" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="updates_needed" HeaderText="Needed" SortExpression="updates_needed">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="updates_with_nostatus" HeaderText="No Status" SortExpression="updates_with_nostatus">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="last_status_update" HeaderText="Last Status Update" SortExpression="last_status_update" DataFormatString="{0:dd-MM-yyyy}" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="sv_version" HeaderText="SV Version" SortExpression="sv_version" />
                <asp:BoundField DataField="sv_last_update" HeaderText="SV Last Update" SortExpression="sv_last_update" DataFormatString="{0:dd-MM-yyyy}" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="login_name" HeaderText="Login Name" SortExpression="login_name" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource29" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailEndPointDesktop" TypeName="SelectEmailUpdateEndPointDesktopTableAdapters.DataTable1TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="DesktopLaptop" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource28" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailNoIE8Installed" TypeName="SelectEmailNoIE8InstalledConnectedTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource27" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailNoIE8InstalledBranch" TypeName="SelectEmailNoIE8InstalledBranchTableAdapters.DataTable1TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="BranchIp" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource26" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailNoIE8InstalledRiyadh" TypeName="SelectEmailNoIE8InstalledRiyadhTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource25" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailNoIE8InstalledDeskLaptopSvr" TypeName="SelectEmailNoIE8InstalledDeskLaptopSvrTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource24" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailNoIE8InstalledOther" TypeName="SelectEmailNoIE8InstalledOtherTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource23" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailNoIE8InstalledDesktopLaptop" TypeName="SelectEmailNoIE8InstalledDesktopLaptopTableAdapters.DataTable1TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="DesktopLaptop" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource22" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailNoIE8Installed" TypeName="SelectEmailNoIE8InstalledTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource21" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailPendingRebootDeskLaptopSvr" TypeName="SelectEmailPendingRebootDeskLaptopSvrTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource20" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailDownloadStatusDeskLaptopSvr" TypeName="SelectEmailDownloadStatusDeskLaptopSvrTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource19" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailUpdateNoStatusDeskLapSvr" TypeName="SelectEmailUpdateNoStatusDeskLaptopSvrTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource18" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailPendingRebootConn" TypeName="SelectEmailPendingRebootConnectedTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource17" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailNoStatusConn" TypeName="SelectEmailUpdateNoStatusConnTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource16" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailDownloadStatusConn" TypeName="SelectEmailDownloadStatusConnTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource15" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailPendingRebootBranch" TypeName="SelectEmailPendingRebootBranchTableAdapters.DataTable1TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="BranchIp" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource14" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailPendingRebootRiyadh" TypeName="SelectEmailPendingRebootRiyadhTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource13" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailPendingRebootOther" TypeName="SelectEmailPendingRebootOtherTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource12" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailPendingRebootDeskLaptop" TypeName="SelectEmailPendingRebootDeskLaptopTableAdapters.DataTable1TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="DesktopLaptop" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource11" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailDownloadStatusBranches" TypeName="SelectEmailDownloadStatusBranchesTableAdapters.DataTable1TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="BranchIp" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource10" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailDownloadStatusRiyadh" TypeName="SelectEmailDownloadStatusRiyadhTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource9" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailDownloadStatusOther" TypeName="SelectEmailDownloadStatusOtherTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource8" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailDownloadStatusDeskLaptop" TypeName="SelectEmailDownloadStatusDeskLaptopTableAdapters.DataTable1TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="DesktopLaptop" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailUpdateWithNoStatusBranches" TypeName="SelectEmailUpdateWithNoStatusBranchesTableAdapters.DataTable1TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="BranchIp" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailUpdateWithNoStatusRiyadh" TypeName="SelectEmailUpdateWithNoStatusRiyadhTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailUpdatesWithNoStatusOther" TypeName="SelectEmailUpdateWithNoStatusOtherTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailUpdateWithNoStatusDesktop" TypeName="SelectEmailUpdateWithNoStatusDeskLaptopTableAdapters.DataTable1TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="DesktopLaptop" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailPendingReboot" TypeName="SelectEmailPendingRebootTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailDownloadStatus" TypeName="SelectEmailDownloadStatusTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSelectEmailUpdateWithNoStatus" TypeName="SelectEmailUpdateWithNoStatusTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        <br />
        <table style="width: 640px">
            <tr>
                <td style="width: 100px">
                    <asp:Button ID="Button1" runat="server" Text="Check All" Width="88px" /></td>
                <td style="width: 100px">
                    <asp:Button ID="Button2" runat="server" Text="UnCheck All" Width="92px" /></td>
                <td style="width: 100px">
                    <asp:Label ID="Label1" runat="server" Width="104px" Visible="False"></asp:Label></td>
                <td style="width: 100px">
                    <asp:Button ID="Button3" runat="server" Text="Send Email" Width="103px" /></td>
                <td style="width: 100px">
                    <asp:Label ID="Label2" runat="server" Text="Send Email" Visible="False" Width="185px"></asp:Label></td>
            </tr>
        </table>
    </div>
        <asp:Label ID="Label3" runat="server" ForeColor="Honeydew" Visible="False" Width="273px"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Height="64px" TextMode="MultiLine" Visible="False"
            Width="352px"></asp:TextBox>
    </form>
</body>
</html>
