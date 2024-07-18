<#macro loginLayout>
	<!DOCTYPE html>
	<html class="h-full">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="robots" content="noindex, nofollow">
		<#if properties.meta?has_content>
			<#list properties.meta?split(' ') as meta>
				<meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
			</#list>
		</#if>
		<title>${msg("loginTitle",(realm.displayName!''))}</title>
		<link rel="icon" href="${url.resourcesPath}/img/ps_logo.svg" />
		<link rel="stylesheet" href="${url.resourcesPath}/css/styles.css" />
	</head>
	<body class="grid grid-flow-col auto-cols-[3.5fr_7fr] h-full">

		<div class="flex flex-col justify-between justify-center p-12">
			
			<header class="">
				<img class="mx-auto w-[200px]" src="${url.resourcesPath}/img/ps_logo.svg" alt="" />
				<!-- <h1 class="mt-6 text-center text-header2 tracking-header2 font-semibold text-black">
					${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}
				</h1>
				<p class="mt-2 text-paragraph tracking-paragraph text-black">
					<#nested "description">
				</p> -->
			</header>

			<#nested "main">

			<footer class="">
				<nav class="flex flex-wrap justify-center" aria-label="Footer">
					<div class="px-5 py-2">
						<a href="https://trigodev.com/?utm_source=sso&utm_medium=login_page" target="_blank" rel="noopener noreferrer"
							class="text-small text-gray-500 hover:text-blue-700 hover-pointer">
							Our Company
						</a>
					</div>
					<div class="px-5 py-2">
						<a href="https://trigodev.com/legal-notice?utm_source=sso&utm_medium=login_page" target="_blank" rel="noopener noreferrer"
							class="text-small text-gray-500 hover:text-blue-700 hover-pointer">
							Legal Notice
						</a>
					</div>
					<div class="px-5 py-2">
						<a href="https://trigodev.com/privacy?utm_source=sso&utm_medium=login_page" target="_blank" rel="noopener noreferrer"
							class="text-small text-gray-500 hover:text-blue-700 hover-pointer">
							Privacy Policy
						</a>
					</div>
				</nav>
			</footer>

		</div>

		<div class="bg-blue-700 h-full w-full">
			
		</div>
			
	</body>
</html>
</#macro>