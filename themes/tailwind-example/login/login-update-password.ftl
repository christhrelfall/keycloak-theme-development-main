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
                <label for="password-new" class="block text-paragraph tracking-paragraph text-black">${msg("passwordNew")}</label>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password-new" name="password-new" class="appearance-none w-full px-3 py-2 rounded focus:outline-none border <#if messagesPerField.existsError('username','password')>border-red-500 placeholder-red-500 focus:ring-red-500 focus:border-red-500<#else>border-gray-300 placeholder-gray-400 focus:ring-gray-500 focus:border-gray-500</#if>" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" autofocus autocomplete="new-password" />
                </div>
			</div>
            
            <div class="${properties.kcFormGroupClass!}">
                <label for="password-confirm" class="block text-paragraph tracking-paragraph text-black">${msg("passwordConfirm")}</label>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password-confirm" name="password-confirm" class="appearance-none w-full px-3 py-2 rounded focus:outline-none border <#if messagesPerField.existsError('username','password')>border-red-500 placeholder-red-500 focus:ring-red-500 focus:border-red-500<#else>border-gray-300 placeholder-gray-400 focus:ring-gray-500 focus:border-gray-500</#if>" autocomplete="new-password" />
                </div>
            </div>
            
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                    </div>
                </div>
                
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <button type="submit" class="w-full flex justify-center rounded py-2 px-4 border-4 uppercase text-button font-semibold text-white bg-blue-700 border-none hover:bg-blue-800">
                        ${msg("doSubmit2")}
                    </button>
                </div>
            </div>
        </form>
    </div>
    </#if>
</@layout.registrationLayout>