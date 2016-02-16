<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DesktopAndLaptop.aspx.vb" Inherits="DesktopAndLaptop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Desktop and Laptop</title>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None" Width="100%" AllowSorting="True">
            <RowStyle BackColor="#E3EAEB" />
            <Columns>
                <asp:BoundField DataField="computer_name" HeaderText="Computer Name" SortExpression="computer_name" />
                <asp:BoundField DataField="user_name" HeaderText="User" SortExpression="user_name" />
                <asp:BoundField DataField="tag" HeaderText="Tag" SortExpression="tag" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="con_tag" HeaderText="Conn" SortExpression="con_tag" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="specifications" HeaderText="Specifications" SortExpression="specifications" />
                <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                <asp:BoundField DataField="user_cc" HeaderText="Cc" SortExpression="user_cc" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="last_update" HeaderText="Last Update" SortExpression="last_update" />
                <asp:BoundField DataField="asset_no" HeaderText="Asset No." SortExpression="asset_no" />
                <asp:BoundField DataField="laptop_brand" HeaderText="Brand" SortExpression="laptop_brand" />
                <asp:BoundField DataField="laptop_serial" HeaderText="Serial No." SortExpression="laptop_serial" />
                <asp:BoundField DataField="login_name" HeaderText="Login Name" SortExpression="login_name" />
            </Columns>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataDesktopLaptopList" TypeName="DesktopLaptopListTableAdapters.and_csv_desktop_laptopTableAdapter">
        </asp:ObjectDataSource>    
    </div>
    </form>
</body>
</html>
