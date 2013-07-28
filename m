Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:40751 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750831Ab3G1Etp (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sun, 28 Jul 2013 00:49:45 -0400
Received: by mail-pd0-f178.google.com with SMTP id w10so1436915pde.9
        for <devicetree@vger.kernel.org>; Sat, 27 Jul 2013 21:49:44 -0700 (PDT)
From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH] of: Feed entire flattened device tree into the random pool
In-Reply-To: <20130725143031.16af0a96@kryten>
References: <20130725125122.78accf44@kryten> <20130725031717.GB15673@concordia> <20130725143031.16af0a96@kryten>
Date: Sat, 27 Jul 2013 22:49:42 -0600
Message-Id: <20130728044942.A58793E0A24@localhost>
Sender: devicetree-owner@vger.kernel.org
To: Anton Blanchard <anton@samba.org>, Michael Ellerman <michael@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>

On Thu, 25 Jul 2013 14:30:31 +1000, Anton Blanchard <anton@samba.org> wrote:
> 
> Hi Michael,
> 
> > But why not put the initcall in drivers/of/fdt.c, that way it's not
> > early but it's still common ?
> 
> Good idea! How does this look? So long as it happens before
> module_init(rand_initialize) we should be good.
> 
> Anton
> --
> 
> We feed the entire DMI table into the random pool to provide
> better random data during early boot, so do the same with the
> flattened device tree.
> 
> Signed-off-by: Anton Blanchard <anton@samba.org>
> ---
> 
> v2: move to drivers/of/fdt.c as suggested by Michael Ellerman
> 
> Index: b/drivers/of/fdt.c
> ===================================================================
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -17,6 +17,7 @@
>  #include <linux/string.h>
>  #include <linux/errno.h>
>  #include <linux/slab.h>
> +#include <linux/random.h>
>  
>  #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
>  #ifdef CONFIG_PPC
> @@ -714,3 +715,14 @@ void __init unflatten_device_tree(void)
>  }
>  
>  #endif /* CONFIG_OF_EARLY_FLATTREE */
> +
> +/* Feed entire flattened device tree into the random pool */
> +static int __init add_fdt_randomness(void)
> +{
> +	if (initial_boot_params)
> +		add_device_randomness(initial_boot_params,
> +				      initial_boot_params->totalsize);

be32_to_cpu(initial_boot_params->totalsize);

g.

