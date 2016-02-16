<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SoftwareUpdate.aspx.vb" Inherits="SoftwareUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Software Update</title>
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
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ObjectDataSource1" Width="100%">
            <RowStyle BackColor="White" ForeColor="#330099" />
            <Columns>
                <asp:BoundField DataField="FullDomainName" HeaderText="FullDomainName" SortExpression="FullDomainName" />
                <asp:BoundField DataField="IPAddress" HeaderText="IPAddress" SortExpression="IPAddress" />
                <asp:BoundField DataField="Installed_NA_Percent" HeaderText="Installed_NA_Percent"
                    SortExpression="Installed_NA_Percent">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Last_Status_Update" DataFormatString="{0:dd-MM-yyyy}"
                    HeaderText="Last_Status_Update" SortExpression="Last_Status_Update">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Status1" HeaderText="Update With Error" SortExpression="Status1">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Status2" HeaderText="Updates Needed" SortExpression="Status2">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Status3" HeaderText="Updates Installed" SortExpression="Status3">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Status4" HeaderText="Updates With No Status" SortExpression="Status4">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Status5" HeaderText="Downloaded Updates" SortExpression="Status5">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Status6" HeaderText="Pending Reboot" SortExpression="Status6">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="OS_Language" HeaderText="OS_Language" SortExpression="OS_Language" />
                <asp:BoundField DataField="Service_Pack" HeaderText="Service_Pack" SortExpression="Service_Pack" />
                <asp:BoundField DataField="Computer_Maker" HeaderText="Computer_Maker" SortExpression="Computer_Maker" />
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                <asp:BoundField DataField="Processor" HeaderText="Processor" SortExpression="Processor" />
                <asp:BoundField DataField="BIOS_ver" HeaderText="BIOS_ver" SortExpression="BIOS_ver" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" Height="80px" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSoftwareUpdateList" TypeName="SoftwareUpdateListTableAdapters.and_symantec_summarizedTableAdapter">
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
