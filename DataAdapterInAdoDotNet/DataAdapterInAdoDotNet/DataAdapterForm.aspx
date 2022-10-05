<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataAdapterForm.aspx.cs" Inherits="DataAdapterInAdoDotNet.DataAdapterForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
            <asp:GridView ID="GridView2" runat="server">
            </asp:GridView>
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnDataTable" runat="server" OnClick="btnDataTable_Click" Text="DataTable" />
            <asp:Button ID="btnDataSet" runat="server" OnClick="btnDataSet_Click" Text="DataSet" Width="85px" />
        </div>
    </form>
</body>
</html>
