<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="testDemo.aspx.cs" Inherits="testDemo" %>

<%@ Register Src="~/UserControl/uc_Tag.ascx" TagName="uc_Tag" TagPrefix="uc" %>
<%@ Register TagPrefix="uc" Namespace="TxHumor.Common.WebControls" Assembly="TxHumor.Common" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
    <div id="wrapper">
        <div class="layout fn-clear">
            <div class="ui-main">
                <asp:Repeater runat="server" ID="rpt_humorList">
                    <HeaderTemplate>
                        <!--头部模板,放表格开始及第一行标题-->
                        <table class="ts">
                            <!--插入表格时只需插入两行即可，显示数据时是根据数据库表循环显示的-->
                            <tr>
                                <th>
                                    内容
                                </th>
                                <th>
                                    创建者
                                </th>
                                <th>
                                    ip
                                </th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <!--项目模板，会进行循环显示，放置表格第二行-->
                        <tr>
                            <td>
                                <%#Eval("CommentContent")%>
                                <!--HTMl中插入其他代码需要用<% %>括起来，Eval("数据库中的字段名")-->
                            </td>
                            <td>
                                <%#Eval("CreateUserName")%>
                            </td>
                            <td>
                                <%#Eval("IpAddress")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        <!--底部模板-->
                        </table>
                        <!--表格结束部分-->
                    </FooterTemplate>
                </asp:Repeater>
                <!-- // ui-pages end -->
                <div class="ui-module-pages fn-clear">
                    <uc:AspNetPager ID="pager_down" PageSize="10" runat="server" PageDivCSS="ui-pages">
                    </uc:AspNetPager>
                </div>
                <!-- // ui-module-pages end -->
            </div>
            <!--右边 开始-->
            <uc:uc_Tag ID="Tags" runat="server" />
            <!--右边 结束-->
        </div>
    </div>
</asp:Content>
