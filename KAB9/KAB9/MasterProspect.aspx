<%@ Page Title="" Language="C#" MasterPageFile="~/MasterProspect.Master" AutoEventWireup="true" CodeBehind="MasterProspect.aspx.cs" Inherits="KAB9.MasterProspect1" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="table-responsive">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Produkter</th>
                    <th>Beskrivning</th>
                    <th>Pris(kr)</th>
                    <th>Lagersaldo</th>
                    <th>Lägg till i varukorg</th>
                </tr>
            </thead>
            <tbody>
                <asp:Literal ID="myLiteral" runat="server"></asp:Literal>
            </tbody>
        </table>
    </div>
</asp:Content>
