<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TaskPuddle.Models.Task>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th></th>
            <th>
                TaskTitle
            </th>
            <th>
                Description
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.TaskId }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.TaskId })%> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.TaskId })%>
            </td>
            <td>
                <%: item.TaskTitle %>
            </td>
            <td>
                <%
                    var val = new MarkdownSharp.Markdown().Transform(item.Description);
                    while (val.ToUpper().IndexOf("<SCRIPT") >= 0)
                    {
                        int idx = val.ToUpper().IndexOf("<SCRIPT");
                        val = val.Substring(0, idx) + "&lt" + val.Substring(idx + 1);
                    }
                    while (val.ToUpper().IndexOf("</SCRIPT") >= 0)
                    {
                        int idx = val.ToUpper().IndexOf("</SCRIPT");
                        val = val.Substring(0, idx) + "&lt" + val.Substring(idx + 1);
                    }
                %>
                <% =val %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>

