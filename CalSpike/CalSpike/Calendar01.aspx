<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendar01.aspx.cs" Inherits="CalSpike.Calendar01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Calendar</h1>
    <telerik:RadAjaxManager runat="server" ID="AjaxManager" DefaultLoadingPanelID="LoadingPanel">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadScheduler1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadScheduler1" UpdatePanelCssClass="" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel"></telerik:RadAjaxLoadingPanel>
    <telerik:RadScheduler ID="RadScheduler1" runat="server" Height="1024px" DataEndField="EndTime" DataKeyField="Id" DataSourceID="dsAppointments" DataStartField="StartTime" DataSubjectField="Subject">
    </telerik:RadScheduler>
    <asp:SqlDataSource ID="dsAppointments" runat="server" ConnectionString="<%$ ConnectionStrings:CalSpikeConnectionString %>" DeleteCommand="DELETE FROM [Appointment] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Appointment] ([Subject], [ClaimId], [StartTime], [EndTime], [IsFulfilled]) VALUES (@Subject, @ClaimId, @StartTime, @EndTime, @IsFulfilled)" SelectCommand="SELECT * FROM [Appointment]" UpdateCommand="UPDATE [Appointment] SET [Subject] = @Subject, [ClaimId] = @ClaimId, [StartTime] = @StartTime, [EndTime] = @EndTime, [IsFulfilled] = @IsFulfilled WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="ClaimId" Type="Int32" />
            <asp:Parameter Name="StartTime" Type="DateTime" />
            <asp:Parameter Name="EndTime" Type="DateTime" />
            <asp:Parameter Name="IsFulfilled" Type="Boolean" DefaultValue="False" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="ClaimId" Type="Int32" />
            <asp:Parameter Name="StartTime" Type="DateTime" />
            <asp:Parameter Name="EndTime" Type="DateTime" />
            <asp:Parameter Name="IsFulfilled" Type="Boolean" DefaultValue="False" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>