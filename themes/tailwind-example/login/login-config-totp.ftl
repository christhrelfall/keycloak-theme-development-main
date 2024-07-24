<#import "template.ftl" as layout>
<#import "password-commons.ftl" as passwordCommons>
<@layout.registrationLayout; section>

    <#if section = "header">
        ${msg("loginTotpTitle")}
    <#elseif section = "form">
        <ol id="kc-totp-settings" class="list-decimal list-outside pl-5 my-10 space-y-3">
            <li>
                <p class="mb-3">${msg("loginTotpStep1")}</p>    
                <ul id="kc-totp-supported-apps" class="">
                    <#list totp.supportedApplications as app>
                    <li>${msg(app)}</li>
                    </#list>
                </ul>
            </li>

            <#if mode?? && mode = "manual">
                <li>
                    <p>${msg("loginTotpManualStep2")}</p>
                    <p><span id="kc-totp-secret-key">${totp.totpSecretEncoded}</span></p>
                    <p><a href="${totp.qrUrl}" id="mode-barcode" class="${properties.kcLinkStyle!}">${msg("loginTotpScanBarcode")}</a></p>
                </li>
                <li>
                    <p>${msg("loginTotpManualStep3")}</p>
                    <p>
                    <ul>
                        <li id="kc-totp-type">${msg("loginTotpType")}: ${msg("loginTotp." + totp.policy.type)}</li>
                        <li id="kc-totp-algorithm">${msg("loginTotpAlgorithm")}: ${totp.policy.getAlgorithmKey()}</li>
                        <li id="kc-totp-digits">${msg("loginTotpDigits")}: ${totp.policy.digits}</li>
                        <#if totp.policy.type = "totp">
                            <li id="kc-totp-period">${msg("loginTotpInterval")}: ${totp.policy.period}</li>
                        <#elseif totp.policy.type = "hotp">
                            <li id="kc-totp-counter">${msg("loginTotpCounter")}: ${totp.policy.initialCounter}</li>
                        </#if>
                    </ul>
                    </p>
                </li>
            <#else>
                <li>
                    <p>${msg("loginTotpStep2")}</p>
                    <img id="kc-totp-secret-qr-code" src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode" class="max-w-40">
                    <p><a href="${totp.manualUrl}" id="mode-manual" class="${properties.kcLinkStyle!}">${msg("loginTotpUnableToScan")}</a></p>
                </li>
            </#if>
            <li>
                <p class="mb-3">${msg("loginTotpStep3")}</p>
                <p>${msg("loginTotpStep3DeviceName")}</p>
            </li>
        </ol>

        <form action="${url.loginAction}" class="${properties.kcFormClass!} space-y-6" id="kc-totp-settings-form" method="post">
            <div class="${properties.kcFormGroupClass!}">
                    <label for="totp" class="${properties.kcLabelStyle!}">${msg("authenticatorCode")}</label> <span class="required">*</span>
                    <input type="text" id="totp" name="totp" autocomplete="off" class="${properties.kcInputBaseStyle!}<#if messagesPerField.existsError('totp')>${properties.kcInputValidationStyle!}<#else>${properties.kcInputValidationElseStyle!}</#if>"
                           aria-invalid="<#if messagesPerField.existsError('totp')>true</#if>"
                           dir="ltr"
                    />


                <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
                <#if mode??><input type="hidden" id="mode" name="mode" value="${mode}"/></#if>
            </div>

            <div class="${properties.kcFormGroupClass!}">        
                <label for="userLabel" class="${properties.kcLabelStyle!}">${msg("loginTotpDeviceName")}</label> <#if totp.otpCredentials?size gte 1><span class="required">*</span></#if>
                <input type="text" class="${properties.kcInputBaseStyle!}${properties.kcInputValidationElseStyle!}" id="userLabel" name="userLabel" autocomplete="off"
                        aria-invalid="<#if messagesPerField.existsError('userLabel')>true</#if>" dir="ltr"
                />
                <#if messagesPerField.existsError('userLabel')>
                    <span id="input-error-otp-label" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('userLabel'))?no_esc}
                    </span>
                </#if>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <@passwordCommons.logoutOtherSessions/>
            </div>

            <#if isAppInitiatedAction??>
                <input type="submit"
                       class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}"
                       id="saveTOTPBtn" value="${msg("doSubmit")}"
                />
                <button type="submit"
                        class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!} ${properties.kcButtonLargeClass!}"
                        id="cancelTOTPBtn" name="cancel-aia" value="true" />${msg("doCancel")}
                </button>
            <#else>
                <button type="submit" class="${properties.kcButtonPrimaryStyle!}" id="saveTOTPBtn">${msg("doSubmit")}</button>
            </#if>
        </form>
    </#if>
</@layout.registrationLayout>