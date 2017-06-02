<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OfferAction.aspx.cs" Inherits="OfferAction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceholderTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceholderHead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPlaceholderBody" runat="Server">
    <% if (Session["userId"] != null)
       {
           if (Request.QueryString["action"] == null)
           { %>
             <% }
           else if (Request.QueryString["action"].Equals("pay"))
           { %>
                <asp:Button ID="btnPaypal" runat="server" Text="Continue to Paypal" OnClick="btnPaypal_Click" CssClass="button warning" />
             <%}
           else
           { %>
            Oops something went wrong
        <% } %>
    <% }
       else { Response.Write("You cannot access this wihtout logging in"); } %>
</asp:Content>

