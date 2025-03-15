<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="task.aspx.cs" Inherits="Data_and_Web_Coursework.task" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TASK_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="TASK_ID" HeaderText="TASK_ID" ReadOnly="True" SortExpression="TASK_ID" />
                <asp:BoundField DataField="TASK_NAME" HeaderText="TASK_NAME" SortExpression="TASK_NAME" />
                <asp:BoundField DataField="START_DATE" HeaderText="START_DATE" SortExpression="START_DATE" />
                <asp:BoundField DataField="DUE_DATE" HeaderText="DUE_DATE" SortExpression="DUE_DATE" />
                <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" SortExpression="PROJECT_ID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TASK&quot; WHERE &quot;TASK_ID&quot; = :TASK_ID" InsertCommand="INSERT INTO &quot;TASK&quot; (&quot;TASK_ID&quot;, &quot;TASK_NAME&quot;, &quot;START_DATE&quot;, &quot;DUE_DATE&quot;, &quot;STATUS&quot;, &quot;PROJECT_ID&quot;) VALUES (:TASK_ID, :TASK_NAME, :START_DATE, :DUE_DATE, :STATUS, :PROJECT_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TASK&quot;" UpdateCommand="UPDATE &quot;TASK&quot; SET &quot;TASK_NAME&quot; = :TASK_NAME, &quot;START_DATE&quot; = :START_DATE, &quot;DUE_DATE&quot; = :DUE_DATE, &quot;STATUS&quot; = :STATUS, &quot;PROJECT_ID&quot; = :PROJECT_ID WHERE &quot;TASK_ID&quot; = :TASK_ID">
            <DeleteParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="START_DATE" Type="DateTime" />
                <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="STATUS" Type="String" />
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="START_DATE" Type="DateTime" />
                <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="STATUS" Type="String" />
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="TASK_ID" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                TASK_ID:
                <asp:Label ID="TASK_IDLabel1" runat="server" Text='<%# Eval("TASK_ID") %>' />
                <br />
                TASK_NAME:
                <asp:TextBox ID="TASK_NAMETextBox" runat="server" Text='<%# Bind("TASK_NAME") %>' />
                <br />
                START_DATE:
                <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE") %>' />
                <br />
                DUE_DATE:
                <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE") %>' />
                <br />
                STATUS:
                <asp:TextBox ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>' />
                <br />
                PROJECT_ID:
                <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                TASK_ID:
                <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' />
                <br />
                TASK_NAME:
                <asp:TextBox ID="TASK_NAMETextBox" runat="server" Text='<%# Bind("TASK_NAME") %>' />
                <br />
                START_DATE:
                <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE") %>' />
                <br />
                DUE_DATE:
                <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE") %>' />
                <br />
                STATUS:
                <asp:TextBox ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>' />
                <br />
                PROJECT_ID:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
