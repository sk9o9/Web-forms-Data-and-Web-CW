<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="milestone.aspx.cs" Inherits="Data_and_Web_Coursework.milestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Milestone Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
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
                <li class="nav-item"><a href="./user.aspx" class="nav-link "><i class="bi bi-people me-1"></i>Users</a></li>
                <li class="nav-item"><a href="./project.aspx" class="nav-link"><i class="bi bi-briefcase me-1"></i>Projects</a></li>
                <li class="nav-item"><a href="./task.aspx" class="nav-link"><i class="bi bi-list-task me-1"></i>Tasks</a></li>
                <li class="nav-item"><a href="./subtask.aspx" class="nav-link"><i class="bi bi-list-check me-1"></i>Subtasks</a></li>
                <li class="nav-item"><a href="./milestone.aspx" class="nav-link  active" aria-current="page"><i class="bi bi-flag me-1"></i>Milestones</a></li>
                <li class="nav-item"><a href="./dashboard.aspx" class="nav-link "><i class="bi bi-speedometer2 me-1"></i>Dashboard</a></li>
            </ul>
        </div>
    </div>
</nav>

    <div class="container">
        <!-- Page Title -->
        <div class="row mb-4">
            <div class="col">
                <h2>Milestone Management</h2>
                <p class="text-muted">Add, edit, and manage milestone information</p>
            </div>
        </div>

        <form id="form1" runat="server">
            <!-- Milestone GridView -->
            <div class="card mb-4">
                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Milestones List</h5>
                </div>
                <div class="card-body">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1"
                        CssClass="table table-striped table-hover table-bordered"
                        HeaderStyle-CssClass="table-dark">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" 
                                        CssClass="btn btn-sm btn-outline-primary mx-1">
                                        <i class="bi bi-pencil"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"
                                        CssClass="btn btn-sm btn-outline-primary mx-1"
                                        OnClientClick="return confirm('Are you sure you want to delete this milestone?');">
                                        <i class="bi bi-trash"></i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update"
                                        CssClass="btn btn-sm btn-outline-primary mx-1">
                                        <i class="bi bi-check-lg"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel"
                                        CssClass="btn btn-sm btn-outline-primary mx-1">
                                        <i class="bi bi-x-lg"></i>
                                    </asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="MILESTONE_ID" HeaderText="ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                            <asp:BoundField DataField="MILESTONE_NAME" HeaderText="Milestone Name" SortExpression="MILESTONE_NAME" />
                            <asp:BoundField DataField="DUE_DATE" HeaderText="Due Date" SortExpression="DUE_DATE" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:TemplateField HeaderText="Project">
                                <ItemTemplate>
                                    <asp:DropDownList Enabled="false" ID="DropDownList2" runat="server" DataSourceID="projecttitledata" 
                                        DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>'
                                        CssClass="form-select form-select-sm">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="projecttitledata" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                                        SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECT&quot;">
                                    </asp:SqlDataSource>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            
            <!-- Milestone Form -->
            <div class="card mb-4">
                <div class="card-header bg-success text-white">
                    <h5 class="mb-0">Add/Edit Milestone</h5>
                </div>
                <div class="card-body">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONE_ID" 
                        DataSourceID="SqlDataSource1" DefaultMode="Insert" 
                        CssClass="w-100">
                        <EditItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Milestone ID:</label>
                                    <asp:Label ID="MILESTONE_IDLabel1" runat="server" Text='<%# Eval("MILESTONE_ID") %>' CssClass="form-control-plaintext" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Milestone Name:</label>
                                    <asp:TextBox ID="MILESTONE_NAMETextBox" runat="server" Text='<%# Bind("MILESTONE_NAME") %>' CssClass="form-control" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Due Date:</label>
                                    <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Project:</label>
                                    <asp:DropDownList ID="PROJECT_IDDropDown" runat="server" DataSourceID="projectDataSource" 
                                        DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>' 
                                        CssClass="form-select">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="projectDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                                        SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECT&quot;">
                                    </asp:SqlDataSource>
                                </div>
                                <div class="col-12 mt-3">
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" 
                                        CssClass="btn btn-success">
                                        <i class="bi bi-check-circle me-1"></i> Update
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" 
                                        CssClass="btn btn-outline-secondary ms-2">
                                        <i class="bi bi-x-circle me-1"></i> Cancel
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Milestone ID:</label>
                                    <asp:TextBox ID="MILESTONE_IDTextBox" runat="server" Text='<%# Bind("MILESTONE_ID") %>' CssClass="form-control" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Milestone Name:</label>
                                    <asp:TextBox ID="MILESTONE_NAMETextBox" runat="server" Text='<%# Bind("MILESTONE_NAME") %>' CssClass="form-control" placeholder="Enter milestone name" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Due Date:</label>
                                    <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE") %>' CssClass="form-control" TextMode="Date" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Project:</label>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="projectDropdownSource" 
                                        DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>' 
                                        CssClass="form-select">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="projectDropdownSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                                        SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECT&quot;">
                                    </asp:SqlDataSource>
                                </div>
                                <div class="col-12 mt-3">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" 
                                        CssClass="btn btn-primary">
                                        <i class="bi bi-plus-circle me-1"></i> Add Milestone
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" 
                                        CssClass="btn btn-outline-secondary ms-2">
                                        <i class="bi bi-x-circle me-1"></i> Cancel
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div class="text-center">
                                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" 
                                    CssClass="btn btn-primary">
                                    <i class="bi bi-plus-lg me-1"></i> Add New Milestone
                                </asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
            
            <!-- SqlDataSource (unchanged) -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MILESTONE&quot; WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID" InsertCommand="INSERT INTO &quot;MILESTONE&quot; (&quot;MILESTONE_ID&quot;, &quot;MILESTONE_NAME&quot;, &quot;DUE_DATE&quot;, &quot;PROJECT_ID&quot;) VALUES (:MILESTONE_ID, :MILESTONE_NAME, :DUE_DATE, :PROJECT_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;MILESTONE&quot;" UpdateCommand="UPDATE &quot;MILESTONE&quot; SET &quot;MILESTONE_NAME&quot; = :MILESTONE_NAME, &quot;DUE_DATE&quot; = :DUE_DATE, &quot;PROJECT_ID&quot; = :PROJECT_ID WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID">
                <DeleteParameters>
                    <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                    <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                    <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                    <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                    <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </form>
    </div>

    <footer class="py-3 my-4">
        <p class="text-center text-body-secondary">© 2025 Basic Web Form</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
