<#macro registrationLayout displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false
	showAnotherWayIfPresent=true>
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
		<link rel="stylesheet" href="https://use.typekit.net/bry2lcg.css">
		<link rel="stylesheet" href="${url.resourcesPath}/css/styles.css" />
	</head>
	<body class="xl:grid grid-flow-col auto-cols-[7fr_3.5fr] h-full text-slate-800">

		<div class="bg-[#F4F4FC] hidden xl:flex items-center justify-center">
			<div class="text-center space-y-3">	
				<img src="${url.resourcesPath}/img/ServicesOpsLogin.png" alt="" class="max-w-[25vw] mx-auto">
				<h1 class="text-4xl font-medium font-serif">Recording a service has <br> never been so quick and easy</h1>
			</div>
		</div>

		<div class="xl:overflow-y-scroll h-full">

			<div class="max-w-[660px] xl:max-w-none mx-auto flex flex-col justify-between justify-center py-12 px-[5vw] min-h-full">
	
				<header class="">
					<img class="mx-auto w-[200px]" src="${url.resourcesPath}/img/ps_logo.svg" alt="" />
				</header>
				
				<section class="py-16">
					<h1 class="text-2xl mb-10"><#nested "header"></h1>
					<#if displayInfo>
					<div id="kc-info" class="mb-10">
						<#nested "info">
					</div>
					</#if>
					<#if displayMessage && message?has_content && (message.type != ' warning' || !isAppInitiatedAction??)>
						<#if message.type='success'>
							<div class="flex items-center gap-2 p-3 rounded bg-[#dcf1ea]">
								<svg class="min-h-6 min-w-6 h-6 w-6 text-emerald-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" fill="currentColor">
									<path d="M428.28-331.22 669.87-571.8l-57.46-57.7-184.13 183.13-82.13-81.13-57.45 57.7 139.58 138.58ZM480-87.87q-80.91 0-152.34-30.62-71.44-30.62-125-84.17-53.55-53.56-84.17-125Q87.87-399.09 87.87-480q0-81.91 30.62-152.84 30.62-70.94 84.17-124.5 53.56-53.55 125-84.17 71.43-30.62 152.34-30.62 81.91 0 152.84 30.62 70.94 30.62 124.5 84.17 53.55 53.56 84.17 124.5 30.62 70.93 30.62 152.84 0 80.91-30.62 152.34-30.62 71.44-84.17 125-53.56 53.55-124.5 84.17Q561.91-87.87 480-87.87Z" />
								</svg>
								<p class="${properties.kcFeedbackSuccessIcon!}">${kcSanitize(message.summary)?no_esc}</p>
							</div>
						</#if>
						<#if message.type='warning' && message.summary?has_content>
							<div class="flex items-center gap-2 p-3 rounded bg-[#f5ede1]">
								<svg class="min-h-6 min-w-6 h-6 w-6 text-orange-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" fill="currentColor">
									<path d="M41.07-139.93 480-872.13l438.93 732.2H41.07Zm438.72-124.79q15.45 0 26.43-10.77 10.98-10.76 10.98-26.21 0-15.45-10.77-26.31t-26.22-10.86q-15.45 0-26.43 10.65t-10.98 26.1q0 15.45 10.77 26.42 10.77 10.98 26.22 10.98ZM444-384h72v-189.37h-72V-384Z" />
								</svg>
								<p class="${properties.kcFeedbackWarningIcon!}">${kcSanitize(message.summary)?no_esc}</p>
							</div>
						</#if>
						<#if message.type='error'>
							<div class="flex items-center gap-2 p-3 rounded bg-red-100">
								<svg class="min-h-6 min-w-6 h-6 w-6 text-red-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" fill="currentColor">
									<path d="M479.73-279.87q18.14 0 30.67-12.27 12.53-12.26 12.53-30.4 0-18.13-12.26-30.79-12.27-12.65-30.4-12.65-18.14 0-30.67 12.44-12.53 12.44-12.53 30.58 0 18.13 12.26 30.61 12.27 12.48 30.4 12.48ZM438.5-431.52h83v-245.5h-83v245.5Zm41.78 343.65q-81.19 0-152.62-30.62-71.44-30.62-125-84.17-53.55-53.56-84.17-124.95Q87.87-399 87.87-480.46q0-81.45 30.62-152.38 30.62-70.94 84.17-124.5 53.56-53.55 124.95-84.17 71.39-30.62 152.85-30.62 81.45 0 152.38 30.62 70.94 30.62 124.5 84.17 53.55 53.56 84.17 124.72 30.62 71.16 30.62 152.34 0 81.19-30.62 152.62-30.62 71.44-84.17 125-53.56 53.55-124.72 84.17-71.16 30.62-152.34 30.62Z" />
								</svg>
								<p class="${properties.kcFeedbackErrorIcon!}">${kcSanitize(message.summary)?no_esc}</p>
							</div>
						</#if>
						<#if message.type='info'>
							<div class="flex items-center gap-2 p-3 rounded bg-[#e3e8fb]">
								<svg class="min-h-6 min-w-6 h-6 w-6 text-blue-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" fill="currentColor">
									<path d="M440.41-284.41h79.18V-528h-79.18v243.59Zm39.38-310.81q17.24 0 29.12-11.66 11.87-11.67 11.87-28.91 0-17.24-11.66-29.12-11.67-11.87-28.91-11.87-17.24 0-29.12 11.66-11.87 11.67-11.87 28.91 0 17.24 11.66 29.12 11.67 11.87 28.91 11.87Zm.49 507.35q-81.19 0-152.62-30.62-71.44-30.62-125-84.17-53.55-53.56-84.17-124.95Q87.87-399 87.87-480.46q0-81.45 30.62-152.38 30.62-70.94 84.17-124.5 53.56-53.55 124.95-84.17 71.39-30.62 152.85-30.62 81.45 0 152.38 30.62 70.94 30.62 124.5 84.17 53.55 53.56 84.17 124.72 30.62 71.16 30.62 152.34 0 81.19-30.62 152.62-30.62 71.44-84.17 125-53.56 53.55-124.72 84.17-71.16 30.62-152.34 30.62Z" />
								</svg>
								<p class="${properties.kcFeedbackInfoIcon!}">${kcSanitize(message.summary)?no_esc}</p>
							</div>
						</#if>
					</#if>
					<#nested "form">
				</section>

				<footer class="">
					<nav class="flex flex-wrap justify-center" aria-label="Footer">
						<div class="px-5 py-2">
							<a href="${properties.kcTermsLink!}" target="_blank" rel="noopener noreferrer" class="${properties.kcLinkStyle!}"> Terms Notice</a>
						</div>
						<div class="px-5 py-2">
							<a href="${properties.kcPrivacyLink!}" target="_blank" rel="noopener noreferrer" class="${properties.kcLinkStyle!}">Privacy Policy</a>
						</div>
					</nav>
				</footer>
		
			</div>
		</div>

	</body>

</html>
</#macro>