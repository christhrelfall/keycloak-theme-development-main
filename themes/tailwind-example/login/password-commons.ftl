<#macro logoutOtherSessions>
    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
        <div class="${properties.kcFormOptionsWrapperClass!}">
            <div class="flex items-center">
                <input class="${properties.kcCheckBoxStyle!}" type="checkbox" id="logout-sessions" name="logout-sessions" value="on" checked>
                <label class="${properties.kcLabelStyle!}" for="logout-sessions">
                    ${msg("logoutOtherSessions")}
                </label>
            </div>
        </div>
    </div>
</#macro>
