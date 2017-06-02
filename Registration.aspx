<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceholderTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceholderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPlaceholderBody" Runat="Server">

    <h1>Register a New Account</h1>
    <div class="grid">
        <div class="row cells2">
            <div class="cell">
                <div class="row cells1">
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
                            <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                        <div class="input-control text full-size">
                            <asp:TextBox ID="tbxFirstName" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="cell">
                            <asp:Label ID="lblSurname" runat="server" Text="Surname"></asp:Label>
                        <div class="input-control text full-size">
                            <asp:TextBox ID="tbxSurname" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="cell">
                            <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
                        <div class="input-control text full-size">
                            <asp:TextBox ID="tbxLocation" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="cell">
                            <asp:Label ID="lblMobileNum" runat="server" Text="Mobile Number"></asp:Label>
                        <div class="input-control text full-size">
                            <asp:TextBox ID="tbxMobileNum" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="cell">
                        <div class="row cells2">
                            <div class="cell">
                                 <asp:Button ID="btnSubmit" runat="server" Text="Register" CssClass="button primary" OnClick="btnSubmit_Click" />
                            </div>

                            <div class="cell align-right">
                            </div>
                        </div>
                        

                    </div>
                </div>
            </div>
            
        <div class="cell">
            <h3>Allready got an account?</h3><br />
            <a href="Login.aspx" class="button success big-button full-size">Login Instead</a>
        
        </div>
        </div>

    </div>


    <asp:ObjectDataSource ID="UserObjectData" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="UsersTableAdapters.UsersTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="first_name" Type="String" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="surname" Type="String" />
            <asp:Parameter Name="mobile_number" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="first_name" Type="String" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="surname" Type="String" />
            <asp:Parameter Name="mobile_number" Type="String" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>

