<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Data_and_Web_Coursework.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        .card {
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .table-container {
            margin-top: 20px;
            margin-bottom: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .section-title {
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #dee2e6;
        }
        .dropdown-container {
            margin-bottom: 15px;
        }
    </style>
</head>
<body class="bg-light">
    <!-- Header Section -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top mb-4">
        <div class="container">
            <a class="navbar-brand" href="/">
                <i class="bi bi-kanban me-2"></i>Project Management System
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a href="./user.aspx" class="nav-link"><i class="bi bi-people me-1"></i>Users</a></li>
                    <li class="nav-item"><a href="./project.aspx" class="nav-link"><i class="bi bi-briefcase me-1"></i>Projects</a></li>
                    <li class="nav-item"><a href="./task.aspx" class="nav-link"><i class="bi bi-list-task me-1"></i>Tasks</a></li>
                    <li class="nav-item"><a href="./subtask.aspx" class="nav-link"><i class="bi bi-list-check me-1"></i>Subtasks</a></li>
                    <li class="nav-item"><a href="./milestone.aspx" class="nav-link"><i class="bi bi-flag me-1"></i>Milestones</a></li>
                    <li class="nav-item"><a href="./dashboard.aspx" class="nav-link active" aria-current="page"><i class="bi bi-speedometer2 me-1"></i>Dashboard</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
    <!-- Page Title -->
    <div class="row mb-4">
        <div class="col">
            <h2>Dashboard</h2>
            <p class="text-muted">Dashboard and Complex Forms</p>
        </div>
    </div>
        
        <form id="form1" runat="server">
            <!-- First Section: User Projects -->
            <div class="table-container">
                <h3 class="section-title"><i class="bi bi-person-workspace me-2"></i>User Projects</h3>
                
                <div class="dropdown-container">
                    <label for="DropDownList1" class="form-label">Select User:</label>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="USER_NAME" DataValueField="USER_ID" CssClass="form-select">
                    </asp:DropDownList>
                </div>
                
                <div class="table-responsive">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT u.USER_ID, u.USER_NAME, u.USER_EMAIL, u.USER_CONTACT, p.PROJECT_ID, p.PROJECT_NAME, p.START_DATE, p.END_DATE, p.PROJECT_STATUS FROM USERS u, USER_PROJECT_TASK upt, PROJECT p WHERE u.USER_ID = upt.USER_ID AND upt.PROJECT_ID = p.PROJECT_ID AND (u.USER_ID = :users)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="users" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID,PROJECT_ID" DataSourceID="SqlDataSource1"
                        CssClass="table table-striped table-hover" HeaderStyle-CssClass="table-dark">
                        <Columns>
                            <asp:BoundField DataField="USER_ID" HeaderText="USER ID" ReadOnly="True" SortExpression="USER_ID" />
                            <asp:BoundField DataField="USER_NAME" HeaderText="USER NAME" SortExpression="USER_NAME" />
                            <asp:BoundField DataField="USER_EMAIL" HeaderText="EMAIL" SortExpression="USER_EMAIL" />
                            <asp:BoundField DataField="USER_CONTACT" HeaderText="CONTACT" SortExpression="USER_CONTACT" />
                            <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                            <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT NAME" SortExpression="PROJECT_NAME" />
                            <asp:BoundField DataField="START_DATE" HeaderText="START DATE" SortExpression="START_DATE" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="END_DATE" HeaderText="END DATE" SortExpression="END_DATE" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="PROJECT_STATUS" HeaderText="STATUS" SortExpression="PROJECT_STATUS" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            
            <!-- Second Section: Project Milestones -->
            <div class="table-container">
                <h3 class="section-title"><i class="bi bi-flag-fill me-2"></i>Project Milestones</h3>
                
                <div class="dropdown-container">
                    <label for="DropDownList2" class="form-label">Select Project:</label>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" CssClass="form-select">
                    </asp:DropDownList>
                </div>
                
                <div class="table-responsive">
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT p.PROJECT_ID, p.PROJECT_NAME, p.START_DATE, p.END_DATE, p.PROJECT_STATUS, m.MILESTONE_ID, m.MILESTONE_NAME, m.DUE_DATE FROM PROJECT p, MILESTONE m WHERE p.PROJECT_ID = m.PROJECT_ID AND (p.PROJECT_ID = :project)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" Name="project" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID,MILESTONE_ID" DataSourceID="SqlDataSource3"
                        CssClass="table table-striped table-hover" HeaderStyle-CssClass="table-dark">
                        <Columns>
                            <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                            <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT NAME" SortExpression="PROJECT_NAME" />
                            <asp:BoundField DataField="START_DATE" HeaderText="START DATE" SortExpression="START_DATE" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="END_DATE" HeaderText="END DATE" SortExpression="END_DATE" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="PROJECT_STATUS" HeaderText="STATUS" SortExpression="PROJECT_STATUS" />
                            <asp:BoundField DataField="MILESTONE_ID" HeaderText="MILESTONE ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                            <asp:BoundField DataField="MILESTONE_NAME" HeaderText="MILESTONE NAME" SortExpression="MILESTONE_NAME" />
                            <asp:BoundField DataField="DUE_DATE" HeaderText="DUE DATE" SortExpression="DUE_DATE" DataFormatString="{0:d}" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </form>
    </div>
    
 <footer class="py-3 my-4">
     <p class="text-center text-body-secondary">© 2025 Basic Web Form</p>
 </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>