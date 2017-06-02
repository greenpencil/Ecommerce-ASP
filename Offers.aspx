<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Offers.aspx.cs" Inherits="Notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceholderTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceholderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPlaceholderBody" Runat="Server">
    <% if(Session["userId"] != null) { %>

    <div class="grid">
        <div class="row">
            
                    <div class="cell"><h1>Your Offers</h1></div>
        </div>
    <div class="row cells2">
        <div class="cell">
            <h2>Offers You've Made</h2>
            <asp:ListView ID="lstvOffersYouMade" runat="server" DataKeyNames="Id" DataSourceID="SqlOffers">
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="hylCar" runat="server" NavigateUrl='<%# "AdvertDetails.aspx?carId=" + Eval("car_id") %>'>Car</asp:HyperLink>
                    <br />
                    Status:
                    <asp:Label ID="lblSent" runat="server" Text="Offer Sent, but not accepted by the seller" Visible='<%# Eval("status").ToString() == "1"%>'></asp:Label>
                    <asp:Label ID="lblRejected" runat="server" Text="Offer Rejected by the seller" Visible='<%# Eval("status").ToString() == "2"%>'></asp:Label>
                    <asp:Label ID="lblAccepted" runat="server" Text="Offer Accepted - click on the pay now button to complete the payment" Visible='<%# Eval("status").ToString() == "3"%>'></asp:Label>
                    <asp:Label ID="lblPaid" runat="server" Text="Payment complete - Your car is on the way" Visible='<%# Eval("status").ToString() == "4"%>'></asp:Label>
                    <br />
                    Price:
                    <asp:Label ID="priceLabel" runat="server" Text='<%# "£" + Eval("price") %>' />
                    <br />
                    
                    <asp:HyperLink ID="hylBuy" runat="server" CssClass="button info" NavigateUrl='<%# "OfferAction.aspx?Id=" + Eval("Id") + "&action=pay" %>' Visible='<%# Eval("status").ToString() == "3" %>'>Pay</asp:HyperLink>
        <br /></span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlOffers" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" SelectCommand="SELECT * FROM [offers] WHERE ([user_id] = @user_id)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="user_id" SessionField="userId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <div class="cell">
            <h2>Offers On Your Adverts</h2>
            <asp:ListView ID="lstvOffersOnYourAdverts" runat="server" DataKeyNames="Id" DataSourceID="slqOffersOnYourCars">
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="hylUser" runat="server" NavigateUrl='<%# "UserProfile.aspx?userId=" + Eval("user_id") %>'>User</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="hylCar" runat="server" NavigateUrl='<%# "AdvertDetails.aspx?carId=" + Eval("car_id") %>'>Car</asp:HyperLink>
                    <br />
                    Status:
                    <asp:Label ID="lblSent" runat="server" Text="Offer Sent, please choose an option" Visible='<%# Eval("status").ToString() == "1"%>'></asp:Label>
                    <asp:Label ID="lblRejected" runat="server" Text="Offer Rejected" Visible='<%# Eval("status").ToString() == "2"%>'></asp:Label>
                    <asp:Label ID="lblAccepted" runat="server" Text="Offer Accepted awaiting payment" Visible='<%# Eval("status").ToString() == "3"%>'></asp:Label>
                    <asp:Label ID="lblPaid" runat="server" Text="Payment complete please sent the vechicle" Visible='<%# Eval("status").ToString() == "4"%>'></asp:Label>
                    
                    <br />
                    Price:
                    <asp:Label ID="priceLabel" runat="server" Text='<%# "£" + Eval("price") %>' />
                    <br />
                    <asp:HyperLink ID="hylAccept" runat="server" CssClass="button success" NavigateUrl='<%# "OfferAction.aspx?Id=" + Eval("Id") + "&action=accept" %>' Visible='<%# Eval("status").ToString() == "1" %>'>Accept</asp:HyperLink>
                    
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="button danger" NavigateUrl='<%# "OfferAction.aspx?Id=" + Eval("Id") + "&action=decline" %>' Visible='<%# Eval("status").ToString() == "1" %>'>Decline</asp:HyperLink>
                <br />                 <br />

                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="slqOffersOnYourCars" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" SelectCommand="
                 SELECT * FROM [offers], [adverts] WHERE [adverts].[user_id] = @user_id AND [adverts].[Id] = [offers].[car_id]">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="user_id" SessionField="userId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
        </div>
    <% }
       else { Response.Write("Login to access this page"); } %>
    
</asp:Content>

