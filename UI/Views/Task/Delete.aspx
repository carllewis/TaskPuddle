<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Task/Task.master" Inherits="System.Web.Mvc.ViewPage<TaskPuddle.Models.Task>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="TaskTitleContent" runat="server">
Delete Task
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TaskMainContent" runat="server">
<% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        <fieldset>
            <legend>Are you sure you want to delete this task?</legend>
            <%: Html.HiddenFor(model => model.TaskId) %>

            <div class="editor-field">
                <div class="display-field"><%: Model.TaskTitle %></div>
            </div>
            <p>
                <input type="submit" value="Delete" />
            </p>
        </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="TaskHeaderContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="TaskFooterContent" runat="server">
</asp:Content>

