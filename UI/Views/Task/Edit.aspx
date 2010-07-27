<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Task/Task.master" Inherits="System.Web.Mvc.ViewPage<TaskPuddle.Models.Task>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="TaskTitleContent" runat="server">
    Edit Task
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TaskMainContent" runat="server">
    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        <fieldset>
            <legend>Edit Task</legend>
            <%: Html.HiddenFor(model => model.TaskId) %>

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
                <input type="submit" value="Save" />
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

