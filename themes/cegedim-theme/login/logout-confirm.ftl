<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("logoutConfirmTitle")}
    <#elseif section = "form">
        <div id="kc-logout-confirm" class="mt-10">
            <p class="instruction">${msg("logoutConfirmHeader")}</p>

            <form class="space-y-6" action="${url.logoutConfirmAction}" method="POST">
                <input type="hidden" name="session_code" value="${logoutConfirm.code}">
                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                        <button tabindex="4"
                               class="${properties.kcButtonPrimaryStyle!}"
                               name="confirmLogout" id="kc-logout" type="submit">
                               ${msg("doLogout")}
                        </button>
                    </div>

                </div>
            </form>

            <div class="mt-6 flex justify-center">
                <#if logoutConfirm.skipLink>
                <#else>
                    <#if (client.baseUrl)?has_content>
                        <p><a href="${client.baseUrl}" class="${properties.kcLinkStyle}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                    </#if>
                </#if>
            </div>

        </div>
    </#if>
</@layout.registrationLayout>