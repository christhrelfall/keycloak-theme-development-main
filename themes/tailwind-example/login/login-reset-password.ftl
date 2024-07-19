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
                    <p style="block text-paragraph tracking-paragraph text-black">${msg("usernameOrEmailLabel")}</p>
                
                        <#if auth?has_content && auth.showUsername()>
                        <div class="mt-1 relative">
                            <input type="text" id="username" name="username" autofocus value="${auth.attemptedUsername}" class="appearance-none w-full px-3 py-2 rounded focus:outline-none border <#if messagesPerField.existsError('username','password')>border-red-500 placeholder-red-500 focus:ring-red-500 focus:border-red-500<#else>border-gray-300 placeholder-gray-400 focus:ring-gray-500 focus:border-gray-500</#if>"/>
                        </div>
                        <#else>
                        <div class="mt-1 relative">
                            <input type="text" id="username" name="username" autofocus class="appearance-none w-full px-3 py-2 rounded focus:outline-none border <#if messagesPerField.existsError('username','password')>border-red-500 placeholder-red-500 focus:ring-red-500 focus:border-red-500<#else>border-gray-300 placeholder-gray-400 focus:ring-gray-500 focus:border-gray-500</#if>"/>
                        </div>
                        </#if>
        
                </div>
                <button class="w-full flex justify-center rounded py-2 px-4 border-4 uppercase text-button font-semibold text-white bg-blue-700 border-none hover:bg-blue-800" type="submit">${msg("doSubmit2")}</button>
                <div class="mt-16 flex justify-center">
                    <a href="${url.loginUrl}" class="text-small tracking-paragraph text-gray-500 hover:text-blue-700">${kcSanitize(msg("backToLogin"))?no_esc}</a>  
                </div>
            </form>
        </div>
    </#if>
</div>
</@layout.registrationLayout>
