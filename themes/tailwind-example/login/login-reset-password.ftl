<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
<div>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "info" >
        ${msg("emailInstruction")}
    <#elseif section = "form">
        <div class="mt-10">
            <form id="kc-reset-password-form" class="${properties.kcFormClass!} space-y-6" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                    <label class="${properties.kcTextStyle!}">${msg("usernameOrEmailLabel")}</label>
                    <#if auth?has_content && auth.showUsername()>
                    <div class="mt-1 relative">
                        <input type="text" id="username" name="username" autofocus value="${auth.attemptedUsername}" class="${properties.kcInputBaseStyle!}<#if messagesPerField.existsError('username','password')>${properties.kcInputValidationStyle!}<#else>${properties.kcInputValidationElseStyle!}</#if>"/>
                    </div>
                    <#else>
                    <div class="mt-1 relative">
                        <input type="text" id="username" name="username" autofocus class="${properties.kcInputBaseStyle!}<#if messagesPerField.existsError('username','password')>${properties.kcInputValidationStyle!}<#else>${properties.kcInputValidationElseStyle!}</#if>"/>
                    </div>
                    </#if>
                </div>
                <button class="${properties.kcButtonPrimaryStyle!}" type="submit">${msg("doSubmit2")}</button>
                <div class="mt-16 flex justify-center">
                    <a href="${url.loginUrl}" class="${properties.kcLinkStyle!}">${kcSanitize(msg("backToLogin"))?no_esc}</a>  
                </div>
            </form>
        </div>
    </#if>
</div>
</@layout.registrationLayout>
