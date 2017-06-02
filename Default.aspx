<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceholderTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceholderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPlaceholderBody" Runat="Server">
    <% if(Session["Email"] != null) { %>
    <h1><asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label></h1>
    <asp:Button ID="btnLogout" CssClass="button danger" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    <% } else { %>
        <a href="Registration.aspx" class="button danger full-size big-button">Woah! You're Not Registered, Register Now?</a>
    <% } %>
    <br />
    <h1>Latest Adverts</h1>
    <div class="grid">
    <asp:ListView ID="lstvAdverts" runat="server" DataSourceID="sqlAdverts" GroupItemCount="5">
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
                    <div class="cell">
                        <div class="row">
                            <div class="cell">
                                <asp:Image ID="imageImage" runat="server" ImageUrl='<%# "/img/"+Eval("image") %>' Width="200" />
                            </div>
                            <div class="cell">
                                <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />'s <asp:Label ID="makeLabel" runat="server" Text='<%# Eval("make") %>' /> - <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                            </div>
                            <div class="cell">
                                <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                            </div>
                            <div class="cell">
                                in <asp:Label ID="colourLabel" runat="server" Text='<%# Eval("colour") %>'  CssClass='<%# "fg-"+Eval("colour") %>' />
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
                     </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="row cells5">
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <div id="groupPlaceholderContainer" runat="server" border="0" style="" class="row cells5">
                                    <div id="groupPlaceholder" runat="server">
                                    </div>
                                    </div>
                            </td>
                        </tr>
                    </table>
                        </div>
                </LayoutTemplate>
            </asp:ListView>
     <asp:SqlDataSource ID="sqlAdverts" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" SelectCommand="
         SELECT TOP 5 adverts.id, images.image, [make], [model], [colour], [type], [year], [location], [price], [active]
            FROM adverts LEFT OUTER JOIN
	            (
		            SELECT car_id, max(image) AS image
		            FROM pictures
		            GROUP BY car_id
	            ) AS images ON (adverts.Id = images.car_id) ORDER BY [adverts].[Id] DESC;">
            </asp:SqlDataSource>
    <br />
    </div>
</asp:Content>

