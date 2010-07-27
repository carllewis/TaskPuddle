<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Task/Task.Master" Inherits="System.Web.Mvc.ViewPage<TaskPuddle.Models.CreateTask>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="TaskHeaderContent" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TaskTitleContent" runat="server">
	Create Task
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="TaskMainContent" runat="server">
    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        <fieldset>
            <legend>Create Task</legend>
            <div class="editor-label">
                <%: Html.LabelFor(model => model.TaskTitle) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.TaskTitle, new { @class="textbox" })%>
                <%: Html.ValidationMessageFor(model => model.TaskTitle) %>
            </div>
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Category) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Category, new { @class="textbox" })%>
                <%: Html.ValidationMessageFor(model => model.Category) %>
            </div>
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Description) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Description, new { @class="descriptionarea" })%>
                <%: Html.ValidationMessageFor(model => model.Description) %>
            </div>
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="TaskFooterContent" runat="server">
</asp:Content>