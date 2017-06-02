<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceholderTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceholderHead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPlaceholderBody" runat="Server">
    <asp:Label ID="lblErrors" runat="server" Text=""></asp:Label>
    <h1>Login</h1>
    <div class="grid">
        <div class="row cells2">
            <div class="cell">
                <div class="cell"></div>
                <div class="cell">
                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                    <div class="input-control text full-size">
                        <asp:TextBox ID="tbxEmail" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="cell">
                    <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                    <div class="input-control text full-size">
                        <asp:TextBox ID="tbxPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>

                <div class="cell">
                    <asp:Button ID="btnSubmit" runat="server" Text="Login" CssClass="button primary" OnClick="btnSubmit_Click" />
                </div>
            </div>
        <div class="cell">
            <h3>No account yet?</h3><br />
            <a href="Registration.aspx" class="button success big-button full-size">Register Now</a>
        </div>
    </div>
  </div>
</asp:Content>

