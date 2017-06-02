<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceholderTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceholderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPlaceholderBody" Runat="Server">
    <div class="row">
        <div class="cell">
            <asp:Label ID="lblName" runat="server" CssClass="leader"></asp:Label> (<asp:Label ID="lblEmail" runat="server"></asp:Label>)
        </div>
        <div class="cell">
            <asp:Label ID="lblLocation" runat="server" CssClass="fg-grayLight"></asp:Label>
        </div>
        <% if(lblEmail.Text.Equals(Session["Email"])) { %>
        <div class="cell">
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="button danger full-size" />
        </div>
            <div class="cell">
                <h3>Your Details</h3>
                <asp:ListView ID="lstvUser" runat="server" DataSourceID="sqlUser" DataKeyNames="Id" OnItemUpdating="lstvUser_ItemUpdating" OnItemUpdated="lstvUser_ItemUpdated">
                    <EditItemTemplate>
                        </span style="">
                        Email:
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                        <br />
                        Password:
                        <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                        <br />
                        Location:
                        <asp:TextBox ID="locationTextBox" runat="server" Text='<%# Bind("location") %>' />
                        <br />
                        Surname:
                        <asp:TextBox ID="surnameTextBox" runat="server" Text='<%# Bind("surname") %>' />
                        <br />
                        First Name:
                        <asp:TextBox ID="first_nameTextBox" runat="server" Text='<%# Bind("first_name") %>' />
                        <br />
                        Mobile Number:
                        <asp:TextBox ID="mobile_numberTextBox" runat="server" Text='<%# Bind("mobile_number") %>' />
                        <br />
                        <asp:Button CssClass="button success" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button CssClass="button danger" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        <br />
                        <br />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <span>No data was returned.</span>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        </span style="">
                        Email:
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                        <br />
                        Password:
                        <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                        <br />
                        Location:
                        <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
                        <br />
                        Surname:
                        <asp:Label ID="surnameLabel" runat="server" Text='<%# Eval("surname") %>' />
                        <br />
                        First Name:
                        <asp:Label ID="first_nameLabel" runat="server" Text='<%# Eval("first_name") %>' />
                        <br />
                        Mobile Number:
                        <asp:Label ID="mobile_numberLabel" runat="server" Text='<%# Eval("mobile_number") %>' />
                        <br />
                        <asp:Button ID="EditButton" CssClass="button" runat="server" CommandName="Edit" Text="Edit" />
                        <br />
                        <br />
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div style="" id="itemPlaceholderContainer" runat="server">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
            </div>
        <% } %>
        <div class="cell">
            <h3>Adverts Posted by this User</h3>
            <asp:ListView ID="lstvAdverts" runat="server" DataSourceID="sqlAdverts" GroupItemCount="3">
                <AlternatingItemTemplate>
                    <td runat="server" style="">
                        <div class="row">
                            <div class="cell">
                                <asp:Image ID="imgCar" runat="server" ImageUrl="~/img/bluecar-main.jpg" Width="200px" />
                            </div>
                            <div class="cell">
                                <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />'s <asp:Label ID="makeLabel" runat="server" Text='<%# Eval("make") %>' /> - <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                            </div>
                            <div class="cell">
                                <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                            </div>
                            <div class="cell">
                                in <asp:Label CssClass='<%# Eval("colour") %>' ID="colourLabel" runat="server" Text='<%# Eval("colour") %>' />
                            </div>
                            <div class="cell">
                                Location: <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
                            </div>
                            <div class="cell">
                                Asking Price: £<asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                            </div>
                            <div class="cell">
                                <asp:Button ID="btnView" CssClass="button" runat="server" Text="View this listing" />
                            </div>
                        </div>
                    </td>
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                
                <ItemTemplate>
                    <td runat="server" style="" class="padding20">
                        <div class="row">
                            <div class="cell">
                                <asp:Image ID="imgCar" runat="server" ImageUrl="~/img/bluecar-main.jpg" Width="200px" />
                            </div>
                            <div class="cell">
                                <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />'s <asp:Label ID="makeLabel" runat="server" Text='<%# Eval("make") %>' /> - <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                            </div>
                            <div class="cell">
                                <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                            </div>
                            <div class="cell">
                                in <asp:Label CssClass='<%# "fg-"+ Eval("colour") %>' ID="colourLabel" runat="server" Text='<%# Eval("colour") %>' />
                            </div>
                            <div class="cell">
                                Location: <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
                            </div>
                            <div class="cell">
                                Asking Price: £<asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                            </div>
                            <div class="cell">
                                <a href='AdvertDetails.aspx?carId=<%# Eval("Id")%>' class="button">View this Listing</a>
                            </div>
                        </div>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" class="padding20 no-padding-top" style="">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonCssClass="button" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonCssClass="button" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="">
                        <div class="row">
                            <div class="cell">
                                <asp:Image ID="imgCar" runat="server" ImageUrl="~/img/bluecar-main.jpg" Width="200px" />
                            </div>
                            <div class="cell">
                                <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />'s <asp:Label ID="makeLabel" runat="server" Text='<%# Eval("make") %>' /> - <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                            </div>
                            <div class="cell">
                                <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                            </div>
                            <div class="cell">
                                in <asp:Label CssClass='<%# "fg-" + Eval("colour") %>' ID="colourLabel" runat="server" Text='<%# Eval("colour") %>' />
                            </div>
                            <div class="cell">
                                Location: <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
                            </div>
                            <div class="cell">
                                Asking Price: £<asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                            </div>
                            <div class="cell">
                                <a href='AdvertDetails.aspx?carId=<%# Eval("Id")%>' class="button">View this Listing</a>
                            </div>
                        </div>
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="sqlAdverts" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" SelectCommand="SELECT * FROM [adverts] WHERE ([user_id] = @user_id)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="user_id" QueryStringField="userId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlUser" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" SelectCommand="SELECT * FROM [users] WHERE ([Id] = @Id)" DeleteCommand="DELETE FROM [users] WHERE [Id] = @Id" InsertCommand="INSERT INTO [users] ([email], [password], [location], [surname], [first_name], [mobile_number]) VALUES (@email, @password, @location, @surname, @first_name, @mobile_number)" UpdateCommand="UPDATE [users] SET [email] = @email, [password] = @password, [location] = @location, [surname] = @surname, [first_name] = @first_name, [mobile_number] = @mobile_number WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="location" Type="String" />
                    <asp:Parameter Name="surname" Type="String" />
                    <asp:Parameter Name="first_name" Type="String" />
                    <asp:Parameter Name="mobile_number" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="Id" QueryStringField="userId" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="location" Type="String" />
                    <asp:Parameter Name="surname" Type="String" />
                    <asp:Parameter Name="first_name" Type="String" />
                    <asp:Parameter Name="mobile_number" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <div class="row">
        <div class="cell">
            <h2>Adverts viewed by this user</h2>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="sqlHistory" GroupItemCount="3">
                <AlternatingItemTemplate>
                    <td runat="server" style="">
                        <div class="row">
                            <div class="cell">
                                <asp:Image ID="imgCar" runat="server" ImageUrl="~/img/bluecar-main.jpg" Width="200px" />
                            </div>
                            <div class="cell">
                                <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />'s <asp:Label ID="makeLabel" runat="server" Text='<%# Eval("make") %>' /> - <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                            </div>
                            <div class="cell">
                                <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                            </div>
                            <div class="cell">
                                in <asp:Label CssClass='<%# "fg-" + Eval("colour") %>' ID="colourLabel" runat="server" Text='<%# Eval("colour") %>' />
                            </div>
                            <div class="cell">
                                Location: <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
                            </div>
                            <div class="cell">
                                Asking Price: £<asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                            </div>
                            <div class="cell">
                                <a href='AdvertDetails.aspx?carId=<%# Eval("Id")%>' class="button">View this Listing</a>
                            </div>
                        </div>
                    </td>
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                
                <ItemTemplate>
                    <td runat="server" style="" class="padding20">
                        <div class="row">
                            <div class="cell">
                                <asp:Image ID="imgCar" runat="server" ImageUrl="~/img/bluecar-main.jpg" Width="200px" />
                            </div>
                            <div class="cell">
                                <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />'s <asp:Label ID="makeLabel" runat="server" Text='<%# Eval("make") %>' /> - <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                            </div>
                            <div class="cell">
                                <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                            </div>
                            <div class="cell">
                                in <asp:Label CssClass='<%# "fg-" + Eval("colour") %>' ID="colourLabel" runat="server" Text='<%# Eval("colour") %>' />
                            </div>
                            <div class="cell">
                                Location: <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
                            </div>
                            <div class="cell">
                                Asking Price: £<asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                            </div>
                            <div class="cell">
                                <a href='AdvertDetails.aspx?carId=<%# Eval("Id")%>' class="button">View this Listing</a>
                            </div>
                        </div>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" class="padding20 no-padding-top" style="">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonCssClass="button" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonCssClass="button" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="">
                        <div class="row">
                            <div class="cell">
                                <asp:Image ID="imgCar" runat="server" ImageUrl="~/img/bluecar-main.jpg" Width="200px" />
                            </div>
                            <div class="cell">
                                <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />'s <asp:Label ID="makeLabel" runat="server" Text='<%# Eval("make") %>' /> - <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                            </div>
                            <div class="cell">
                                <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                            </div>
                            <div class="cell">
                                in <asp:Label CssClass='<%# Eval("colour") %>' ID="colourLabel" runat="server" Text='<%# Eval("colour") %>' />
                            </div>
                            <div class="cell">
                                Location: <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
                            </div>
                            <div class="cell">
                                Asking Price: £<asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                            </div>
                            <div class="cell">
                                <asp:Button ID="btnView" CssClass="button" runat="server" Text="View this listing" />
                            </div>
                        </div>
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>

            <asp:SqlDataSource ID="sqlHistory" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" SelectCommand="SELECT [adverts].[Id], [make], [model], [colour], [type], [year], [location], [featured_image], [price], [active] FROM [adverts], [history] WHERE ([history].[car_id] = [adverts].[Id] AND [history].[user_id] = @user_id)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="user_id" QueryStringField="userId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>

</asp:Content>

