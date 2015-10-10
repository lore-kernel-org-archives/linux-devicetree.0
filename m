From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 09/10] clk: ns2: add clock support for Broadcom Northstar
 2 SoC
Date: Fri, 9 Oct 2015 17:33:52 -0700
Message-ID: <20151010003352.GA26883@codeaurora.org>
References: <1443826665-17570-1-git-send-email-jonmason@broadcom.com>
 <1443826665-17570-10-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443826665-17570-10-git-send-email-jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/02, Jon Mason wrote:
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 23800a1..2790f21 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -2,6 +2,7 @@ menu "Platform selection"
>  
>  config ARCH_BCM_IPROC
>  	bool "Broadcom iProc SoC Family"
> +	select COMMON_CLK_IPROC

Given that this is a visible option, I'd expect the defconfig to
enable this.

>  	help
>  	  This enables support for Broadcom iProc based SoCs
>  
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index d08b3e5..ea81eaa 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -47,7 +47,8 @@ obj-$(CONFIG_COMMON_CLK_WM831X)		+= clk-wm831x.o
>  obj-$(CONFIG_COMMON_CLK_XGENE)		+= clk-xgene.o
>  obj-$(CONFIG_COMMON_CLK_PWM)		+= clk-pwm.o
>  obj-$(CONFIG_COMMON_CLK_AT91)		+= at91/
> -obj-$(CONFIG_ARCH_BCM)			+= bcm/
> +obj-$(CONFIG_CLK_BCM_KONA)		+= bcm/
> +obj-$(CONFIG_COMMON_CLK_IPROC)		+= bcm/

Also, perhaps we need some sort of Kconfig thing for overall bcm
clock drivers, so that we don't have duplicate Makefile rules.

	config COMMON_CLK_BCM
		bool "Support for Broadcom clocks"

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
