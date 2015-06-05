<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PersonCalendar.aspx.cs" Inherits="CalSpike.PersonCalendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Availability</h1>
    <p>&nbsp;</p>
    <p>Select Person: </p>
    <telerik:RadComboBox ID="rcbPerson" Runat="server" Culture="en-GB" DataSourceID="dsPerson" DataTextField="Name" DataValueField="Id">
    </telerik:RadComboBox>
    <asp:SqlDataSource ID="dsPerson" runat="server" ConnectionString="<%$ ConnectionStrings:CalSpikeConnectionString %>" SelectCommand="SELECT * FROM [Person]"></asp:SqlDataSource>
    <telerik:RadAjaxManager runat="server" ID="AjaxManager" DefaultLoadingPanelID="LoadingPanel">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="pnlAll">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="pnlAll" UpdatePanelCssClass="" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel"></telerik:RadAjaxLoadingPanel>
    <asp:Panel ID="pnlAll" runat="server">
        <telerik:RadScheduler ID="RadScheduler1" runat="server" Height="1024px" DataEndField="EndTime" DataKeyField="Id" DataSourceID="dsAvailability" DataStartField="StartTime" DataSubjectField="Subject" SelectedView="WeekView">
        </telerik:RadScheduler>
        <asp:SqlDataSource ID="dsAvailability" runat="server"
            ConnectionString="<%$ ConnectionStrings:CalSpikeConnectionString %>"
            DeleteCommand="DELETE FROM [Availability] WHERE [Id] = @Id"
            InsertCommand="INSERT INTO [Availability] ([PersonId], [StartTime], [EndTime]) VALUES (@PersonId, @StartTime, @EndTime)"
            SelectCommand="SELECT a.id, p.name, a.starttime, a.endtime FROM [Availability] a inner join person p on a.personid = p.id"
            UpdateCommand="UPDATE [Availability] SET [PersonId] = @PersonId, [StartTime] = @StartTime, [EndTime] = @EndTime WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PersonId" Type="Int32" />
                <asp:Parameter Name="StartTime" Type="DateTime" />
                <asp:Parameter Name="EndTime" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PersonId" Type="Int32" />
                <asp:Parameter Name="StartTime" Type="DateTime" />
                <asp:Parameter Name="EndTime" Type="DateTime" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>