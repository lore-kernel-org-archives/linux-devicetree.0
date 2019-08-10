Return-Path: <SRS0=/AEK=WG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37531 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbfHJC0n (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 9 Aug 2019 22:26:43 -0400
Received: by mail-pl1-f195.google.com with SMTP id b3so45708604plr.4
        for <devicetree@vger.kernel.org>; Fri, 09 Aug 2019 19:26:42 -0700 (PDT)
Subject: Re: [PATCH v2] of/fdt: implement a "merge-cmdline" property
References: <1565020400-25679-1-git-send-email-daniel@gimpelevich.san-francisco.ca.us>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <6772aab0-a4eb-55dc-657d-0f2b67b0d163@gmail.com>
Date: Fri, 9 Aug 2019 19:26:40 -0700
MIME-Version: 1.0
In-Reply-To: <1565020400-25679-1-git-send-email-daniel@gimpelevich.san-francisco.ca.us>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, devicetree@vger.kernel.org
Cc: Paul Burton <paul.burton@mips.com>, Frank Rowand <frowand.list@gmail.com>
List-ID: <devicetree@vger.kernel.org>

+Frank (me)

On 8/5/19 8:53 AM, Daniel Gimpelevich wrote:
> Currently, "bootargs" supplied via the "chosen" node can be used only to
> supply a kernel command line as a whole. No mechanism exists in DT to add
> bootargs to the existing command line instead. This is needed in order to
> avoid having to update the bootloader or default bootloader config when
> upgrading to a DTB and kernel pair that requires bootargs not previously
> needed.
> 
> One example use case is that OpenWrt currently supports four ARM devices by
> means of locally applying the previously rejected edition of this patch. So
> far, the patch has been used in production only on ARM, but architecture is
> not a distinction in the design.
> 
> On MIPS, Commit 951d223 ("MIPS: Fix CONFIG_CMDLINE handling") currently
> prevents support of such a mechanism, so I am including a workaround, in
> anticipation of upcoming changes.
> 
> Signed-off-by: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
> Fixes: 951d223 ("MIPS: Fix CONFIG_CMDLINE handling")
> References: https://patchwork.linux-mips.org/patch/17659/
> ---
>  arch/mips/kernel/setup.c | 12 ++++++++----
>  drivers/of/fdt.c         |  9 +++++++--
>  2 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index ab349d2..9ce58f2 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -725,7 +725,10 @@ static void __init arch_mem_init(char **cmdline_p)
>  	 * CONFIG_CMDLINE ourselves below & don't want to duplicate its
>  	 * content because repeating arguments can be problematic.
>  	 */
> -	strlcpy(boot_command_line, " ", COMMAND_LINE_SIZE);
> +	if (USE_DTB_CMDLINE)
> +		strlcpy(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
> +	else
> +		strlcpy(boot_command_line, " ", COMMAND_LINE_SIZE);
>  
>  	/* call board setup routine */
>  	plat_mem_setup();
> @@ -753,9 +756,10 @@ static void __init arch_mem_init(char **cmdline_p)
>  #if defined(CONFIG_CMDLINE_BOOL) && defined(CONFIG_CMDLINE_OVERRIDE)
>  	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
>  #else
> -	if ((USE_PROM_CMDLINE && arcs_cmdline[0]) ||
> -	    (USE_DTB_CMDLINE && !boot_command_line[0]))
> +	if (USE_PROM_CMDLINE)
>  		strlcpy(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
> +	else if (!strcmp(boot_command_line, " "))
> +		boot_command_line[0] = '\0';
>  
>  	if (EXTEND_WITH_PROM && arcs_cmdline[0]) {
>  		if (boot_command_line[0])
> @@ -764,7 +768,7 @@ static void __init arch_mem_init(char **cmdline_p)
>  	}
>  
>  #if defined(CONFIG_CMDLINE_BOOL)
> -	if (builtin_cmdline[0]) {
> +	if (builtin_cmdline[0] && strcmp(boot_command_line, builtin_cmdline)) {
>  		if (boot_command_line[0])
>  			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
>  		strlcat(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 9cdf14b..08c25eb 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1055,8 +1055,13 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  
>  	/* Retrieve command line */
>  	p = of_get_flat_dt_prop(node, "bootargs", &l);
> -	if (p != NULL && l > 0)
> -		strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
> +	if (p != NULL && l > 0) {
> +		if (!of_get_flat_dt_prop(node, "merge-cmdline", NULL))
> +			*(char *)data = '\0';
> +		if (*(char *)data)
> +			strlcat(data, " ", COMMAND_LINE_SIZE);
> +		strlcat(data, p, min(l + strlen(data), COMMAND_LINE_SIZE));
> +	}
>  
>  	/*
>  	 * CONFIG_CMDLINE is meant to be a default in case nothing else
> 
