<%@ Page Language="VB" masterpagefile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CompMgt.aspx.vb" Inherits="CompMgt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <atlas:ScriptManager ID="sl" EnablePartialRendering="true" runat="server"/>
    <atlas:UpdatePanel ID="pl1" runat="server">
    <ContentTemplate>
    
    <div class="header">

       <atlas:UpdateProgress ID="progress1" runat="server">
            <ProgressTemplate>
                <div class="progress" style="font-weight: bold; font-size: 8pt; left: 660px; color: #0033cc; font-family: Verdana; position: absolute; top: 20px;">
                    In Progress......<img src="images/in_progress.gif" />
                </div>
            
            </ProgressTemplate>
        
        </atlas:UpdateProgress>        
        <br />
        <table style="width: 1208px">
            <tr>
                <td style="width: 100px; height: 24px;">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="MidnightBlue" Text="Devices  :"
                        Width="64px"></asp:Label></td>
                <td style="width: 100px; height: 24px;">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" BackColor="Honeydew"
                        Width="176px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="0">Any</asp:ListItem>
                        <asp:ListItem Value="1">Desktop</asp:ListItem>
                        <asp:ListItem Value="2">Laptop</asp:ListItem>
                        <asp:ListItem Value="3">Servers</asp:ListItem>
                        <asp:ListItem Value="4">Other Devices</asp:ListItem>
                        <asp:ListItem Value="5">Desktop, Laptop, Servers</asp:ListItem>
                        <asp:ListItem Value="6">Riyadh</asp:ListItem>
                        <asp:ListItem Value="7">Jeddah</asp:ListItem>
                        <asp:ListItem Value="8">Dammam</asp:ListItem>
                        <asp:ListItem Value="9">Not Connected</asp:ListItem>
                        <asp:ListItem Value="10">Connected</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 100px; height: 24px; text-align: right;">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="MidnightBlue" Text="Errors :"
                        Width="62px"></asp:Label></td>
                <td style="width: 100px; height: 24px;">
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" BackColor="LemonChiffon">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="1">No Software Update</asp:ListItem>
                        <asp:ListItem Value="2">Update with Error</asp:ListItem>
                        <asp:ListItem Value="3">Update Needed</asp:ListItem>
                        <asp:ListItem Value="4">Updates with No Status</asp:ListItem>
                        <asp:ListItem Value="5">Downloaded Updates</asp:ListItem>
                        <asp:ListItem Value="6">Pending Reboot</asp:ListItem>
                        <asp:ListItem Value="7">No EndPoint Security</asp:ListItem>
                        <asp:ListItem Value="8">End Point Protection Off</asp:ListItem>
                        <asp:ListItem Value="9">Infected Computers</asp:ListItem>
                        <asp:ListItem Value="10">Inactive</asp:ListItem>
                        <asp:ListItem Value="11">Unregistered IP</asp:ListItem>
                        <asp:ListItem Value="12">Unregistered Device</asp:ListItem>
                        <asp:ListItem Value="13">Unregistered MAC Address</asp:ListItem>
                        <asp:ListItem Value="14">No IE8 Installed</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 100px; height: 24px">
                    <asp:Label ID="Label4" runat="server" Text="1" Visible="False"></asp:Label></td>
                <td style="width: 100px; height: 24px">
                    <asp:TextBox ID="TextBox1" runat="server" Width="186px"></asp:TextBox></td>
                <td style="width: 100px; height: 24px">
                    <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" /></td>
                <td style="width: 100px; height: 24px">
                    <asp:LinkButton ID="LinkButton2" runat="server" Width="105px" OnClick="LinkButton2_Click" OnClientClick="ViewDoc()">Desktop & Laptop</asp:LinkButton></td>
                <td style="width: 100px; height: 24px">
                    <asp:LinkButton ID="LinkButton3" runat="server" Width="97px" OnClientClick="ViewDoc2()">Software Update</asp:LinkButton></td>
                <td style="width: 100px; height: 24px">
                    <asp:LinkButton ID="LinkButton4" runat="server" Width="113px" OnClientClick="ViewDoc3()">EndPoint Protection</asp:LinkButton></td>
                <td style="width: 100px; height: 24px">
                    <asp:LinkButton ID="LinkButton5" runat="server" OnClientClick="ViewDoc4()">Errors</asp:LinkButton></td>
                <td style="width: 100px; height: 24px">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/mail_add.png"
                        ToolTip="Send E-mail" Visible="False" OnClick="ImageButton1_Click" OnClientClick="ViewDoc5()" /></td>
            </tr>
        </table>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                    BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px"
                    CellPadding="4" DataSourceID="ObjectDataSource116" GridLines="Horizontal" Width="100%" ShowFooter="True">
                    <RowStyle BackColor="GhostWhite" ForeColor="#333333" BorderColor="White" BorderStyle="Double" BorderWidth="1px" Height="28px" />
                    <Columns>
                        <asp:TemplateField HeaderText="Computer" SortExpression="computer_name">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                ForeColor="royalBlue" Text='<%# Bind("computer_name") %>' 
                            CommandArgument='<%# Eval("computer_name") %>'></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="source" HeaderText="Source" SortExpression="source" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                        <asp:BoundField DataField="desktop_laptop_tag" HeaderText="Tag" SortExpression="desktop_laptop_tag" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="desktop_laptop_user" HeaderText="Description"
                            SortExpression="desktop_laptop_user" />
                        <asp:BoundField DataField="client_ipaddress1" HeaderText="IP Address" SortExpression="client_ipaddress1" />
                        <asp:BoundField DataField="installed_na_percent" HeaderText="Installed %"
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
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource116" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataRiyadhNoIE8Installed" TypeName="RiyadhNoIE8InstalledTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource115" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataConnectedNoIE8Installed" TypeName="ConnectedNoIE8InstalledTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource114" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataNotConnNoIE8Installed" TypeName="NotConnNoIE8InstalledTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource113" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBranchNoIE8Installed" TypeName="BranchNoIE8InstalledTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="ip1" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource112" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopSvrNoIE8Installed" TypeName="DeskLaptopSvrNoIE8InstalledTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource111" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataOtherNoIE8Installed" TypeName="OtherNoIE8InstalledTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource110" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataServerNoIE8Installed" TypeName="ServerNoIE8InstalledTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource109" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopNoIE8Installed" TypeName="DeskLaptopNoIE8InstalledTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="DesktopLaptop" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource108" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataAnyNoIE8Installed" TypeName="AnyNoIE8InstalledTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource107" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopSvrUnregisteredMac" TypeName="DeskLaptopSvrUnregisteredMacTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource106" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopSvrUnregisteredDevice" TypeName="DeskLaptopSvrUnregisteredDeviceTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource105" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopSvr" TypeName="DeskLaptopSvrUnregisteredIPTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource104" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopSvrInactive" TypeName="DeskLaptopSvrInactiveTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource103" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopSvrInfected" TypeName="DeskLaptopSvrInfectedTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource102" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopSvrProtectionOff" TypeName="DeskLaptopSvrProtectionOffTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource101" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopSvrSavStatus" TypeName="DeskLaptopSvrSavStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource100" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopSvrPendingReboot" TypeName="DeskLaptopSvrPendingRebootTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource99" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopSvr" TypeName="DeskLaptopSvrDownloadStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource98" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopSvr" TypeName="DeskLaptopSvrUpdateWithNoStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource97" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopSvrUpdateNeeded" TypeName="DeskLaptopSvrUpdateNeededTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource96" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopSvrUpdateWithError" TypeName="DeskLaptopSvrUpdateWithErrorTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource95" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopSvrSoftwareUpdate" TypeName="DeskLaptopSvrSoftwareUpdateTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource94" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopServer" TypeName="DesktopLaptopServerTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource93" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataConnUnregisteredMac" TypeName="ConnectedUnregisteredMacAddressTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource92" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataConnUnregisteredDevice" TypeName="ConnectedUnregisteredDeviceTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource91" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataConnUnregisteredIP" TypeName="ConnectedUnregisteredIPTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource90" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataConnInactive" TypeName="ConnectedInactiveTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource89" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataConnInfected" TypeName="ConnectedInfectedTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource88" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataConnProtectionOff" TypeName="ConnectedProtectionOffTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource87" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataConnSavStatus" TypeName="ConnectedSavStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource86" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataConnPendingReboot" TypeName="ConnectedPendingRebootTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource85" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataConnDownloadStatus" TypeName="ConnectedDownloadStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource84" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataConnUpdateWithNoStatus" TypeName="ConnectedUpdateWithNoStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource83" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataConnUpdateNeeded" TypeName="ConnectedUpdateNeededTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource82" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataConnUpdateWithError" TypeName="ConnectedUpdateWithErrorTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource81" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataConnSoftwareUpdate" TypeName="ConnectedSoftwareUpdateTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource80" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataConnected" TypeName="ConnectedTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource79" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataNotConInfected" TypeName="NotConInfectedTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource78" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBranchesInfected" TypeName="BranchesInfectedTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="ip1" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource77" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataRiyadhInfected" TypeName="RiyadhInfectedTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource76" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataOtherInfected" TypeName="OtherInfectedTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource75" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataServerInfected" TypeName="ServerInfectedTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource74" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDesktopLaptopInfected" TypeName="DesktopLaptopInfectedTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="DesktopLaptop" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource73" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataAnyInfected" TypeName="AnyInfectedTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource72" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataNotConProtectionOff" TypeName="NotConProtectionOffTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource71" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBranchesProtectionOff" TypeName="BranchesProtectionOffTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="ip1" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource70" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataRiyadhProtectionOff" TypeName="RiyadhProtectionOffTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource69" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataOtherProtectionOff" TypeName="OtherProtectionOffTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource68" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataServerProtectionOff" TypeName="ServerProtectionOffTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource67" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDesktopLaptopProtectionOff" TypeName="DesktopLaptopProtectionOffTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="DesktopLaptop" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource66" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataAnyProtectionOff" TypeName="AnyProtectionOffTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource65" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataNotConSoftwareUpdate" TypeName="NotConSoftwareUpdateTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource64" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBranchSoftwareUpdate" TypeName="BranchSoftwareUpdateTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="ip1" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource63" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataRiyadhSoftwareUpdate" TypeName="RiyadhSoftwareUpdateTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource62" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataOtherSoftwareUpdate" TypeName="OtherSoftwareUpdateTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource61" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataServerSoftwareUpdate" TypeName="ServerSoftwareUpdateTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource60" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDesktopLaptopSoftwareUpdate" TypeName="DesktopLaptopSoftwareUpdateTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="DesktopLaptop" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource59" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataAnySoftwareUpdate" TypeName="AnySoftwareUpdateTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource58" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataServerUnregisteredMac" TypeName="ServerUnregisteredMacTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource57" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataServerSavStatus" TypeName="ServerSavStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource56" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataServerPendingReboot" TypeName="ServerPendingRebootTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource55" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataServerDownloadStatus" TypeName="ServerDownloadStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource54" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataServerUpdateWithNoStatus" TypeName="ServerUpdateWithNoStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource53" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataServerUpdatesNeeded" TypeName="ServerUpdatesNeededTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource52" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataServerUpdateWithError" TypeName="ServerUpdateWithErrorTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource51" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataServerInactive" TypeName="ServerInactiveTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource50" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataServerUnregisteredDevice" TypeName="ServerUnregisteredDeviceTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource49" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataServerUnregisteredIP" TypeName="ServerUnregisteredIPTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource48" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataServers" TypeName="ServersTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource47" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataNotConUnregisteredMac" TypeName="NotConUnregisteredMacTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource46" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataNotConSavStatus" TypeName="NotConSavStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource45" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataNotConPendingReboot" TypeName="NotConPendingRebootTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource44" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataNotConDownloadStatus" TypeName="NotConDownloadStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource43" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataNotConUpdateWithNoStatus" TypeName="NotConUpdateWithNoStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource42" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataNotConUpdateNeeded" TypeName="NotConUpdateNeededTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource41" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataNotConUpdateWithError" TypeName="NotConnUpdateWithErrorTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource40" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataNotConnInactive" TypeName="NotConnInactiveTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource39" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataNotConnUnregisteredDevice" TypeName="NotConnUnregisteredDeviceTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource38" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataNotConnUnregisteredIP" TypeName="NotConnUnregisteredIPTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource37" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataNotConnected" TypeName="NotConnectedTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource36" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataSearchComputer" TypeName="SearchComputerTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="SearchKey" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource35" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBranchUnregisteredMac" TypeName="BranchUnregisteredMacTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="ip1" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource34" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataSavStatus" TypeName="BranchSavStatusTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="ip1" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource33" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBranchPendingReboot" TypeName="BranchPendingRebootTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="ip1" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource32" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBranchDownloadStatus" TypeName="BranchDownloadStatusTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="ip1" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource31" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBranchUpdateWithNoStatus" TypeName="BranchUpdateWithNoStatusTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="ip1" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource30" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBranchUpdateNeeded" TypeName="BranchUpdateNeededTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="ip1" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource29" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBranchUpdateWithError" TypeName="BranchUpdateWithErrorTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="ip1" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource28" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBranchInactive" TypeName="BranchInactiveTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="ip1" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource27" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBranchUnregisteredDevice" TypeName="BranchUnregisteredDeviceTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="ip1" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource26" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBranchUnregisteredIP" TypeName="BranchUnregisteredIPTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="ip1" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource25" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataRiyadhUnregisteredMac" TypeName="RiyadhUnregisteredMacTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource24" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataRiyadhSavStatus" TypeName="RiyadhSavStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource23" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataRiyadhPendingReboot" TypeName="RiyadhPendingRebootTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource22" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataRiyadhDownloadStatus" TypeName="RiyadhDownloadStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource21" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataRiyadhUpdateWithNoStatus" TypeName="RiyadhUpdateWithNoStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource20" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataRiyadhUpdateNeeded" TypeName="RiyadhUpdateNeededTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource19" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataRiyadhUpdateWithError" TypeName="RiyadhUpdateWithErrorTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource18" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataRiyadhInactive" TypeName="RiyadhInactiveTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource17" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataRiyadhUnregisteredDevice" TypeName="RiyadhUnregisteredDeviceTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource16" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataRiyadhUnregisteredIP" TypeName="RiyadhUnregisteredIPTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource15" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataOtherUnregisteredMAc" TypeName="OtherUnregisteredMacTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource14" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataOtherSVStatus" TypeName="OtherSavStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource13" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataOtherPendingReboot" TypeName="OtherPendingRebootTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource12" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDownloadStatus" TypeName="OtherDownloadStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource11" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataOtherUpdateWithNoStatus" TypeName="OtherUpdateWithNoStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource10" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataOtherUpdateNeeded" TypeName="OtherUpdateNeededTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource9" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataOtherUpdateWithError" TypeName="OtherUpdateWithErrorTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource8" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataOtherInactive" TypeName="OtherInactiveTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataOtherUnregisteredDevice" TypeName="OtherUnregisteredDeviceTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataOtherUnregisteredIP" TypeName="OtherUnregisteredIPTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DesktopLaptopUnregisteredMac" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopUnregisteredMac" TypeName="DeskLaptopUnregisteredMacTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="DesktopLaptop" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DesktopLaptopSavStatus" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopSvStatus" TypeName="DeskLaptopSvStatusTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="DesktopLaptop" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DesktopLaptopPendingReboot" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopPendingReboot" TypeName="DeskLaptopPendingRebootTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="DesktopLaptop" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DesktopLaptopDownloadStatus" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopDownloadStatus" TypeName="DeskLaptopDownloadStatusTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="DesktopLaptop" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DesktopLaptopUpdatesWithNoStatus" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopUpdatesWithNoStatus" TypeName="DesktopLaptopUpdatesWithNoStatusTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="DesktopLaptop" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DesktopLaptopUpdatesNeeded" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopUpdatesNeeded" TypeName="DeskLaptopUpdatesNeededTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="DesktopLaptop" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DesktopLaptopUpdateWithError" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopUpdateWithError" TypeName="DeskLaptopUpdateWithErrorTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="DesktopLaptop" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DesktopLaptopInactive" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopInactive" TypeName="DesktopLaptopInactiveTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="DesktopLaptop" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DesktopLaptopUnregisteredDevice" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopUnregisteredDevice" TypeName="DeskLaptopUnregisteredDeviceTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="DesktopLaptop" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DesktopLaptopUnregisteredIP" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDeskLaptopUnregisteredIP" TypeName="DeskLaptopUnregisteredIPTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="DesktopLaptop" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="AnyUnregisteredMac" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataAnyUnregisteredMac" TypeName="AnyUnregisteredMacTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="AnySavStatus" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataAnySavStatus" TypeName="AnySavStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="AnyPendingReboot" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataAnyPendingReboot" TypeName="AnyPendingRebootTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="AnyDownloadStatus" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataAnyDownloadStatus" TypeName="AnyDownloadStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="AnyUpdateWithNoStatus" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataAnyUpdateWithNoStatus" TypeName="AnyUpdateWithNoStatusTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="AnyUpdateNeeded" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataAnyUpdateNeeded" TypeName="AnyUpdateNeededTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="AnyUpdateWithError" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataAnyUpdateWithError" TypeName="AnyUpdateWithErrorTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="AnyInactive" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataAnyInactive" TypeName="AnyInactiveTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="AnyUnregisteredDevice" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataAnyUnregisteredDevice" TypeName="AnyUnregisteredDeviceTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="AnyUnregisteredIP" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataAnyUnregisteredIP" TypeName="AnyUnregisteredIPTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataRiyadhBranch" TypeName="RiyadhBranchTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBranches" TypeName="BranchesTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="ip1" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataOtherDevices" TypeName="OtherDevicesTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataDesktopLaptop" TypeName="DesktopLaptopTableAdapters.and_csv_consolidatedTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="DesktopLaptop" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataComputerLists" TypeName="ComputerListsTableAdapters.and_csv_consolidatedTableAdapter">
                </asp:ObjectDataSource>
            </asp:View>
            <asp:View ID="View2" runat="server">
            </asp:View>
            
        
        
        
        </asp:MultiView>
        <asp:Label id="Label3" runat="server" Text="D" Visible="False" Width="76px"></asp:Label>
        <asp:Label ID="Label5" runat="server" Visible="False" Width="136px"></asp:Label></div>            
        
</ContentTemplate>   
</atlas:UpdatePanel>    
   
</asp:Content>        

