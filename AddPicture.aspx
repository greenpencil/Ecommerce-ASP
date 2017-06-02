<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddPicture.aspx.cs" Inherits="AddPicture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceholderTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceholderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPlaceholderBody" Runat="Server">
    <% if(canAddPicture()) { %>
    <div class="row">
        <div class="cell">
             <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="row cells3">
        <div class="cell colspan2">
            Upload Image:
        </div>
        <div class="cell">
            <div class="input-control file" data-role="input">
                <asp:FileUpload ID="fulpImage" runat="server" />
                 <button class="button"><span class="mif-folder"></span></button>
            </div>
        </div>
    </div>

    <div class="row cells3">
        <div class="cell colspan2">
            Title:
        </div>
        <div class="cell">
            <div class="input-control text">
                <asp:TextBox ID="tbxTitle" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="cell">
            <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="button info full-size" OnClick="btnUpload_Click" />
        </div>
    </div>
   
    <asp:ListView ID="lstvPictures" runat="server" DataKeyNames="Id" DataSourceID="sqlPictures">
        <EmptyDataTemplate>
            <span>This adverts has no pictures yet, why not add one?</span>
        </EmptyDataTemplate>
        <ItemTemplate>
            <span style="">Title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            <br />
            Image:
            <asp:Image ID="imageImage" runat="server" ImageUrl='<%# "/img/"+Eval("image") %>' />
            <br />
            <asp:Button ID="DeleteButton" CssClass="button danger" runat="server" CommandName="Delete" Text="Delete" />
<br />
            <br />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div style="" id="itemPlaceholderContainer" runat="server">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>

    </asp:ListView>
    <asp:SqlDataSource ID="sqlPictures" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" DeleteCommand="DELETE FROM [pictures] WHERE [Id] = @Id" InsertCommand="INSERT INTO [pictures] ([title], [image], [car_id]) VALUES (@title, @image, @car_id)" SelectCommand="SELECT [title], [image], [Id], [car_id] FROM [pictures] WHERE ([car_id] = @car_id)" UpdateCommand="UPDATE [pictures] SET [title] = @title, [image] = @image, [car_id] = @car_id WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="image" Type="String" />
            <asp:Parameter Name="car_id" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="car_id" QueryStringField="carId" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="image" Type="String" />
            <asp:Parameter Name="car_id" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <% } else {
           Response.Write("You cannot edit this advert");
       } %>
</asp:Content>

