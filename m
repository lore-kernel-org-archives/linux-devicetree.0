Return-Path: <SRS0=EUt7=OT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:57188 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726392AbeLJWUn (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 10 Dec 2018 17:20:43 -0500
Date: Mon, 10 Dec 2018 14:20:40 -0800
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: dts: Add am335x mcasp with l3 data port ranges
Message-ID: <20181210222040.GG6707@atomide.com>
References: <20181205230356.38855-1-tony@atomide.com>
 <3f44b350-17a9-bdf7-33b4-130b6eeae5f0@ti.com>
 <48ee14e0-1361-4840-42c6-f676f2911ce6@ti.com>
 <20181210144851.GZ6707@atomide.com>
 <20181210154426.GB6707@atomide.com>
 <7e50de23-10d3-511b-a16d-4c32ba58a842@ti.com>
 <20181210162123.GC6707@atomide.com>
 <20181210163830.GD6707@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181210163830.GD6707@atomide.com>
Sender: devicetree-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-omap@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

* Tony Lindgren <tony@atomide.com> [181210 16:38]:
> * Tony Lindgren <tony@atomide.com> [181210 16:21]:
> > * Peter Ujfalusi <peter.ujfalusi@ti.com> [181210 16:13]:
> > > am335x-evmsk is still not booting with this patch on top of next-20181210.
> > 
> > Oh interesting.
> 
> OK so to prevent the hwmod code from resetting gpios very
> early, this now might become necessary. Care to try with
> this also applied?

I posted two patches adding more checks for the module flags
so the patch below should no be needed any longer.

Regards,

Tony

> 8< ------------------------
> diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
> --- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
> +++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
> @@ -516,24 +516,8 @@ struct omap_hwmod am33xx_epwmss2_hwmod = {
>  	},
>  };
>  
> -/*
> - * 'gpio' class: for gpio 0,1,2,3
> - */
> -static struct omap_hwmod_class_sysconfig am33xx_gpio_sysc = {
> -	.rev_offs	= 0x0000,
> -	.sysc_offs	= 0x0010,
> -	.syss_offs	= 0x0114,
> -	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_ENAWAKEUP |
> -			  SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET |
> -			  SYSS_HAS_RESET_STATUS),
> -	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
> -			  SIDLE_SMART_WKUP),
> -	.sysc_fields	= &omap_hwmod_sysc_type1,
> -};
> -
>  struct omap_hwmod_class am33xx_gpio_hwmod_class = {
>  	.name		= "gpio",
> -	.sysc		= &am33xx_gpio_sysc,
>  	.rev		= 2,
>  };
>  
