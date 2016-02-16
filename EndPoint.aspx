<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EndPoint.aspx.vb" Inherits="EndPoint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>EndPoint Protection</title>
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
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="ObjectDataSource1" ForeColor="Black" GridLines="None" Width="100%">
            <Columns>
                <asp:BoundField DataField="Computer Name" HeaderText="Computer Name" SortExpression="Computer Name" />
                <asp:BoundField DataField="Current User" HeaderText="Current User" SortExpression="Current User" />
                <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Last Update Time" HeaderText="Last Update Time" SortExpression="Last Update Time" />
                <asp:BoundField DataField="Auto-Protect on" HeaderText="Auto-Protect on" SortExpression="Auto-Protect on" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Infected" HeaderText="Infected" SortExpression="Infected" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Last Scan Time" HeaderText="Last Scan Time" SortExpression="Last Scan Time" />
                <asp:BoundField DataField="Last Virus Time" HeaderText="Last Virus Time" SortExpression="Last Virus Time" />
                <asp:BoundField DataField="Antivirus engine on" HeaderText="Antivirus engine on"
                    SortExpression="Antivirus engine on" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Tamper Protection On" HeaderText="Tamper Protection On"
                    SortExpression="Tamper Protection On" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Restart Required" HeaderText="Restart Required" SortExpression="Restart Required" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="IP Address1" HeaderText="IP Address" SortExpression="IP Address1" />
                <asp:BoundField DataField="Gateway1" HeaderText="Gateway" SortExpression="Gateway1" />
                <asp:BoundField DataField="MAC Address1" HeaderText="MAC Address" SortExpression="MAC Address1" />
                <asp:BoundField DataField="DNS server 1" HeaderText="DNS server" SortExpression="DNS server 1" />
                <asp:BoundField DataField="Network Threat Protection On" HeaderText="Network Threat Protection On"
                    SortExpression="Network Threat Protection On" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
		<asp:BoundField DataField="Group Name" HeaderText="Group Name" SortExpression="Group Name" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataSymantecEndPoint" TypeName="SymantecListTableAdapters.and_csv_antivirusTableAdapter">
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
