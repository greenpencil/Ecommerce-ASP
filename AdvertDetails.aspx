<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdvertDetails.aspx.cs" Inherits="AdvertDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceholderTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceholderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPlaceholderBody" Runat="Server">
    <div class="grid">
        <div class="row cells3">
            <div class="cell">
                <div class="row">
                    <div class="cell">
                        <asp:Label ID="lblInfo" runat="server" Text="This car" CssClass="leader"></asp:Label>
                    </div>           
                </div>
                <div class="row">
                <div class="cell">
                    <div class="carousel" data-role="carousel" data-height="300" data-control-next="<span class='mif-chevron-right'></span>" data-control-prev="<span class='mif-chevron-left'></span>">
                        <asp:ListView ID="lstVPictures" runat="server" DataKeyNames="Id" DataSourceID="sqlPictures">
                            <EmptyDataTemplate>
                                <span>No pictures avaliable</span>
                            </EmptyDataTemplate>
                            <ItemTemplate>
                                <div class="slide">
                                    <asp:Image ID="imgCar" runat="server" ImageUrl='<%# "/img/"+Eval("image") %>' data-role="fitImage" data-format="fill" />
                                </div>
                                <div class="slide padding20 debug align-center" style="display: block; left: -356px;">
                                <h2><asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' /></h2>
                            </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <div id="itemPlaceholderContainer" runat="server" style="">
                                    <span runat="server" id="itemPlaceholder" />
                                </div>
                                <div style="">
                                </div>
                            </LayoutTemplate>
                        </asp:ListView>
                      </div>
                    <asp:SqlDataSource ID="sqlPictures" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" SelectCommand="SELECT * FROM [pictures] WHERE ([car_id] = @car_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="1" Name="car_id" QueryStringField="carId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                    </div>
                    
           </div>

            <div class="cell">
                <h3>More Information</h3>
                <asp:ListView ID="lstVInfo" runat="server" DataKeyNames="Id" DataSourceID="AdvertsDataSource">
                    <EditItemTemplate>
                        
                        <asp:HiddenField ID="hdnUserId" runat="server" Value='<%# Eval("user_id") %>' />
                        Make:
                        <asp:TextBox ID="makeTextBox" runat="server" Text='<%# Bind("make") %>' />
                        <br />
                        Model:
                        <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
                        <br />
                        Colour:
                        <asp:TextBox ID="colourTextBox" runat="server" Text='<%# Bind("colour") %>' />
                        <br />
                        Type:
                        <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
                        <br />
                        Year:
                        <asp:TextBox ID="yearTextBox" runat="server" Text='<%# Bind("year") %>' />
                        <br />
                        Price:
                        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                        <br />
                        Location:
                        <asp:TextBox ID="locationTextBox" runat="server" Text='<%# Bind("location") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        <br /><br />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <span>No data was returned.</span>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <asp:HiddenField ID="hdnUserId" runat="server" Value='<%# Eval("user_id") %>' />
                        Make:
                        <asp:Label ID="makeLabel" runat="server" Text='<%# Eval("make") %>' />
                        <br />
                        Model:
                        <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                        <br />
                        Colour:
                        <asp:Label ID="colourLabel" runat="server" Text='<%# Eval("colour") %>' />
                        <br />
                        Type:
                        <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                        <br />
                        Year:
                        <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />
                        <br />
                        Asking Price:
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        <br />
                        Location:
                        <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
                        <br />
                        <% if(canEdit()) { %>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="button success full-size" />
<br />
                        <a href="AddPicture.aspx?carId=<%= Request.QueryString["carId"] %>" class="button info full-size">Add Image</a>
                        <% } %>
                        <br />
                        </span>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server" style="">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
            </div>

            <div class="cell">
                <div class="row">
                    <div class="cell">
                        <h3>Options</h3>
                    </div>
                </div>
                <% if(canEdit())
                   {
                       %>
                To edit your advert, use the buttons provided below the details
                    <%
                   } %>
                <%  else if (Session["UserId"] != null)
                   {
                        
                       if (checkIfWishlist())
                       {%>
                <div class="row cells10">
                        <div class="cell colspan6">
                            <div class="input-control text full-size" style="margin: 0.23rem 0;">
                                <asp:TextBox ID="tbxNotes" runat="server" Text="Notes about this car"></asp:TextBox>
                           </div>
                        </div>
                        <div class="cell colspan4">
                                 <asp:Button ID="btnAddWishlist" runat="server" Text="Add to Wishlist" CssClass="button success full-size" OnClick="btnAddWishlist_Click" />
                        </div>
                    </div>
                <% } else { %>
                    <div class="row">
                        <div class="cell">
                            <asp:Button ID="btnRemoveFromWishlist" runat="server" Text="Remove from Wishlist" CssClass="button danger full-size" OnClick="btnRemoveFromWishlist_Click" />
                        </div>
                    </div>
                <% } %>
                <div class="row">
                    <div class="cell">
                        <asp:Label ID="lblOffer" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                    <div class="row cells10">
                        <div class="cell colspan7">
                            <div class="input-control text full-size" style="margin: 0.23rem 0;">
                                <span class="mif-gbp prepend-icon"></span>
                                <asp:TextBox ID="tbxOffer" runat="server"></asp:TextBox>
                           </div>
                        </div>
                        <div class="cell colspan3">
                            <asp:Button ID="btnMakeOffer" runat="server" Text="Offer" CssClass="button warning full-size" OnClick="btnMakeOffer_Click" />
                        </div>
                    </div>
                <% } else {  %>
                    <div class="row">
                        <div class="cell align-center">
                            To add this to your wishlist or to make an offer
                            <asp:Button ID="btnRegister" runat="server" Text="Register Now" CssClass="button danger full-size" />
                        </div>
                    </div>
                <% } %>
                <div class="row">
                    <div class="cell"><h4>Your Offers</h4></div>
                    <asp:ListView ID="lstvOffers" runat="server" DataSourceID="sqlOffers">
                        <EmptyDataTemplate>
                            <span>No data was returned.</span>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <span style="">Status:
                            <asp:Label ID="lblSent" runat="server" Text="Offer Sent, but not accepted by the seller" Visible='<%# Eval("status").ToString() == "1"%>'></asp:Label>
                    <asp:Label ID="lblRejected" runat="server" Text="Offer Rejected by the seller" Visible='<%# Eval("status").ToString() == "2"%>'></asp:Label>
                    <asp:Label ID="lblAccepted" runat="server" Text="Offer Accepted go to the offers page to complete " Visible='<%# Eval("status").ToString() == "3"%>'></asp:Label>
                    <asp:Label ID="lblPaid" runat="server" Text="Payment complete - Your car is on the way" Visible='<%# Eval("status").ToString() == "4"%>'></asp:Label>
                    
                            <br />
                            Price:
                            <asp:Label ID="priceLabel" runat="server" Text='<%# "£"+Eval("price") %>' />
<br />
                            <br />
                            </span>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="sqlOffers" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" SelectCommand="SELECT [status], [price] FROM [offers] WHERE (([user_id] = @user_id) AND ([car_id] = @car_id))">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="1" Name="user_id" SessionField="userId" Type="Int32" />
                            <asp:QueryStringParameter DefaultValue="carId" Name="car_id" QueryStringField="carId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                
                
            </div>
        </div>
        </div>
    <asp:SqlDataSource ID="AdvertsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" DeleteCommand="DELETE FROM [adverts] WHERE [Id] = @Id" InsertCommand="INSERT INTO [adverts] ([make], [model], [colour], [type], [year], [price], [location]) VALUES (@make, @model, @colour, @type, @year, @location)" SelectCommand="SELECT * FROM [adverts] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [adverts] SET [make] = @make, [model] = @model, [colour] = @colour, [type] = @type, [year] = @year, [location] = @location WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="make" Type="String" />
            <asp:Parameter Name="model" Type="String" />
            <asp:Parameter Name="colour" Type="String" />
            <asp:Parameter Name="type" Type="String" />
            <asp:Parameter Name="year" Type="String" />
            <asp:Parameter Name="price" Type="String" />
            <asp:Parameter Name="featured_image" Type="String" />
            </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="Id" QueryStringField="carId" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="make" Type="String" />
            <asp:Parameter Name="model" Type="String" />
            <asp:Parameter Name="colour" Type="String" />
            <asp:Parameter Name="type" Type="String" />
            <asp:Parameter Name="year" Type="String" />
            <asp:Parameter Name="price" Type="String" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>

