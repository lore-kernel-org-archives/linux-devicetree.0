Return-Path: <rdunlap@infradead.org>
Message-ID: <5373C2EB.8020806@infradead.org>
Date: Wed, 14 May 2014 12:24:27 -0700
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] bus: add Broadcom GISB bus arbiter timeout/error
 handler
References: <1400094649-11193-1-git-send-email-f.fainelli@gmail.com> <1400094649-11193-3-git-send-email-f.fainelli@gmail.com>
In-Reply-To: <1400094649-11193-3-git-send-email-f.fainelli@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org
Cc: marc.ceeeee@gmail.com, computersforpeace@gmail.com, gregory.0xf0@gmail.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Pitre <nicolas.pitre@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Alexander Shiyan <shc_work@mail.ru>, Huang Shijie <b32955@freescale.com>, DOCUMENTATION <linux-doc@vger.kernel.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 05/14/2014 12:10 PM, Florian Fainelli wrote:
> This patch adds support for the Broadcom GISB arbiter bus timeout/error
> handler. GISB is a proprietary bus used by Broadcom Set Top Box
> System-on-a-chip devices (BCM7xxx) which allows multiple masters and
> clients to be interfaced with each other.
> 
> The bus arbiter offers support for generating two interrupts towards the
> host CPU, thus allowing us to "catch" clock gated masters, or masters
> being volontarily blocked for powersaving purposes, or do general system
> troubleshooting.
> 
> We also register a hook with the ARM fault exception handling to allow
> printing a more informative message than "imprecise external abort at
> 0x00000000" for instance.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  drivers/bus/Kconfig        |  11 +-
>  drivers/bus/Makefile       |   1 +
>  drivers/bus/brcmstb_gisb.c | 289 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 300 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/bus/brcmstb_gisb.c
> 
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index 552373c4e362..985db51c0b11 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -40,5 +40,14 @@ config ARM_CCI
>  	depends on ARM
>  	help
>  	  Driver supporting the CCI cache coherent interconnect for ARM
> -	  platforms.
> +	  kplatforms.

Is that a typo?  if not, what are kplatforms?

> +
> +config BRCMSTB_GISB_ARB
> +	bool "Broadcom STB GISB bus arbiter"
> +	depends on ARM
> +	help
> +	  Driver for the Broadcom Set Top Box System-on-a-chip internal bus
> +	  arbiter. This driver provides timeout and target abort error handling
> +	  and internal bus master decoding.
> +
>  endmenu


-- 
~Randy
