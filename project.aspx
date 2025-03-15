<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="project.aspx.cs" Inherits="Data_and_Web_Coursework.project" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <!-- Header Section -->
    <section id="header">
        <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
            <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
                <span class="fs-4">Basic Web Form</span>
            </a>

            <ul class="nav nav-pills">
                <li class="nav-item"><a href="./user.aspx" class="nav-link">User</a></li>
                <li class="nav-item"><a href="./project.aspx" class="nav-link active" aria-current="page">Project</a></li>
                <li class="nav-item"><a href="./task.aspx" class="nav-link">Task</a></li>
                <li class="nav-item"><a href="./subtask.aspx" class="nav-link">Subtask</a></li>
                <li class="nav-item"><a href="./milestone.aspx" class="nav-link">Milestone</a></li>
                <li class="nav-item"><a href="./dashboard.aspx" class="nav-link">Dashboard</a></li>
            </ul>
        </header>
    </section>

    <div class="container">
        <!-- Page Title -->
        <div class="row mb-4">
            <div class="col">
                <h2>Project Management</h2>
                <p class="text-muted">Add, edit, and manage project information</p>
            </div>
        </div>
        
        <form id="form1" runat="server">
            <!-- Project GridView -->
            <div class="card mb-4">
                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Projects List</h5>
                </div>
                <div class="card-body">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1"
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
                                        OnClientClick="return confirm('Are you sure you want to delete this project?');">
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
                            <asp:BoundField DataField="PROJECT_ID" HeaderText="ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                            <asp:BoundField DataField="PROJECT_NAME" HeaderText="Name" SortExpression="PROJECT_NAME" />
                            <asp:BoundField DataField="START_DATE" HeaderText="Start Date" SortExpression="START_DATE" />
                            <asp:BoundField DataField="END_DATE" HeaderText="End Date" SortExpression="END_DATE" />
                            <asp:BoundField DataField="PROJECT_STATUS" HeaderText="Status" SortExpression="PROJECT_STATUS" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            
            <!-- Project Form -->
            <div class="card mb-4">
                <div class="card-header bg-success text-white">
                    <h5 class="mb-0">Add/Edit Project</h5>
                </div>
                <div class="card-body">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECT_ID" 
                        DataSourceID="SqlDataSource1" DefaultMode="Insert" 
                        CssClass="w-100">
                        <EditItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Project ID:</label>
                                    <asp:Label ID="PROJECT_IDLabel1" runat="server" Text='<%# Eval("PROJECT_ID") %>' CssClass="form-control-plaintext" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Project Name:</label>
                                    <asp:TextBox ID="PROJECT_NAMETextBox" runat="server" Text='<%# Bind("PROJECT_NAME") %>' CssClass="form-control" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Start Date:</label>
                                    <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE") %>' CssClass="form-control" TextMode="Date" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">End Date:</label>
                                    <asp:TextBox ID="END_DATETextBox" runat="server" Text='<%# Bind("END_DATE") %>' CssClass="form-control" TextMode="Date" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Project Status:</label>
                                    <asp:TextBox ID="PROJECT_STATUSTextBox" runat="server" Text='<%# Bind("PROJECT_STATUS") %>' CssClass="form-control" />
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
                                    <label class="form-label fw-bold">Project ID:</label>
                                    <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' CssClass="form-control" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Project Name:</label>
                                    <asp:TextBox ID="PROJECT_NAMETextBox" runat="server" Text='<%# Bind("PROJECT_NAME") %>' CssClass="form-control" placeholder="Project name" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Start Date:</label>
                                    <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE") %>' CssClass="form-control" TextMode="Date" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">End Date:</label>
                                    <asp:TextBox ID="END_DATETextBox" runat="server" Text='<%# Bind("END_DATE") %>' CssClass="form-control" TextMode="Date" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Project Status:</label>
                                    <asp:TextBox ID="PROJECT_STATUSTextBox" runat="server" Text='<%# Bind("PROJECT_STATUS") %>' CssClass="form-control" placeholder="e.g., Ongoing, Completed" />
                                </div>
                                <div class="col-12 mt-3">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" 
                                        CssClass="btn btn-primary">
                                        <i class="bi bi-plus-circle me-1"></i> Add Project
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
                                    <i class="bi bi-plus-lg me-1"></i> Add New Project
                                </asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
            
            <!-- SqlDataSource (unchanged) -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM &quot;PROJECT&quot; WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID" 
                InsertCommand="INSERT INTO &quot;PROJECT&quot; (&quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot;, &quot;START_DATE&quot;, &quot;END_DATE&quot;, &quot;PROJECT_STATUS&quot;) VALUES (:PROJECT_ID, :PROJECT_NAME, :START_DATE, :END_DATE, :PROJECT_STATUS)" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot;, &quot;START_DATE&quot;, &quot;END_DATE&quot;, &quot;PROJECT_STATUS&quot; FROM &quot;PROJECT&quot;" 
                UpdateCommand="UPDATE &quot;PROJECT&quot; SET &quot;PROJECT_NAME&quot; = :PROJECT_NAME, &quot;START_DATE&quot; = :START_DATE, &quot;END_DATE&quot; = :END_DATE, &quot;PROJECT_STATUS&quot; = :PROJECT_STATUS WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID">
                <DeleteParameters>
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                    <asp:Parameter Name="PROJECT_NAME" Type="String" />
                    <asp:Parameter Name="START_DATE" Type="DateTime" />
                    <asp:Parameter Name="END_DATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECT_STATUS" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PROJECT_NAME" Type="String" />
                    <asp:Parameter Name="START_DATE" Type="DateTime" />
                    <asp:Parameter Name="END_DATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECT_STATUS" Type="String" />
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
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