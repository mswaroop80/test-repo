<%@include file="aicsriibeJspInit.jsp"%>
<%
pageContext.setAttribute("_pageTitle", AicSriLabelUtil.getLabel("XXSRI_ACC_CA_TITLE"), _pc);
%>
<%@include file="jtfincl.jsp"%>
<%@include file="aiwibeCZzpHeader.jsp"%>
<%@include file="ibeCZzdTop.jsp"%>
<%@include file="aicsriibeCZzpHeader.jsp"%>


<%@page import="oracle.apps.xxsri.membership.common.util.AicSriLog"%>
<%@page import="oracle.apps.xxsri.membership.common.dto.ProgressPaymentMethodDto"%>
<%@page import="oracle.apps.xxsri.membership.common.web.util.MessageUtil"%>
<%@page import="oracle.apps.xxsri.membership.account.bean.session.AccountSessionBean"%>
<%@page import="oracle.apps.xxsri.membership.account.web.util.AccountSessionUtil"%>

<%@page import="org.springframework.util.CollectionUtils"%>
<%@page import="java.util.Iterator"%>


<%@page import="oracle.apps.xxsri.membership.account.bean.AccountContinueApplicationBean"%><jsp:useBean id="accountContinueApplicationBean" scope="request" class="oracle.apps.xxsri.membership.account.bean.AccountContinueApplicationBean"/>
<jsp:setProperty name="accountContinueApplicationBean" property="*" />

<%
AccountSessionBean sessionBean = AccountSessionUtil.getSessionBean((JServSession) session);
AicSriLog logger = new AicSriLog();
%>

<!-- left panel starts -->
<div class="leftContentSingle">
    <div class="panel720">
        <div class="panel">
            <div class="panelLeft">
            </div>
            <h1 id="HtmlHeaderElement" style="width: 710px;">
                <%=AicSriLabelUtil.getLabel("XXSRI_ACC_CA_TITLE")%></h1>
            <div class="panelRight">
            </div>
        </div>

        <div id="ContentPanel" class="panelContent720"> 
            <div class="panelContentDetails"> 
            <% out.println(MessageUtil.showServiceErrors(accountContinueApplicationBean.getErrors())); %>

<form name="mainForm" method="post" action="aicsriaccContinueApplicationProcess.jsp">
    <input type="hidden" name="event"/>
<%
if (CollectionUtils.isEmpty(accountContinueApplicationBean.getApplications())) {
%>
    <%=AicSriLabelUtil.getLabel("XXSRI_ACC_CA_NO_APPLICATIONS")%>
<%
} else {
%>
    <%=AicSriLabelUtil.getLabel("XXSRI_ACC_CA_MESSAGE1")%>
    <table>
<%
    for(Iterator it = accountContinueApplicationBean.getApplications().iterator(); it.hasNext();) {
        ProgressPaymentMethodDto dto = (ProgressPaymentMethodDto)it.next();
        String applicationName = dto.getApplicationName();
%>
        <tr><td><input type="radio" name="application" value="<%=applicationName%>"/></td><td><%=applicationName%></td></tr>
<%
    }
%>
        <tr>
            <td></td>
            <td><span class="AicpaSri2Link" onclick="javascript:return submitEventForm('mainForm', '<%=AccountContinueApplicationBean.EVENT_CONTINUE%>')"><img src="SRI_Images/Continue_Button.gif" alt="ContinueButton" /></span></td>
        </tr>
    </table>
<%
}
%>

    <p><a href="javascript:window.close()"><img src="SRI_Images/Back_Button.gif" alt="BackButton"/></a></p>

</form>
            <!--End panelContentDetails-->
            </div>
            <!-- End ContentPanel-->
            <!-- Left Rounded white corner for the content area-->
            <div id="FooterLeftPanel" class="panelFooterLeft">
            </div>
            <!-- Right Rounded white corner for the content area-->
            <div id="FooterRightPanel" class="panelFooterRight" style="width: 710px;">
            </div>
        </div>
     </div>
</div>

<%@include file="aicsriaccCZzdBottom.jsp"%>