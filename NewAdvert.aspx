<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableEventValidation="false"  AutoEventWireup="true" CodeFile="NewAdvert.aspx.cs" Inherits="NewAdvert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceholderTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceholderHead" Runat="Server">
    <script type="text/javascript" src="http://www.carqueryapi.com/js/jquery.min.js"></script>
<script type="text/javascript" src="http://www.carqueryapi.com/js/carquery.0.3.4.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var carquery = new CarQuery();
            carquery.init();
            carquery.initYearMakeModelTrim('contentPlaceholderBody_dpdl_carYear', 'contentPlaceholderBody_dpdl_carMake', 'contentPlaceholderBody_dpdl_carModel');
            
            $("#contentPlaceholderBody_dpdl_carColor").change(function () {
                $("#colour").removeClass();
                $("#colour").addClass("fg-" + $(this).val());
            });

            $("#contentPlaceholderBody_dpdl_carYear").change(function () {
                $("#contentPlaceholderBody_hdnCarYear").val($(this).val());
            });
            $("#contentPlaceholderBody_dpdl_carModel").change(function () {
                $("#contentPlaceholderBody_hdnCarModel").val($(this).val());
            });
            $("#contentPlaceholderBody_dpdl_carMake").change(function () {
                $("#contentPlaceholderBody_hdnCarMake").val($(this).val());
            });
        });
        </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPlaceholderBody" Runat="Server">
    <% if(Session["Email"] != null) { %>
    <div class="grid">
        <div class="row">
            <div class="cell">
                <h4>Tell us about your car</h4>
            </div>
        </div>

        <div class="row cells2">
            <div class="cell">
                Year of Registration
            </div>
            <div class="cell">
                <div class="input-control select">
                    <asp:DropDownList ID="dpdl_carYear" runat="server"></asp:DropDownList>
                    </div>
                <asp:HiddenField ID="hdnCarYear" runat="server" />
                <asp:RequiredFieldValidator ID="requiredCarYear"  CssClass="fg-red" runat="server" ErrorMessage="Please select a valid year" ControlToValidate="dpdl_carYear"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row cells2">
            <div class="cell">
                Car Make
            </div>
            <div class="cell">
                <div class="input-control select">
                    <asp:DropDownList ID="dpdl_carMake" runat="server" AutoPostBack="False"></asp:DropDownList>
                </div>
                
                <asp:HiddenField ID="hdnCarMake" runat="server" />
                <asp:RequiredFieldValidator ID="requiredCarMake"  CssClass="fg-red" runat="server" ErrorMessage="Please select a valid make" ControlToValidate="dpdl_carMake"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row cells2">
            <div class="cell">
                Car Model
            </div>
            <div class="cell">
                <div class="input-control select">
                    <asp:DropDownList ID="dpdl_carModel" runat="server" AutoPostBack="False"></asp:DropDownList>
                </div>
                
                <asp:HiddenField ID="hdnCarModel" runat="server" />
                <asp:RequiredFieldValidator ID="requiredCarModel"  CssClass="fg-red" runat="server" ErrorMessage="Please select a valid model" ControlToValidate="dpdl_carModel"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row cells2">
            <div class="cell">
                Colour
            </div>
            <div class="cell">
                <div class="input-control select">
                    <asp:DropDownList ID="dpdl_carColor" runat="server">
                        <asp:ListItem Value>Choose a Colour</asp:ListItem>
                        <asp:ListItem Value="black">Black</asp:ListItem>
                        <asp:ListItem Value="white">White</asp:ListItem>
                        <asp:ListItem Value="lime">Lime</asp:ListItem>
                        <asp:ListItem Value="green">Green</asp:ListItem>
                        <asp:ListItem Value="emerald">Emerald</asp:ListItem>
                        <asp:ListItem Value="teal">Teal</asp:ListItem>
                        <asp:ListItem Value="cyan">Cyan</asp:ListItem>
                        <asp:ListItem Value="cobalt">Cobalt</asp:ListItem>
                        <asp:ListItem Value="indigo">Indigo</asp:ListItem>
                        <asp:ListItem Value="violet">Violet</asp:ListItem>
                        <asp:ListItem Value="pink">Pink</asp:ListItem>
                        <asp:ListItem Value="magenta">Magenta</asp:ListItem>
                        <asp:ListItem Value="crimson">Crimson</asp:ListItem>
                        <asp:ListItem Value="red">Red</asp:ListItem>
                        <asp:ListItem Value="orange">Orange</asp:ListItem>
                        <asp:ListItem Value="amber">Amber</asp:ListItem>
                        <asp:ListItem Value="yellow">Yellow</asp:ListItem>
                        <asp:ListItem Value="brown">Brown</asp:ListItem>
                        <asp:ListItem Value="olive">Olive</asp:ListItem>
                        <asp:ListItem Value="steel">Steel</asp:ListItem>
                        <asp:ListItem Value="mauve">Mauve</asp:ListItem>
                        <asp:ListItem Value="taupe">Taupe</asp:ListItem>
                        <asp:ListItem Value="gray">Grey</asp:ListItem>
                        <asp:ListItem Value="dark">Dark</asp:ListItem>
                        <asp:ListItem Value="darker">Darker</asp:ListItem>
                        <asp:ListItem Value="darkBrown">Dark Brown</asp:ListItem>
                        <asp:ListItem Value="darkCrimson">Dark Crimson</asp:ListItem>
                        <asp:ListItem Value="darkMagenta">Dark Magenta</asp:ListItem>
                        <asp:ListItem Value="darkIndigo">Dark Indigo</asp:ListItem>
                        <asp:ListItem Value="darkCyan">Dark Cyan</asp:ListItem>
                        <asp:ListItem Value="darkCobalt">Dark Cobalt</asp:ListItem>
                        <asp:ListItem Value="darkTeal">Dark Teal</asp:ListItem>
                        <asp:ListItem Value="darkEmerald">Dark Emerald</asp:ListItem>
                        <asp:ListItem Value="darkGreen">Dark Green</asp:ListItem>
                        <asp:ListItem Value="darkOrange">Dark Orange</asp:ListItem>
                        <asp:ListItem Value="darkRed">Dark Red</asp:ListItem>
                        <asp:ListItem Value="darkPink">Dark Pink</asp:ListItem>
                        <asp:ListItem Value="darkViolet">Dark Violet</asp:ListItem>
                        <asp:ListItem Value="darkBlue">Dark Blue</asp:ListItem>
                        <asp:ListItem Value="lightBlue">Light Blue</asp:ListItem>
                        <asp:ListItem Value="lightRed">Light Red</asp:ListItem>
                        <asp:ListItem Value="lightGreen">Light Green</asp:ListItem>
                        <asp:ListItem Value="lighterBlue">Lighter Blue</asp:ListItem>
                        <asp:ListItem Value="lightTeal">Light Teal</asp:ListItem>
                        <asp:ListItem Value="lightOlive">Light Olive</asp:ListItem>
                        <asp:ListItem Value="lightOrange">Light Orange</asp:ListItem>
                        <asp:ListItem Value="lightPink">Light Pink</asp:ListItem>
                        <asp:ListItem Value="grayDark">Grey Dark</asp:ListItem>
                        <asp:ListItem Value="grayDarker">Grey Darker</asp:ListItem>
                        <asp:ListItem Value="grayLight">Grey Light</asp:ListItem>
                        <asp:ListItem Value="grayLighter">Grey Lighter</asp:ListItem>
                    </asp:DropDownList>
                 </div>
                <asp:RequiredFieldValidator ID="requiredCarColour" CssClass="fg-red" runat="server" ErrorMessage="Please select a valid colour" ControlToValidate="dpdl_carColor"></asp:RequiredFieldValidator>
                <div id="colour">&#9608; Sample Colour</div>
            </div>
        </div>

        <div class="row cells2">
            <div class="cell">
                Car Type
            </div>
            <div class="cell">
                <div class="input-control select">
                    <asp:DropDownList ID="dpdl_carType" runat="server">
                        <asp:ListItem Value>Choose a type</asp:ListItem>
                        <asp:ListItem Value="hatchback">Hatchback</asp:ListItem>
                        <asp:ListItem Value="saloon">Saloon</asp:ListItem>
                        <asp:ListItem Value="estate">Estate</asp:ListItem>
                        <asp:ListItem Value="coupe">Coupe</asp:ListItem>
                        <asp:ListItem Value="convertiable">Convertiable</asp:ListItem>
                        <asp:ListItem Value="sedan">Sedan</asp:ListItem>
                        <asp:ListItem Value="suv">SUV</asp:ListItem>
                        <asp:ListItem Value="station wagon">Station Wagon</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                <asp:RequiredFieldValidator ID="requiredCarType"  CssClass="fg-red" runat="server" ErrorMessage="Please select a valid type" ControlToValidate="dpdl_carType"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row">
            <div class="cell">
                <h4>Where is the car, and how much do you want for it</h4>
            </div>
        </div>

        <div class="row cells2">
            <div class="cell">
                Location
            </div>
            <div class="cell">
                <div class="input-control text">
                    <asp:TextBox ID="tbxLocation" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="row cells2">
            <div class="cell">
                Price
            </div>
            <div class="cell">
                <div class="input-control text">
                    <span class="mif-gbp prepend-icon"></span>
                    <asp:TextBox ID="tbxPrice" runat="server"></asp:TextBox>
               </div>
            </div>
        </div>

        <div class="row">
            <div class="cell">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"  />
            </div>
        </div>
    </div>
    <% } else { %>
    
    <% } %>
    
</asp:Content>

