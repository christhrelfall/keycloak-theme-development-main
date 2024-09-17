<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("loginTotpTitle")}
    <#elseif section = "info" >
        ${msg("loginTotpInstruction")}
    <#elseif section="form">
        <form id="kc-otp-login-form" class="mt-10 space-y-6" action="${url.loginAction}"
            method="post">
            <#if otpLogin.userOtpCredentials?size gt 1>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcInputWrapperClass!}">
                        <#list otpLogin.userOtpCredentials as otpCredential>
                            <input id="kc-otp-credential-${otpCredential?index}" class="${properties.kcLoginOTPListInputClass!}" type="radio" name="selectedCredentialId" value="${otpCredential.id}" <#if otpCredential.id == otpLogin.selectedCredentialId>checked="checked"</#if>>
                            <label for="kc-otp-credential-${otpCredential?index}" class="${properties.kcLoginOTPListClass!}" tabindex="${otpCredential?index}">
                                <span class="${properties.kcLoginOTPListItemHeaderClass!}">
                                    <span class="${properties.kcLoginOTPListItemIconBodyClass!}">
                                      <i class="${properties.kcLoginOTPListItemIconClass!}" aria-hidden="true"></i>
                                    </span>
                                    <span class="${properties.kcLoginOTPListItemTitleClass!}">${otpCredential.userLabel}</span>
                                </span>
                            </label>
                        </#list>
                    </div>
                </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <label for="otp" class="${properties.kcLabelStyle!}">${msg("loginOtpOneTime")}</label>
                <input id="otp" name="otp" autocomplete="off" type="text" class="${properties.kcInputBaseStyle!}<#if messagesPerField.existsError('totp')>${properties.kcInputValidationStyle!}<#else>${properties.kcInputValidationElseStyle!}</#if>"
                       autofocus aria-invalid="<#if messagesPerField.existsError('totp')>true</#if>"
                       dir="ltr" />
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <button
                        class="${properties.kcButtonPrimaryStyle!}"
                        name="login" id="kc-login" type="submit">${msg("doLogIn")}</button>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>