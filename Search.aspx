<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceholderTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceholderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPlaceholderBody" Runat="Server">
    <div class="grid">
        <div class="row cells4">
            <div class="cell">
                <h1>Search</h1>
                <div class="grid">
                    <div class="row cells4">
                        <div class="cell">
                            Make 
                        </div>
                        <div class="cell colspan3">
                            <asp:TextBox ID="tbxMake" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row cells4">
                        <div class="cell">
                            Model 
                        </div>
                        <div class="cell colspan3">
                            <asp:TextBox ID="tbxModel" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row cells4">
                        <div class="cell">
                            Colour 
                        </div>
                        <div class="cell colspan3">
                            <asp:TextBox ID="tbxColour" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row cells4">
                        <div class="cell">
                            Type 
                        </div>
                        <div class="cell colspan3">
                            <asp:TextBox ID="tbxType" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row cells4">
                        <div class="cell">
                            Year 
                        </div>
                        <div class="cell colspan3">
                            <asp:TextBox ID="tbxYear" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row cells4">
                        <div class="cell">
                            Price 
                        </div>
                        <div class="cell colspan3">
                            <asp:TextBox ID="tbxPrice" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row cells4">
                        <div class="cell">
                            Location 
                        </div>
                        <div class="cell colspan3">
                            <asp:TextBox ID="tbxLocation" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="cell">
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button" OnClick="btnSearch_Click"/>

                        </div>
                    </div>
                </div>
            </div>

            <div class="cell colspan3">
                <asp:GridView  CssClass="full-size" ID="grvAdverts" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlAdverts" OnSelectedIndexChanged="grvAdverts_SelectedIndexChanged" EmptyDataText="No Data!">
                    <Columns>
                        <asp:BoundField DataField="make" HeaderText="make" SortExpression="make" />
                        <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" />
                        <asp:BoundField DataField="colour" HeaderText="colour" SortExpression="colour" />
                        <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                        <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                        <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="AdvertDetails.aspx?carId={0}" HeaderText="View" Text="View">
                        <ControlStyle CssClass="button" />
                        </asp:HyperLinkField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlAdverts" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" 
                    SelectCommand="SELECT [Id], [make], [model], [colour], [type], [year], [price], [location] FROM [adverts] 
                    WHERE (([colour] LIKE '%' + @colour + '%') 
                    OR ([location] LIKE '%' + @location + '%') 
                    OR ([make] LIKE '%' + @make + '%') 
                    OR ([model] LIKE '%' + @model + '%') 
                    OR ([price] LIKE '%' + @price + '%') 
                    OR ([type] LIKE '%' + @type + '%') 
                    OR ([year] LIKE '%' + @year + '%'))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="tbxColour" Name="colour" PropertyName="Text" Type="String" DefaultValue=" " />
                        <asp:ControlParameter ControlID="tbxLocation" Name="location" PropertyName="Text" Type="String" DefaultValue=" " />
                        <asp:ControlParameter ControlID="tbxMake" Name="make" PropertyName="Text" Type="String" DefaultValue=" " />
                        <asp:ControlParameter ControlID="tbxModel" Name="model" PropertyName="Text" Type="String" DefaultValue=" " />
                        <asp:ControlParameter ControlID="tbxPrice" Name="price" PropertyName="Text" Type="String" DefaultValue=" " />
                        <asp:ControlParameter ControlID="tbxType" Name="type" PropertyName="Text" Type="String" DefaultValue=" " />
                        <asp:ControlParameter ControlID="tbxYear" Name="year" PropertyName="Text" Type="String" DefaultValue=" " />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

