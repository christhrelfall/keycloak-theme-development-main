<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
    <div class="mt-10">
        <form id="kc-passwd-update-form" class="space-y-6" action="${url.loginAction}" method="post">
            
            <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
            <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>
            
            <div class="${properties.kcFormGroupClass!}">
                <label for="password-new" class="mb-2 ${properties.kcLabelStyle!}">${msg("passwordNew")}</label>
                <input type="password" id="password-new" name="password-new" class="${properties.kcInputBaseStyle!}<#if messagesPerField.existsError('username','password')>${properties.kcInputValidationStyle!}<#else>${properties.kcInputValidationElseStyle!}</#if>" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" autofocus autocomplete="new-password" />
			</div>
            
            <div class="${properties.kcFormGroupClass!}">
                <label for="password-confirm" class="${properties.kcLabelStyle!}">${msg("passwordConfirm")}</label>
                <input type="password" id="password-confirm" name="password-confirm" class="${properties.kcInputBaseStyle!}<#if messagesPerField.existsError('username','password')>${properties.kcInputValidationStyle!}<#else>${properties.kcInputValidationElseStyle!}</#if>" autocomplete="new-password" />
            </div>
            
            <div class="${properties.kcFormGroupClass!}">
                <button type="submit" class="${properties.kcButtonPrimaryStyle}">
                    ${msg("doSubmit2")}
                </button>
            </div>
        </form>
    </div>
    </#if>
</@layout.registrationLayout>