<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .lblTitle {
            font-size: xx-large;
            color: #FFFF66;
            background-color: #003399;
            padding:5px;
            margin:10px;
        }
        .auto-style2 {
            font-size: large;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            font-size: large;
            color: #9900CC;
        }
        .btn
        {
            width:90px;
            border-radius:7px;
            background-color:navy;
            color:lightblue;
            padding:5px;
            font-size:15px;
            font-weight:bold;
        
        }
        .txtAll
        {
            width:200px;
            text-align:center;
        }
        .auto-style5 {
            font-size: medium;
        }
        .gvsearch
        {
            margin 0 auto;    
        }
        .auto-style6 {
            width: 207px;
        }
        .auto-style7 {
            width: 19px;
        }
        .auto-style8 {
            height: 26px;
        }
        .auto-style9 {
            width: 207px;
            height: 26px;
        }
        .auto-style10 {
            width: 19px;
            height: 26px;
        }
        .auto-style11 {
            margin-left: 0px;
        }
        .auto-style12 {
            height: 26px;
            text-align: left;
        }
        .auto-style13 {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center">
                <tr>
                    <td class="auto-style3" colspan="5"><strong>
                        <asp:Label ID="Label1" runat="server" CssClass="lblTitle" Text="Employee Page"></asp:Label>
                        </strong></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style7" colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="5">
                        <table align="center">
                            <tr>
                                <td><strong>
                                    <asp:Label ID="Label2" runat="server" CssClass="auto-style2" Text="Employee Number:"></asp:Label>
                                    </strong></td>
                                <td>
                                    <asp:TextBox ID="txtNumber" runat="server" CssClass="txtAll" Enabled="False"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtNumber"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ValidationExpression="\d+" ControlToValidate="txtNumber"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>
                                    <asp:Label ID="Label3" runat="server" CssClass="auto-style2" Text="Employee Name:"></asp:Label>
                                    </strong></td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="txtAll"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td><strong>
                                    <asp:Label ID="Label4" runat="server" CssClass="auto-style2" Text="Address:"></asp:Label>
                                    </strong></td>
                                <td>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="txtAll"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td><strong>
                                    <asp:Label ID="Label5" runat="server" CssClass="auto-style2" Text="Salary:"></asp:Label>
                                    </strong></td>
                                <td>
                                    <asp:TextBox ID="txtSalary" runat="server" CssClass="txtAll"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtSalary"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ValidationExpression="\d+" ControlToValidate="txtSalary"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3" colspan="4"><strong>
                                    <asp:Label ID="lblMsg" runat="server" CssClass="auto-style4"></asp:Label>
                                    </strong></td>
                            </tr>
                            </table>
                    </td>
                </tr>
                <tr>
                                <td colspan="5">
                                    <table align="center">
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnNew" runat="server" Text="New*" CssClass="btn" CausesValidation="False" OnClick="btnNew_Click" />
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>
                                                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn" OnClick="btnAdd_Click" />
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>
                                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn" OnClick="btnEdit_Click" />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn" CausesValidation="False" OnClick="btnDelete_Click" />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                <asp:Button ID="btnFind" runat="server" Text="Find" CssClass="btn" CausesValidation="False" OnClick="btnFind_Click" />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                <asp:TextBox ID="txtNumFind" runat="server" CssClass="auto-style11" Height="16px" TextMode="Number" Width="44px">1</asp:TextBox>
                                            </td>
                                            <td class="auto-style13">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ValidationExpression="\d+" ControlToValidate="txtNumFind"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                <tr>
                    <td class="auto-style8"></td>
                    <td class="auto-style9"></td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style7" colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="5">
                        <table align="center">
                            <tr>
                                <td><strong>
                                    <asp:Label ID="Label6" runat="server" CssClass="auto-style2" Text="Search By:"></asp:Label>
                                    </strong></td>
                                <td colspan="2" class="auto-style3">
                                    <strong>
                                    <asp:RadioButtonList ID="rdoSearch" runat="server" RepeatDirection="Horizontal" CssClass="auto-style5">
                                        <asp:ListItem>Number</asp:ListItem>
                                        <asp:ListItem Selected="True">Name</asp:ListItem>
                                        <asp:ListItem>Address</asp:ListItem>
                                        <asp:ListItem>Salary</asp:ListItem>
                                    </asp:RadioButtonList>
                                    </strong>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>
                                    <asp:Label ID="Label7" runat="server" CssClass="auto-style2" Text="Search Text:"></asp:Label>
                                    </strong></td>
                                <td>
                                    <asp:TextBox ID="txtSearch" runat="server" Height="16px" Width="195px" CssClass="txtAll"></asp:TextBox>
                                </td>
                                <td>
                                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" CausesValidation="False" OnClick="btnSearch_Click" />
                                            </td>
                            </tr>
                            <tr>
                                <td class="auto-style3" colspan="3"><strong>
                                    <asp:Label ID="lblResult" runat="server" CssClass="auto-style2" Text="Result 0 Row(s)."></asp:Label>
                                    </strong></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:Panel ID="panelSearch" runat="server" BorderColor="#000099" BorderStyle="Solid" BorderWidth="3px" Height="223px" ScrollBars="Auto">
                            
                            <div class="auto-style3">
                                <strong>
                                <asp:GridView ID="gvSearch" runat="server" align="center" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="gvsearch" Height="16px" OnSelectedIndexChanged="gvSearch_SelectedIndexChanged" GridLines="Vertical">
                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                    <Columns>
                                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#000065" />
                                </asp:GridView>
                                </strong>
                            </div>
                           
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style7" colspan="3">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
