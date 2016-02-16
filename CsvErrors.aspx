<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CsvErrors.aspx.vb" Inherits="CsvErrors" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Errors</title>
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
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="computer_name" HeaderText="Computer" SortExpression="computer_name" />
                <asp:BoundField DataField="update_date" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Update Date"
                    SortExpression="update_date">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="update_time" HeaderText="Update Time" SortExpression="update_time">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="file_date" DataFormatString="{0:dd-MM-yyyy}" HeaderText="File Date"
                    SortExpression="file_date">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="file_time" HeaderText="File Time" SortExpression="file_time">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="log_source" HeaderText="Source" SortExpression="log_source" />
                <asp:BoundField DataField="log_description" HeaderText="Description" SortExpression="log_description" />
                <asp:BoundField DataField="value_desc" HeaderText="Value" SortExpression="value_desc" />
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataErrors" TypeName="ErrorsTableAdapters.and_csv_errorTableAdapter">
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
